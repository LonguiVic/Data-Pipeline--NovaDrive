from datetime import datetime, timedelta

from airflow.decorators import dag, task

from airflow.providers.postgres.hooks.postgres import PostgresHook

from airflow.providers.snowflake.hooks.snowflake import SnowflakeHook

from airflow.utils.log.logging_mixin import LoggingMixin


default_args = {

    'owner': 'airflow',

    'depends_on_past': False,

    'start_date': datetime(2024, 1, 1),

    'email_on_failure': False,

    'email_on_retry': False,

    'retries': 0,

    'retry_delay': timedelta(minutes=5)

}


@dag(

    dag_id='postgres_to_snowflake_optimized',

    default_args=default_args,

    description='Load data incrementally from Postgres to Snowflake with optimizations',

    schedule_interval=timedelta(days=1),

    catchup=False,

    max_active_runs=1

)

def postgres_to_snowflake_etl():

    logger = LoggingMixin().log


    table_names = [

        'veiculos',

        'estados',

        'cidades',

        'concessionarias',

        'vendedores',

        'clientes',

        'vendas'

    ]


    @task

    def get_max_primary_key(table_name: str):

        logger.info(f"Starting task to get max ID for table: {table_name}")

        with SnowflakeHook(snowflake_conn_id='snowflake').get_conn() as conn:

            with conn.cursor() as cursor:

                cursor.execute(f"SELECT MAX(ID_{table_name}) FROM {table_name}")

                max_id = cursor.fetchone()[0]

                logger.info(f"Max ID for table {table_name} is: {max_id}")

                return max_id if max_id is not None else 0

                

    @task

    def load_incremental_data(table_name: str, max_id: int):

        logger.info(f"Starting data load for table: {table_name} from Postgres to Snowflake")

        with PostgresHook(postgres_conn_id='postgres').get_conn() as pg_conn:

            with pg_conn.cursor() as pg_cursor:

                primary_key = f'ID_{table_name}'

                

                logger.info(f"Fetching columns for table: {table_name}")

                pg_cursor.execute(f"SELECT column_name FROM information_schema.columns WHERE table_name = '{table_name}'")

                columns = [row[0] for row in pg_cursor.fetchall()]

                columns_list_str = ', '.join(columns)

                placeholders = ', '.join(['%s'] * len(columns))


                logger.info(f"Fetching data from Postgres for table: {table_name} with max ID greater than {max_id}")

                pg_cursor.execute(f"SELECT {columns_list_str} FROM {table_name} WHERE {primary_key} > {max_id}")

                rows = pg_cursor.fetchall()


                if rows:

                    logger.info(f"Inserting data into Snowflake for table: {table_name}")

                    with SnowflakeHook(snowflake_conn_id='snowflake').get_conn() as sf_conn:

                        with sf_conn.cursor() as sf_cursor:

                            insert_query = f"INSERT INTO {table_name} ({columns_list_str}) VALUES ({placeholders})"

                            sf_cursor.executemany(insert_query, rows)

                            logger.info(f"Inserted {len(rows)} rows into table: {table_name}")


    for table_name in table_names:

        max_id = get_max_primary_key(table_name)

        load_incremental_data(table_name, max_id)

