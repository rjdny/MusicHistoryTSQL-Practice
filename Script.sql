--SELECT * FROM Genre g

--INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Queen', 1970)

--DELETE FROM Artist WHERE Id = 29

--INSERT INTO Album (Title, ReleaseDate, AlbumLength, [Label], ArtistId, GenreId) VALUES ('A Night at the Opera', '11/21/1975', 2588, 'EMI/Elektra', 28, 2)

--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('You re My Best Fried', 170, '11/21/1975', 2, 28, 23)

--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Love of my Life', 218, '11/21/1975', 2, 28, 23)

--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Bohemian Rhapsody', 357, '11/21/1975', 2, 28, 23)

--SELECT * FROM Album al
--LEFT JOIN Artist ar ON ar.Id = al.ArtistId
--LEFT JOIN Song s ON s.AlbumId = al.Id
--WHERE al.Id = 23

--SELECT al.Title, COUNT (s.Id) AS NumberOfSongs FROM Album al
--LEFT JOIN Song s ON s.AlbumId = al.Id
--GROUP BY al.Title

--SELECT ar.ArtistName, COUNT (s.Id) AS NumberOfSongs FROM Artist ar
--LEFT JOIN Song s ON s.ArtistId = ar.Id
--GROUP BY ar.ArtistName

--SELECT g.[Label], COUNT (s.Id) AS NumberOfSongs FROM Genre g
--LEFT JOIN Song s ON s.GenreId = g.Id
--GROUP BY g.[Label]


--SELECT al.Title, MAX (al.AlbumLength) AS AlbumLength FROM Album al
--GROUP BY al.Title
--ORDER BY AlbumLength DESC;

SELECT s.Title, MAX (s.SongLength) AS SongLength FROM Song s
INNER JOIN Album al  ON s.AlbumId =al.Id
GROUP BY s.Title
ORDER BY SongLength DESC;
