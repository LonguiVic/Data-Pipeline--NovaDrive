{{ config(materialized='view') }}
WITH source AS (
    SELECT 
        id_concessionarias,
        TRIM(concessionaria) AS concessionaria,
        id_cidades,
        data_inclusao,
        COALESCE(data_atualizacao, data_inclusao) AS data_atualizacao
    FROM {{ source('sources', 'concessionarias') }}
)

SELECT 
    * 
FROM source