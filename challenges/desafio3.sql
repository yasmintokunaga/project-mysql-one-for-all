SELECT 
    SpotifyClone.pessoas_usuarias.nome_pessoa_usuaria AS pessoa_usuaria,
    COUNT(SpotifyClone.cancoes.duracao_segundos) AS musicas_ouvidas,
    ROUND(SUM(SpotifyClone.cancoes.duracao_segundos)/60,2) AS total_minutos
FROM SpotifyClone.historico_de_reproducoes
INNER JOIN SpotifyClone.pessoas_usuarias
ON SpotifyClone.historico_de_reproducoes.pessoa_usuaria_id = SpotifyClone.pessoas_usuarias.pessoa_usuaria_id
INNER JOIN SpotifyClone.cancoes
ON SpotifyClone.historico_de_reproducoes.cancoes_id = SpotifyClone.cancoes.cancoes_id
GROUP BY SpotifyClone.pessoas_usuarias.nome_pessoa_usuaria
ORDER BY SpotifyClone.pessoas_usuarias.nome_pessoa_usuaria;