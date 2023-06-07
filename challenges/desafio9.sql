SELECT
    COUNT(historico_de_reproducoes.cancoes_id) AS musicas_no_historico
FROM
    SpotifyClone.historico_de_reproducoes
INNER JOIN SpotifyClone.pessoas_usuarias ON historico_de_reproducoes.pessoa_usuaria_id = pessoas_usuarias.pessoa_usuaria_id
WHERE pessoas_usuarias.nome_pessoa_usuaria = "Barbara Liskov"
GROUP BY pessoas_usuarias.nome_pessoa_usuaria;