{{ config(materialized='table') }}
SELECT
    id_veiculos AS veiculo_id,
    nome AS nome_veiculo,
    tipo,
    valor AS valor_sugerido,
    data_atualizacao
FROM {{ ref('stg_veiculos') }}
