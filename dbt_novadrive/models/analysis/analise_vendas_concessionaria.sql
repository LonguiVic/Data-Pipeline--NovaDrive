{{ config(materialized='table') }}
SELECT
    con.concessionaria_id AS id,
    con.nome_concessionaria AS concessionaria,
    cid.nome_cidade AS cidade,
    est.nome_estado AS estado,
    COUNT(v.venda_id) AS quantidade,
    SUM(v.valor_venda) AS total_venda,
    AVG(v.valor_venda) AS valor_medio
FROM {{ ref('fct_vendas') }} AS v
JOIN {{ ref('dim_concessionarias') }} AS con ON v.concessionaria_id = con.concessionaria_id
JOIN {{ ref('dim_cidades') }} AS cid ON con.cidade_id = cid.cidade_id
JOIN {{ ref('dim_estados') }} AS est ON cid.estado_id = est.estado_id
GROUP BY con.concessionaria_id, con.nome_concessionaria, cid.nome_cidade, est.nome_estado
ORDER BY total_venda DESC