SELECT 
    SpotifyClone.pessoas_usuarias.nome_pessoa_usuaria AS pessoa_usuaria,
    IF(YEAR(MAX( SpotifyClone.historico_de_reproducoes.data_reproducao)) >= 2021, 'Ativa', 'Inativa') AS status_pessoa_usuaria
FROM SpotifyClone.historico_de_reproducoes
INNER JOIN SpotifyClone.pessoas_usuarias
ON SpotifyClone.historico_de_reproducoes.pessoa_usuaria_id = SpotifyClone.pessoas_usuarias.pessoa_usuaria_id
GROUP BY SpotifyClone.pessoas_usuarias.nome_pessoa_usuaria
ORDER BY SpotifyClone.pessoas_usuarias.nome_pessoa_usuaria;