-- /* TUTORIAL EXAMPLES
-- select title 'songtitle' from song;

--we selected the title from Song and artist from Artist doing a join on the
--  ArtistId column in Song and ArtistId*/
-- select s.title, a.artistname
-- from song s join artist a
-- on s.artistid = a.artistid;


-- /*A left join between tables Song and Album on AlbumId
-- where song title is null. This returns all album title as "Album
-- and song title as 'Song' where the albums have no songs, meaning
-- the song title column will have all NULL */
-- select a.Title 'Album', s.Title 'Song'
-- from Album a left join Song s
-- on a.AlbumId = s.AlbumId
-- where s.Title is null;

-- /*A right join between tables Song and Album*/
-- select a.Title 'Album', s.Title 'Song'
-- from Album s right join Song a
-- on s.AlbumId = a.AlbumId
-- where s.Title is null;

-- there are two select queries here: the first one gives you album
-- titles and song titles. This is a left join on Album and Song. Therefore everything
-- in Album will come back. The second one gives album titles
-- and song titles as well. But this one is a left join on Song
-- and Album. So you get everything in Song back. By taking
-- the union of the results of both queries, you essentially
-- get all the data in the Album table and song table joined
-- on the column AlbumId. We are only interested in the title of
-- the song and the album so from all the data, we ask for those 2 columns
-- SELECT a.Title 'Album', s.Title 'Song'
-- FROM Album a LEFT OUTER JOIN song s ON s.AlbumId = a.AlbumId
-- union
-- SELECT a.Title 'Album', s.Title 'Song'
-- FROM Song s LEFT OUTER JOIN Album a ON s.AlbumID = a.AlbumId;


-- /* A self join on the songtable on the column songid and an inner join with the artist table on column artist id
-- which then we order by artists using artitsid column(on the table Song) */
-- SELECT s.Title 'Song', a.ArtistName 'Artist'
-- FROM song s, song o
-- join artist a on s.ArtistId = a.ArtistId
-- WHERE s.SongId = o.SongId
-- AND s.ArtistId = o.ArtistId
-- ORDER BY s.ArtistId;

-- /*group album label counts not by separate artists*/
-- SELECT a.label, count(*) 'count'
-- FROM album a
-- group by a.label;

-- /*group album label counts by separate artist*/
-- SELECT a.label, count(*) 'count'
-- FROM album a
-- join artist t
-- on t.artistid = a.artistid
-- group by t.artistId;

-- /*group by distinct ID*/
-- SELECT a.label, count(distinct t.artistId) 'count'
-- FROM album a
-- join artist t
-- on t.artistid = a.artistid
-- group by a.label;

-- 1.)
select * from Artist;
-- 2.)
insert into Artist values (null,"Fang",1992);
-- 3.)
INSERT INTO Album
	SELECT null,
		   "Fang's Album",
		   '09/08/2009',
		   2082,
		   'Stones Throw Records',
		   a.ArtistId,
		   10
FROM Genre g, Artist a  WHERE g.Label = "Soul" and a.ArtistName = "Fang" ;
-- 4.)
INSERT INTO Song
	SELECT null,
		   "Fangs Songs",
       SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '8/5/1966',
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
FROM Artist a, Genre g, Album al
WHERE a.ArtistName = "Fang" AND g.Label = "Soul" AND al.Title = "Fang's Album";
-- 5.)
SELECT al.Title 'Album', s.Title 'Song', a.ArtistName 'Artist'
FROM Album al, Song s, Artist a on a.ArtistId = s.ArtistId and a.ArtistName = "Fang" and al.AlbumId = s.AlbumId;
-- 6.)
select a.Title 'Album Title', s.Title 'Song Title', count(s.AlbumId) 'Count'
from song s, album a on s.AlbumId = a.AlbumId
group by a.Title;
-- 7.)
select a.ArtistName 'Song Title', count(s.ArtistId) 'Count'
from song s
join artist a on a.ArtistId = s.ArtistId
group by a.ArtistName;
-- 8.)
select g.Label 'Genre', count(s.GenreId) 'Count'
from genre g, song s on s.GenreId = g.GenreId
group by g.Label;
-- 9.)
select a.Title 'Album Title', a.AlbumLength 'Album Duration', MAX(a.AlbumLength) 'MAX'
from album a;
-- 10.)
select s.Title 'Song Title', s.SongLength 'Song Duration', MAX(s.SongLength) 'MAX'
from song s;
-- 11.)
select a.Title 'Album Title', s.Title 'Song Title', s.SongLength 'Song Duration', MAX(s.SongLength) 'MAX'
from song s, album a where a.AlbumId = s.AlbumId;