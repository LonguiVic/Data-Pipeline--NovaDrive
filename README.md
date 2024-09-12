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
