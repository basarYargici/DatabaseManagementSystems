-- Tabloların ve verilerin hazırlanması
drop table IF EXISTS Teach;
drop table IF EXISTS Take;
drop table IF EXISTS Teacher;
drop table IF EXISTS Course;
drop table IF EXISTS Student;
drop table IF EXISTS Department;


create table Department
	(did numeric(5) not null,
	name varchar(30) not null,
	primary key(did));
 
create table Student
	(sid numeric(5) not null,
	name varchar(30) not null,
	birthplace varchar(50),
	did numeric(5),
	gpa numeric(5),
	foreign key (did) references Department(did),
	primary key(sid));

create table Course
	(cid numeric(5) not null,
	title varchar(30) not null,
	credits numeric(2),
	did  numeric(5),
	studentCount numeric(5),
	foreign key (did) references Department(did),
	primary key(cid));
 
create table Teacher
 	(tid numeric(5) not null,
 	fname varchar(30) not null,
 	birthplace varchar(50),
 	did numeric(5),
 	foreign key (did) references Department(did),
 	primary key(tid));
	
create table Take
 	(sid numeric(5) not null,
 	cid numeric(5) not null,
 	grade float,
 	foreign key (sid) references Student(sid),
 	foreign key (cid) references Course(cid),
 	primary key (sid,cid));
 
create table Teach
 (tid numeric(5) not null,
 cid numeric(5) not null,
 foreign key (tid) references Teacher(tid),
 foreign key (cid) references Course(cid),
 primary key (tid,cid));

insert into Department values (1,	'Comp. Eng.');
insert into Department values (2,	'Elec. Eng.');
insert into Department values (3,	'Env. Eng.');
insert into Department values (4,	'Ind. Eng.');

insert into Student values (1,	'Ali',		'istanbul',	1, 1.2);
insert into Student values (2,	'Ahmet',	'ankara',	1, 1.2);
insert into Student values (3,	'Leyla',	'izmir',	1, 1.2);
insert into Student values (4,	'Can',		'manisa',	2, 2.2);
insert into Student values (5,	'Aziz',		'istanbul',	2, 2.2);
insert into Student values (6,	'Talat',	'izmir',	3, 3.2);
insert into Student values (7,	'Kamuran',	'adana',	3, 3.2);
insert into Student values (8,	'Turgut',	'bursa',	4, 4.2);
insert into Student values (9,	'Oznur',	'bolu',		2, 2.2);
insert into Student values (10,	'Pelin',	'izmir',	4, 4.2);
insert into Student values (11,	'Savas',	'izmir',	4, 4.2);

insert into Course values (1,	'database',						3,	1, 12);
insert into Course values (2, 	'operating system',				3,	1, 12);
insert into Course values (3, 	'Introduction to Programming',	4,	1, 12);
insert into Course values (4, 	'introduction to electronic',	2,	2, 22);
insert into Course values (5, 	'statistic',					4,	4, 42);
insert into Course values (6,	'circuit theory',				3,	2, 22);
insert into Course values (7,	'introduction to environment',	3,	3, 32);
insert into Course values (8, 	'operation research',			3,	4, 42);
insert into Course values (9, 	'summer practice',				2,	4, 42);
insert into Course values (10, 	'summer practice',				3,	3, 32);
insert into Course values (11, 	'summer practice',				3,	1, 12);
insert into Course values (12,	'summer practice',				3,	2, 22);

insert into Teacher values (1,	'Selami', 	'amasya',	1);
insert into Teacher values (2,	'Cengiz', 	'istanbul',	1);
insert into Teacher values (3,	'Derya', 	'mersin',	1);
insert into Teacher values (4,	'Dogan', 	'istanbul',	2);
insert into Teacher values (5,	'Ayten', 	'istanbul',	3);
insert into Teacher values (6,	'Tahsin', 	'izmir',	4);
insert into Teacher values (7,	'Selcuk', 	'amasya',	4);

insert into Teach values (1,	1);
insert into Teach values (3,	2);
insert into Teach values (2,	3);
insert into Teach values (4,	4);
insert into Teach values (7,	5);
insert into Teach values (4,	6);
insert into Teach values (5,	7);
insert into Teach values (6,	8);
insert into Teach values (7,	9);
insert into Teach values (5,	10);
insert into Teach values (1,	11);
insert into Teach values (4,	12);

insert into Take values (1,	1,	3);
insert into Take values (1,	3,	2.5);
insert into Take values (1,	4,	3.5);
insert into Take values (1,	6,	3);
insert into Take values (1,	9,	4);
insert into Take values (1,	10,	3);
insert into Take values (2,	1,	4);
insert into Take values (2,	2,	4);
insert into Take values (2,	3,	4);
insert into Take values (2,	4,	4);
insert into Take values (2,	5,	4);
insert into Take values (2,	6,	4);
insert into Take values (2,	7,	4);
insert into Take values (2,	8,	4);
insert into Take values (2,	9,	4);
insert into Take values (2,	10,	3);
insert into Take values (2,	11,	4);
insert into Take values (3,	1,	4);
insert into Take values (3,	2,	4);
insert into Take values (3,	3,	4);
insert into Take values (3,	4,	4);
insert into Take values (3,	5,	4);
insert into Take values (3,	6,	4);
insert into Take values (3,	7,	4);
insert into Take values (3,	8,	4);
insert into Take values (3,	9,	4);
insert into Take values (3,	10,	3);
insert into Take values (3,	11,	3.5);
insert into Take values (4,	1,	2.5);
insert into Take values (4,	5,	1.5);
insert into Take values (5,	11,	3.5);
insert into Take values (5,	1,	3);
insert into Take values (5,	5,	1.5);
insert into Take values (6,	2,	4);
insert into Take values (7,	5,	1.5);
insert into Take values (7,	1,	2.5);
insert into Take values (7,	8,	1.5);
insert into Take values (7,	2,	3);
insert into Take values (8,	2,	3.5);
insert into Take values (8,	7,	1.5);
insert into Take values (10,	2,	4);
insert into Take values (10,	8,	3);
insert into Take values (11,	8,	1);

----------------------------------------------------------------------------------------------------------------------------------------------------

-- Soru 2 için testler
CREATE TYPE field AS ENUM('Music','Painting','Calligraphy')
CREATE TABLE artist (
    id INT,
    name VARCHAR(30),
    gender CHAR(1),
    status SMALLINT,
    field field,
    PRIMARY KEY(id)
)

INSERT INTO artist VALUES(1,'basar','e',1,'Music'),(2,'ali','e',1,'Painting'), (3,'tuba','k',0,'Calligraphy')
UPDATE artist SET name = 'basarUpdated' WHERE id = 1;

DELETE FROM artist WHERE id = 3;
SELECT * FROM artist
----------------------------------------------------------------------------------------------------------------------------------------------------

-- Sorgu 3
-- take tablosuna kayıt eklenince, silinince veya bir kayıttaki cid yada sid değiştirildiğinde course
-- tablosundaki studentCount alanını gerektiğinde güncelleyen trigger yada triggerları yazınız. Bu triggerları
-- 4 adet komutu (INSERT, DELETE, UPDATE(sid), UPDATE(cid)) çalıştırarak studentCount alanının
-- güncellenip güncellenmediği test ediniz.
CREATE OR REPLACE Function add()
	RETURNS TRIGGER AS $$
			begin
				UPDATE course SET studentCount = studentCount+1 WHERE cid = NEW.cid;
				return new;
			end; $$	
	language plpgsql;
		
CREATE TRIGGER add_trigger
BEFORE INSERT
ON take
FOR EACH ROW
EXECUTE PROCEDURE add();


SELECT * FROM take WHERE cid =1;
SELECT * FROM course ORDER BY cid;

INSERT INTO take VALUES(10,1,2)


CREATE OR REPLACE Function delete()
	RETURNS TRIGGER AS $_$
			begin
				UPDATE course SET studentCount = studentCount-1 WHERE studentCount > 0 AND cid = OLD.cid;
				RETURN OLD;
			end $_$
	language plpgsql;
		
CREATE TRIGGER delete_trigger
BEFORE DELETE
ON take
FOR EACH ROW
EXECUTE PROCEDURE delete();

SELECT * FROM take WHERE cid =1 OR cid = 3;
SELECT * FROM course ORDER BY cid;

DELETE FROM take WHERE (cid = 13 AND sid = 10)



----------------------------------------------------------------------------------------------------------------------------------------------------

-- Sorgu 4
-- Cid'leri verilen 2 dersi de alan öğrencilerin kayıtlarını tablo olarak döndüren ortakOgrenciSayisi(cid1, cid2) stored funtion'ı yazınız.
-- Bu function'ı örnek bir SELECT komutunda kullanarak test ediniz.
CREATE FUNCTION ortakOgrenciSayisi(
    cid1 int,
    cid2 int
)
RETURNS int 
language plpgsql
AS
$$
declare
   ogrenciSayisi integer;
BEGIN
	
	SELECT sid 
	INTO ogrencisayisi
	FROM take
	WHERE cid IN (3,9)
	GROUP BY sid
	HAVING COUNT(distinct cid) = 2;
	
	RETURN ogrenciSayisi;
END;
$$;

SELECT * FROM take WHERE cid = 3 or cid = 8
SELECT ortakOgrenciSayisi(3,8);