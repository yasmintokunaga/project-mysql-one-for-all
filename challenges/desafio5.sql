SELECT 
	cancoes.cancoes AS cancao,
    COUNT(historico_de_reproducoes.cancoes_id) AS reproducoes
FROM SpotifyClone.historico_de_reproducoes
INNER JOIN SpotifyClone.cancoes
ON historico_de_reproducoes.cancoes_id = cancoes.cancoes_id
GROUP BY cancoes.cancoes
ORDER BY `reproducoes` DESC, `cancao`
LIMIT 2;