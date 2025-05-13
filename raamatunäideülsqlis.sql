CREATE DATABASE TITPE23_baas;
--kasutame andmebaasi
USE TITPE23_baas;
--tabeli loomine
CREATE TABLE raamat(
raamatID int not null PRIMARY KEY identity(1,1),
raamatnimetus varchar(100) not null,
zanrID int,
authorID int,
hind decimal(5,2),
v_aasta int);
SELECT * FROM raamat;

--andmete lisamine tabelisse
--' ülakoma
INSERT INTO raamat(raamatnimetus, zanrID, authorID, hind, v_aasta)
Values(
'Alice imedemaal', 2, 2, 20.50, 2015);
--tabeli kustutamine
--drop table raamat;
CREATE TABLE zanr(
zanrID int not null PRIMARY KEY identity(1,1),
zanrnimetus varchar(25) UNIQUE)
SELECT * FROM zanr;
INSERT INTO zanr(zanrnimetus)
VALUES ('komöödia'),('detektiiv');

--foreing key lisamine zanrID tabelis raamat

ALTER TABLE raamat ADD foreign key (zanrID)
REFERENCES zanr(zanrID)

CREATE TABLE author(
authorID int not null PRIMARY KEY identity(1,1),
authorEesnimi varchar(25),
authorPerenimi varchar(30),
synniaeg date,
synnikoht char(10));

SELECT * FROM author;

INSERT INTO author(
authorEesnimi, authorPerenimi, synniaeg, synnikoht)
VALUES (
'Lewis','Carrol','1900-11-30','UK')

ALTER TABLE raamat ADD foreign key (authorID)
REFERENCES author(authorID)
--fk kontrollimiseks lisame autorID mis ei ole kasutusel
INSERT INTO raamat(
raamatnimetus, zanrID, authorID, hind, v_aasta)
VALUES(
'Alice Imedemaal++', 2, 22, 20.50, 2015);

SELECT * FROM raamat;
--raamatu kustutamine - 1 kirje kustutamine
DELETE FROM raamat WHERE raamatID=5