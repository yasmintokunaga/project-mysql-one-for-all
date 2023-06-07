SELECT 
    artista.artista,
    album.album
FROM
    SpotifyClone.album
INNER JOIN SpotifyClone.artista ON album.artista_id = artista.artista_id
WHERE artista.artista = 'Elis Regina';