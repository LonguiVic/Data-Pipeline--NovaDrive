{{ config(materialized='table') }}
SELECT 
    ven.vendedor_id AS id,
    ven.nome_vendedor AS vendedor,
    c.nome_concessionaria AS concessionaria,
    COUNT(v.venda_id) AS quantidade,
    SUM(v.valor_venda) AS total_venda,
    AVG(v.valor_venda) AS valor_medio
FROM {{ ref('fct_vendas') }} AS v
JOIN {{ ref('dim_vendedores') }} ven ON v.vendedor_id = ven.vendedor_id
JOIN {{ ref('dim_concessionarias') }} c ON c.concessionaria_id = ven.concessionaria_id
GROUP BY ven.vendedor_id, ven.nome_vendedor,  c.nome_concessionaria
ORDER BY total_venda DESC 