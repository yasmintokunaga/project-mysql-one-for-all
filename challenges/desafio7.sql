SELECT
	artista.artista AS artista,
    album.album AS album,
    COUNT(artista.artista) AS pessoas_seguidoras
FROM
    SpotifyClone.seguindo_artistas
INNER JOIN SpotifyClone.artista ON seguindo_artistas.artistas_id = artista.artista_id
JOIN SpotifyClone.album ON seguindo_artistas.artistas_id = album.artista_id
GROUP BY album.album, artista.artista
ORDER BY `pessoas_seguidoras` DESC, artista, album;