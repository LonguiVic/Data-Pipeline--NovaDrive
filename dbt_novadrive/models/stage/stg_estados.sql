{{ config(materialized='view') }}
WITH source AS (
    SELECT 
        id_estados,
        UPPER(estado) AS estado,
        UPPER(sigla) AS sigla,
        data_inclusao,
        data_atualizacao
    FROM {{ source('sources', 'estados') }}
)

SELECT 
    * 
FROM source