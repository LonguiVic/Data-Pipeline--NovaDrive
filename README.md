# Data Pipeline - NovaDrive

## Descrição do Projeto

Este projeto consiste na criação de um pipeline de dados automatizado, utilizando **Airflow** para orquestração, **Docker** para containerização dos serviços, **Snowflake** como Data Warehouse, **PostgreSQL** para armazenamento de dados brutos e **dbt** para transformação de dados. O objetivo principal é demonstrar um processo completo de ETL/ELT, desde a ingestão de dados até a transformação e carregamento final em Snowflake.

## Arquitetura do Projeto

O pipeline foi construído com a seguinte arquitetura:

1. **Ingestão de Dados**: Os dados são carregados de um banco de dados PostgreSQL.
2. **Orquestração**: Utilizando o **Apache Airflow**, o fluxo do pipeline é gerenciado e agendado.
3. **Transformação**: O **dbt** é responsável pela transformação dos dados para modelagem em Snowflake.
4. **Armazenamento Final**: Os dados transformados são armazenados no **Snowflake**, permitindo consultas otimizadas.

### Diagrama de Arquitetura

![image](https://github.com/user-attachments/assets/1b6d3bf6-0f8f-4370-8fc9-41c22e30a7f0)


## Tecnologias Utilizadas

- **[PostgreSQL](https://www.postgresql.org/)**: Banco de dados relacional utilizado para armazenar dados brutos.
- **[Apache Airflow](https://airflow.apache.org/)**: Orquestrador de workflows para gerenciar e agendar as tarefas do pipeline.
- **[Docker](https://www.docker.com/)**: Utilizado para containerizar todos os serviços, facilitando a replicação do ambiente.
- **[Snowflake](https://www.snowflake.com/)**: Data warehouse para armazenamento final e consultas analíticas dos dados.
- **[dbt](https://www.getdbt.com/)**: Ferramenta de transformação de dados, utilizada para criar modelos SQL e materializar tabelas.

## DAGs

![image](https://github.com/user-attachments/assets/4e5f61f6-8e48-49e1-887f-9312c0f8b440)
![image](https://github.com/user-attachments/assets/d4b6364e-381b-4d54-a604-46da07f5adeb)
![image](https://github.com/user-attachments/assets/cf6270b9-5dd8-464a-8d1d-b13380e1a9d7)
![image](https://github.com/user-attachments/assets/5f75c48c-dfc3-4919-ab5d-4f565bcabab3)
![image](https://github.com/user-attachments/assets/752129ac-468e-4b16-892b-85ad23311313)
![image](https://github.com/user-attachments/assets/c73f6308-2911-4bc0-9f00-d790e6161d74)
![image](https://github.com/user-attachments/assets/9266d53b-db4f-4f54-aa85-08ddc1ef1a33)

## Snowflake
![image](https://github.com/user-attachments/assets/14f5c6e7-fba0-4b63-a881-8c3134292fad)
![image](https://github.com/user-attachments/assets/ab91ff33-6f70-43b1-9587-49367a6b88dd)

## DBT
![image](https://github.com/user-attachments/assets/9e0d46e8-30d6-4085-bafc-f61516f154d3)


## Linhagem de dados
![image](https://github.com/user-attachments/assets/fb7ecb3e-e27e-4ad7-a7ec-0e63ef3524e6)






