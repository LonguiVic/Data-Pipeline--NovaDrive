{{ config(materialized='view') }}
WITH source AS (
    SELECT 
        id_veiculos,
        nome,
        tipo,
        valor::DECIMAL(10,2) AS valor,
        COALESCE(data_atualizacao, CURRENT_TIMESTAMP()) AS data_atualizacao
    FROM {{ source('sources', 'veiculos') }}
)

SELECT 
    * 
FROM source