{{ config(materialized='view') }}
WITH source AS (
    SELECT 
        id_clientes,
        INITCAP(cliente) AS cliente,
        endereco,
        id_concessionarias,
        COALESCE(data_atualizacao, data_inclusao) AS data_atualizacao
    FROM {{ source('sources', 'clientes') }}
)

SELECT 
    * 
FROM source