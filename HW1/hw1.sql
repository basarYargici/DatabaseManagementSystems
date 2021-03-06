-- Database: Homework_28102021

-- DROP DATABASE "Homework_28102021";

-- CREATE DATABASE "Homework_28102021"
--     WITH 
--     OWNER = postgres
--     ENCODING = 'UTF8'
--     LC_COLLATE = 'Turkish_Turkey.1254'
--     LC_CTYPE = 'Turkish_Turkey.1254'
--     TABLESPACE = pg_default
--     CONNECTION LIMIT = -1;

-- -- CREATE TABLE 
--
-- DROP TABLE IF EXISTS besteci 		 CASCADE;
-- DROP TABLE IF EXISTS sozyazari 	 CASCADE;
-- DROP TABLE IF EXISTS sarkici 		 CASCADE;
-- DROP TABLE IF EXISTS album 		 CASCADE;
-- DROP TABLE IF EXISTS sarki 		 CASCADE;
-- DROP TABLE IF EXISTS albumdekiSarki CASCADE;
--
-- 
-- -- besteci(bestecino, ad, tur)
-- CREATE TABLE besteci(
-- 	bestecino INTEGER NOT NULL PRIMARY KEY,
-- 	ad VARCHAR(50),
-- 	tur VARCHAR(50)
-- );
-- 
-- -- sozyazari(yazarno, ad)
-- CREATE TABLE sozyazari(
-- 	yazarno INTEGER NOT NULL PRIMARY KEY,
-- 	ad VARCHAR(50)
-- );
-- 
-- -- sarkici(sarkicino, ad, tur, dogumTarih, dogumYer)
-- CREATE TABLE sarkici(
-- 	sarkicino INTEGER NOT NULL PRIMARY KEY,
-- 	ad VARCHAR(50),
-- 	tur VARCHAR(50),
-- 	dogumTarih date,
-- 	dogumYer VARCHAR(50)
-- );
-- 
-- -- album(albumno, ad, yil, fiyat, stokAdet, sarkicino)
-- CREATE TABLE album(
-- 	albumno INTEGER NOT NULL PRIMARY KEY,
-- 	ad VARCHAR(50),
-- 	yil VARCHAR(50),
-- 	fiyat INTEGER,
-- 	stokAdet INTEGER,
-- 	sarkicino INTEGER NOT NULL,
-- 	FOREIGN	KEY(sarkicino) REFERENCES sarkici(sarkicino)
-- );
-- 
-- 
-- -- sarki(sarkino, ad, tur, sure, bestecino, yazarno)
-- CREATE TABLE sarki(
-- 	sarkino INTEGER NOT NULL PRIMARY KEY,
-- 	ad VARCHAR(50),
-- 	tur VARCHAR(50),
-- 	sure INTEGER,
-- 	bestecino INTEGER NOT NULL,
-- 	yazarno INTEGER NOT NULL,
-- 	FOREIGN	KEY(bestecino) REFERENCES besteci(bestecino),
-- 	FOREIGN	KEY(yazarno) REFERENCES sozyazari(yazarno)
-- );
-- 
-- -- albumdekiSarki(sira, albumno, sarkino)
-- CREATE TABLE albumdekiSarki(
-- 	sira INTEGER,
-- 	albumno INTEGER NOT NULL,
-- 	sarkino INTEGER NOT NULL,
-- 	PRIMARY KEY(albumno,sarkino),
-- 	FOREIGN	KEY(albumno) REFERENCES album(albumno),
-- 	FOREIGN	KEY(sarkino) REFERENCES sarki(sarkino)
-- );
--
-- -- TARKAN
-- -- sarkici(sarkicino, ad, tur, dogumTarih, dogumYer)
-- INSERT INTO sarkici VALUES(1,'Tarkan', 'Pop', '1972-OCT-17','Istanbul');
-- -- besteci(bestecino, ad, tur)
-- INSERT INTO besteci VALUES(1,'Ozan ??olako??lu', 'Pop');
-- INSERT INTO besteci VALUES(2,'Jeff Koplan', 'Pop');
-- INSERT INTO besteci VALUES(3,'Nazan ??ncel', 'Pop');
-- -- sozyazari(yazarno, ad)
-- INSERT INTO sozyazari VALUES(1,'Nazan ??ncel');
-- INSERT INTO sozyazari VALUES(2,'Tarkan');
-- -- sarki(sarkino, ad, tur, sure, bestecino, yazarno)
-- INSERT INTO sarki VALUES(1,'Dudu', 'Pop', 275, 2, 1);
-- INSERT INTO sarki VALUES(2,'Bu ??ark??lar da Olmasa', 'Pop', 266, 3, 1);
-- INSERT INTO sarki VALUES(3,'Sorma Kalbim', 'Pop', 275, 1, 2);
-- -- album(albumno, ad, yil, fiyat, stokAdet, sarkicino)
-- INSERT INTO album VALUES(1,'Dudu',2003, 99, 150,1);
-- INSERT INTO album VALUES(4,'Olurum Sana',1997, 201, 100,1);
-- -- albumdekiSarki(sira, albumno, sarkino)
-- INSERT INTO albumdekiSarki VALUES(1,1,1);
-- INSERT INTO albumdekiSarki VALUES(2,1,2);
-- INSERT INTO albumdekiSarki VALUES(3,1,3);
-- 
-- -- M??sl??m G??rses
-- -- sarkici(sarkicino, ad, tur, dogumTarih, dogumYer)
-- INSERT INTO sarkici VALUES(2,'M??sl??m G??rses', 'Arabesk', '1953-JUL-5','Ankara');
-- -- besteci(bestecino, ad, tur)
-- INSERT INTO besteci VALUES(4,'Teoman', 'Arabesk');
-- INSERT INTO besteci VALUES(5,'Ali Mamara??l??', 'Arabesk');
-- INSERT INTO besteci VALUES(6,'Ahmet Sel??uk ??lkan', 'Arabesk');
-- -- sozyazari(yazarno, ad)
-- INSERT INTO sozyazari VALUES(3,'Teoman');
-- INSERT INTO sozyazari VALUES(4,'Mehmet Aslan');
-- INSERT INTO sozyazari VALUES(5,'Burhan Bayar');
-- INSERT INTO sozyazari VALUES(6,'Yunus Emre');
-- INSERT INTO sozyazari VALUES(7,'Tahir Paker');
-- -- sarki(sarkino, ad, tur, sure, bestecino, yazarno)
-- INSERT INTO sarki VALUES(4,'Parampar??a', 'Arabesk', 215 , 4, 3);
-- INSERT INTO sarki VALUES(5,'Sen Yoksun', 'Arabesk', 207 , 5, 4);
-- INSERT INTO sarki VALUES(6,'Yitik A??k', 'Arabesk',  112 , 5, 5);
-- INSERT INTO sarki VALUES(7,'??ay Karam', 'Arabesk', 306, 6, 5);
-- INSERT INTO sarki VALUES(8,'A??k Bir Ate??', 'Arabesk', 239, 4, 6);
-- INSERT INTO sarki VALUES(9,'Olan Bana Oldu', 'Arabesk', 206, 4, 7);
-- -- album(albumno, ad, yil, fiyat, stokAdet, sarkicino)
-- INSERT INTO album VALUES(2,'Parampar??a',2002, 569, 18,2);
-- -- albumdekiSarki(sira, albumno, sarkino)
-- INSERT INTO albumdekiSarki VALUES(4,2,4);
-- INSERT INTO albumdekiSarki VALUES(5,2,5);
-- INSERT INTO albumdekiSarki VALUES(6,2,6);
-- INSERT INTO albumdekiSarki VALUES(7,2,7);
-- INSERT INTO albumdekiSarki VALUES(8,2,8);
-- INSERT INTO albumdekiSarki VALUES(9,2,9);
-- 
-- 
-- -- Orhan Gencebay
-- -- sarkici(sarkicino, ad, tur, dogumTarih, dogumYer)
-- INSERT INTO sarkici VALUES(3,'Orhan Gencebay', 'Arabesk', '1944-AUG-4','SAMSUN');
-- -- besteci(bestecino, ad, tur)
-- INSERT INTO besteci VALUES(7,'Orhan Gencebay', 'Arabesk');
-- -- sozyazari(yazarno, ad)
-- INSERT INTO sozyazari VALUES(8,'Orhan Gencebay');
-- -- sarki(sarkino, ad, tur, sure, bestecino, yazarno)
-- INSERT INTO sarki VALUES(10,'Emaneti Alda G??t??r', 'Arabesk', 310, 7, 8);
-- INSERT INTO sarki VALUES(12,'Vatan Sa??olsun', 'Arabesk', 279, 7, 8);
-- INSERT INTO sarki VALUES(13,'Berhudar Ol', 'Arabesk', 329, 7, 8);
-- INSERT INTO sarki VALUES(14,'Sevmeyi Bilmiyorlar', 'Arabesk', 225, 7, 8);
-- INSERT INTO sarki VALUES(15,'Sensizlik Yerle Bir Etti', 'Arabesk', 322, 7, 8);
-- INSERT INTO sarki VALUES(16,'Her g??n Ba??ka Ba??ka', 'Arabesk', 190, 7, 8);
-- INSERT INTO sarki VALUES(17,'Yaln??zl??k', 'Arabesk', 389, 7, 8);
-- INSERT INTO sarki VALUES(18,'Sen de mi Kayboldun', 'Arabesk', 266, 7, 8);
-- INSERT INTO sarki VALUES(19,'Duymad??n Ki', 'Arabesk', 363, 7, 8);
-- INSERT INTO sarki VALUES(20,'Dirili?? /Etr??ksler (Enstr??mantal)', 'Arabesk', 394, 7, 8);
-- -- album(albumno, ad, yil, fiyat, stokAdet, sarkicino)
-- INSERT INTO album VALUES(3,'Berhudar Ol',2010, 324, 547, 3);
-- -- albumdekiSarki(sira, albumno, sarkino)
-- INSERT INTO albumdekiSarki VALUES(10,3,10);
-- INSERT INTO albumdekiSarki VALUES(12,3,12);
-- INSERT INTO albumdekiSarki VALUES(13,3,13);
-- INSERT INTO albumdekiSarki VALUES(14,3,14);
-- INSERT INTO albumdekiSarki VALUES(15,3,15);
-- INSERT INTO albumdekiSarki VALUES(16,3,16);
-- INSERT INTO albumdekiSarki VALUES(17,3,17);
-- INSERT INTO albumdekiSarki VALUES(18,3,18);
-- INSERT INTO albumdekiSarki VALUES(19,3,19);
-- INSERT INTO albumdekiSarki VALUES(20,3,20);
--
-- -- sarkici(sarkicino, ad, tur, dogumTarih, dogumYer)
-- INSERT INTO sarkici VALUES(4,'Basar Yargici', null, '2000-11-01','Istanbul');




SELECT * FROM besteci;
SELECT * FROM sozyazari;
SELECT * FROM sarkici;
SELECT * FROM album;
SELECT * FROM sarki;
SELECT * FROM albumdekiSarki;

-- SORGU 1: T??r?? ???arabesk??? ve s??resi 3 dakikadan uzun olan ??ark??lar??n adlar??n?? tekrars??z olarak ve alfan??merik s??rada artan s??rada listeleyiniz. 
-- [Not: RA sorgusunda s??ralamay?? g??z ??n??ne almay??n??z. RA???da s??ralama i??lemi yoktur]

SELECT s.ad, s.sure
FROM sarki s
WHERE s.tur = 'Arabesk' AND s.sure > 3*60
ORDER BY s.ad ASC;


-- SORGU 2:	Do??um yeri ???Ankara??? olan ya da alb??me sahip olan ??ark??c??lar??n kay??tlar??n?? listeleyiniz. UNION kullan??rken sarkicino kullan??larak UNION yap??n??z.
-- ??ark??c?? kay??tlar??n?? getirmek i??in UNION i??leminin sonucunu sarkici tablosuyla join (kartezyen ??arp??m ve kay??t se??me i??lemi) ediniz


-- Ana ????z??m
SELECT * 
FROM sarkici s, (
		(
			SELECT sarkici.sarkicino
			FROM sarkici
			WHERE sarkici.dogumyer = 'Ankara'
		)
		UNION
		(	
			SELECT sarkici.sarkicino
			FROM album,sarkici
			WHERE album.sarkicino = sarkici.sarkicino
		)
	) un
WHERE s.sarkicino IN (un.sarkicino);

-- 1. ????z??m
(
	SELECT sarkici.*
	FROM sarkici
	WHERE sarkici.dogumyer = 'Ankara'
)
UNION
(
	SELECT sarkici.*
	FROM album,sarkici
	WHERE album.sarkicino = sarkici.sarkicino
);

-- 2. ????z??m
(
	SELECT sarkici.*
	FROM sarkici
	WHERE sarkici.dogumyer = 'Ankara' OR sarkici.sarkicino IN 
	(
	SELECT album.sarkicino
	FROM album
	)
)







-- SORGU 3:	??ark??c??lar ve alb??mlerini ??ark??c??n??n ad??, alb??m??n??n ad??, album y??l?? ??eklinde listeleyen sorguyu WHERE i??inde sarkici.sarkicino=album.sarkicino 
-- ko??uluyla, FROM i??inde NATURAL JOIN c??mleci??iyle, WHERE i??inde IN ile, =SOME ile ve EXISTS kullanarak 5 farkl?? ??ekilde yaz??n??z.

-- with where
SELECT s.ad, a.ad, a.yil
FROM sarkici s, album a
WHERE s.sarkicino=a.sarkicino;

-- with NATURAL JOIN 
-- ????
SELECT sarkici.ad, album.ad, album.yil
FROM sarkici NATURAL JOIN album

SELECT sarkici.ad, album.ad, album.yil
FROM sarkici 
JOIN album
ON sarkici.sarkicino = album.sarkicino;


-- with IN 
SELECT s.ad, a.ad, a.yil
FROM sarkici s, album a
WHERE s.sarkicino 
IN(a.sarkicino);

-- with Some/ANY
-- ???
SELECT s.ad, al.ad, al.yil
FROM sarkici s, album al
WHERE s.sarkicino = any(
	SELECT album.sarkicino 
	FROM album
	WHERE s.sarkicino = al.sarkicino
);

-- with EXISTS
-- ???
SELECT s.ad, al.ad, al.yil
FROM sarkici s, album al
WHERE EXISTS(
	SELECT al.sarkicino 
	FROM album 
	WHERE s.sarkicino = al.sarkicino
);



SELECT * FROM sarkici;
SELECT * FROM album;






-- SORGU 4:	Hi?? alb??m?? olmayan ??ark??c??lar??n kay??tlar??n?? k??me fark?? (MINUS/EXCEPT), NOT IN, != ALL ve NOT EXISTS kullanarak 4 farkl?? ??ekilde yaz??n??z.

-- with (MINUS/EXCEPT) 
SELECT s.*
FROM sarkici s, (
		(
			SELECT sarkici.sarkicino
			FROM sarkici
		)
		EXCEPT
		(
			SELECT album.sarkicino
			FROM album
		)
	) s2
WHERE s.sarkicino = s2.sarkicino;


-- with NOT IN 
SELECT s.*
FROM sarkici s, (
	SELECT sarkici.sarkicino
	FROM sarkici
	WHERE sarkici.sarkicino NOT IN
		(
			SELECT album.sarkicino
			FROM album
		)
	) s2
WHERE s.sarkicino = s2.sarkicino;

-- with != ALL 
SELECT s.*
FROM sarkici s, (
	SELECT sarkici.sarkicino
	FROM sarkici
	WHERE sarkici.sarkicino != ALL
		(
			SELECT album.sarkicino
			FROM album
		)
	) s2
WHERE s.sarkicino = s2.sarkicino;



-- with NOT EXISTS 
SELECT s.sarkicino, s.ad, s.tur, s.dogumtarih, s.dogumyer
FROM sarkici s, (
	SELECT sa.sarkicino
	FROM sarkici sa
	WHERE NOT EXISTS
		(
			SELECT album.sarkicino
			FROM album
			WHERE sa.sarkicino = album.sarkicino
		)
	) s2
WHERE s.sarkicino = s2.sarkicino;


-- SORGU 5:	[GROUP BY] Alb??mlerin numaralar??, ad??, ??ark??c??s??n??n ad??, fiyat??, i??indeki ??ark??lar??n say??s?? ve s??re uzunluklar?? toplam??n?? listeleyiniz.
--CHANGED !!

SELECT 
	al.albumno, al.ad AS "Album Adi", sa.ad AS "Sarkici Adi", al.fiyat, COUNT(al) AS "Sarki sayisi", SUM(s.sure) AS "Toplam Sure"
FROM 
	album AS al, albumdekisarki AS asa, sarki AS s, sarkici AS sa
WHERE 
	al.albumno = asa.albumno AND al.sarkicino = s.sarkino AND sa.sarkicino = al.sarkicino
GROUP BY 
	al.albumno,sa.sarkicino;




-- SORGU 6:	[GROUP BY, HAVING] ???arabesk??? t??r??ndeki bestecilerden 5 adetten ??ok ??ark?? besteleyenlerin besteci ad?? ve ka?? ??ark?? bestelediklerini 
-- listeleyiniz. [Not: ??lk ad??mda ???arabesk??? t??r??ndeki bestecilerin ka?? ??ark?? besteledikleri besteci ve sarki tablolar?? join edilerek bulunabilir. 
-- Besteci tablosunun burada kullan??lmas??n??n sebebi besteci.tur=???arabesk??? ko??ulunu sa??layan bestecileri bulabilmektir. Sonraki ad??mda bestecilerin 
-- adlar?? besteci tablosundan bulunur]


SELECT b.ad, COUNT(s.sarkino)
FROM besteci b, sarki s
WHERE s.bestecino = b.bestecino 
GROUP BY b.ad
HAVING COUNT(s.sarkino)>5;



-- SORGU 7:	En fazla alb??me sahip ??ark??c??lar??n kay??tlar??n?? listeleyiniz. [Not:??nce her ??ark??c??n??n album say??s?? GROUP BY ile bulunur, sonra 
-- en y??ksek album say??s?? bulunur. Sonra en y??ksek album say??s??na sahip ??ark??c??lar??n kay??tlar?? bulunur. ??n ad??mdaki sorgular?? WITH ile yaz??n??z]


WITH 
	sarkiciAlbum AS (
		SELECT s.sarkicino, COUNT(al.albumno) as "count"
		FROM album al, sarkici s
		WHERE al.sarkicino = s.sarkicino
		GROUP BY s.sarkicino
	),
	maxSarkiciAlbum AS(
		SELECT MAX(sa.count) as "max"
		FROM sarkiciAlbum sa
	) 
SELECT s.*, msa.max 
FROM maxSarkiciAlbum msa,sarkiciAlbum sa, sarkici s
WHERE msa.max = sa.count AND s.sarkicino = sa.sarkicino
		

-- SORGU 8:	???arabesk??? t??r??ndeki t??m ??ark??lar??n yazarl??????n?? yapm???? yazarlar??n kay??tlar??n?? listeleyiniz. [Not: ??li??kisel cebirdeki b??lme (??) i??lemi
-- kullan??lacak ve ilk ad??mda yazarlar??n numaralar?? bulunduktan sonra ikinci ad??mda yazar kay??tlar?? bulunacak. Bu sorguyu dersteki t??m dersleri
-- alan ????renciler sorgusuna benzeterek ????zebilirsiniz]
-- sozyazari <=> ((sozyazar??n??n yazd??g?? sarkilarin turleri) - (Arabesk turundeki sark??lar)) == Bos kume

SELECT *
FROM sozyazari so
WHERE NOT EXISTS (
	(
		SELECT DISTINCT s.tur
		FROM sarki s
		WHERE s.yazarno = so.yazarno  
	)
	EXCEPT
	(
		SELECT DISTINCT s.tur 
		FROM sarki s
		WHERE s.tur = 'Arabesk'
	)
)

-- SORGU 9: En ??ok ??ark?? s??z?? yazm???? olan yazarlar??n yazarno???lar??n?? aggregate fonksiyon veya group by kullanmadan s??n??fta (sunumdaki ??rnekte) ????zd??????m??z gibi ????z??n??z.

WITH besteciEserSayisi as (
		SELECT so.yazarno as "yazarno", COUNT(so.yazarno) as "sayi"
		FROM sozyazari so,sarki s
		WHERE so.yazarno = s.yazarno
		GROUP BY so.yazarno),
	enFazlaEser as(
		SELECT MAX(sayi) as "sayi"
		FROM besteciEserSayisi
	)
SELECT b.yazarno,b.sayi
FROM enFazlaEser e,besteciEserSayisi b
WHERE e.sayi = b.sayi


-- SORGU 10: En az iki ??ark?? bestelemi?? olan bestecilerin bestecino???lar??n?? ayn?? tabloyu kendisi ile kartezyen ??arp??m yaparak s??n??fta 
-- (sunumdaki ??rnekte) oldu??u gibi ????z??n??z.

-- 0. ????z??m
SELECT DISTINCT s1.bestecino
FROM sarki s1, sarki s2
WHERE s1.bestecino = s2.bestecino
GROUP BY s1.bestecino, s2.bestecino
HAVING COUNT(s1.ad) >= 2;

-- 1. ????z??m
WITH besteciEserler as (
	SELECT b.bestecino as "bestecino", Count(b.bestecino)
	FROM besteci b,sarki s
	WHERE b.bestecino = s.bestecino
	GROUP BY b.bestecino)
SELECT be.bestecino, be.count
FROM besteciEserler as be
WHERE be.count>=2



SELECT * FROM besteci;
SELECT * FROM sozyazari;
SELECT * FROM sarkici;
SELECT * FROM album;
SELECT * FROM sarki;
SELECT * FROM albumdekiSarki;




















































