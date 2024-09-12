{{ config(materialized='view') }}
WITH source AS (
    SELECT 
        id_vendedores,
        INITCAP(nome) as nome_vendedor,
        id_concessionarias,
        data_inclusao,
        COALESCE(data_atualizacao, data_inclusao) AS data_atualizacao
    FROM {{ source('sources', 'vendedores') }}
)

SELECT 
    * 
FROM source