-- 1
SELECT id_vendedor AS id, nome, salario FROM vendedores WHERE inativo = FALSE ORDER BY nome ASC;

-- 2
SELECT id_vendedor AS id, nome, salario FROM vendedores WHERE salario > (SELECT AVG(salario) FROM vendedores) ORDER BY salario DESC;

-- 3
SELECT c.id_cliente AS id, c.razao_social, COALESCE(SUM(p.valor_total), 0) AS total FROM clientes c LEFT JOIN pedido p ON c.id_cliente = p.id_cliente GROUP BY c.id_cliente, c.razao_social ORDER BY total DESC;

-- 4
SELECT id_pedido AS id, valor_total AS valor, data_emissao AS data, CASE WHEN data_cancelamento IS NOT NULL THEN 'CANCELADO' WHEN data_faturamento IS NOT NULL THEN 'FATURADO' ELSE 'PENDENTE' END AS situacao FROM pedido ORDER BY id_pedido;

-- 5
SELECT ip.id_produto, SUM(ip.quantidade) AS quantidade_vendida, SUM(ip.quantidade * ip.preco_praticado) AS total_vendido, COUNT(DISTINCT ip.id_pedido) AS pedidos, COUNT(DISTINCT p.id_cliente) AS clientes FROM itens_pedido ip 
JOIN pedido p ON ip.id_pedido = p.id_pedido GROUP BY ip.id_produto ORDER BY quantidade_vendida DESC, total_vendido DESC LIMIT 1;
