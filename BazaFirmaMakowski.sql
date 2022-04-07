-- Zad 1.Tworzenie bazy danych 'firma'

CREATE DATABASE firma;

-- Zad 2.Dodaj nowy schemat o nazwie rozliczenia.

CREATE SCHEMA rozliczenia;

-- Zad 3.Dodaj schematu rozliczenia dodaj cztery tabele:
-- pracownicy(id_pracownika, imie, nazwisko, adres, telefon)
-- godziny(id_godziny, data, liczba_godzin , id_pracownika)
-- pensje(id_pensji, stanowisko, kwota, id_premii)
-- premie(id_premii, rodzaj, kwota)

CREATE TABLE rozliczenia.pracownicy (id_pracownika SMALLINT PRIMARY KEY NOT NULL, imie VARCHAR NOT NULL, nazwisko VARCHAR NOT NULL, adres VARCHAR, telefon INTEGER)
CREATE TABLE rozliczenia.godziny (id_godziny SMALLINT PRIMARY KEY NOT NULL, data DATE, liczba_godzin SMALLINT NOT NULL, id_pracownika SMALLINT NOT NULL)
CREATE TABLE rozliczenia.pensje (id_pensji INTEGER PRIMARY KEY NOT NULL, stanowisko VARCHAR(MAX), kwota INTEGER NOT NULL, id_premii INTEGER NOT NULL)
CREATE TABLE rozliczenia.premie (id_premii INTEGER PRIMARY KEY NOT NULL, rodzaj VARCHAR(MAX), kwota INTEGER NOT NULL)

ALTER TABLE rozliczenia.godziny
ADD CONSTRAINT FK_id_pracownika
FOREIGN KEY (id_pracownika)
REFERENCES rozliczenia.pracownicy(id_pracownika);

ALTER TABLE rozliczenia.pensje
ADD CONSTRAINT FK_id_premii
FOREIGN KEY (id_premii)
REFERENCES rozliczenia.premie(id_premii);

-- Zad 4.Wype�nij ka�d� tabel� 10. rekordami.

INSERT INTO rozliczenia.pracownicy (id_pracownika, imie, nazwisko, adres, telefon)
VALUES (001, 'Jan', 'Kowalski', 'ul. Zielona 18', 111098099);
INSERT INTO rozliczenia.pracownicy
VALUES (002, 'Adam', 'Nowak', 'ul. Spokojna 3', 111013492);
INSERT INTO rozliczenia.pracownicy
VALUES (003, 'Anna', 'Baran', 'ul. Siemiradzkiego 14/9', 674011303);
INSERT INTO rozliczenia.pracownicy
VALUES (004, 'Krzysztof', 'Wi�niewski', 'ul. Mickiewicza 2/31', 501643207);
INSERT INTO rozliczenia.pracownicy
VALUES (005, 'Ewa', 'W�jcik', 'ul. S�owackiego 70/3', 711349082);
INSERT INTO rozliczenia.pracownicy
VALUES (006, 'Maciej', 'Kowalczyk', 'ul. 3 Maja 11', 681074391);
INSERT INTO rozliczenia.pracownicy
VALUES (007, 'Aleksandra', 'Zieli�ska', 'ul. Grunwaldzka 14/10', 708341603);
INSERT INTO rozliczenia.pracownicy
VALUES (008, 'Magdalena', 'Lewandowska', 'ul. Monte Cassino 44/19', 203111926);
INSERT INTO rozliczenia.pracownicy
VALUES (009, 'Karol', 'Szyma�ski', 'ul. Warszawska 20/2', 303452911);
INSERT INTO rozliczenia.pracownicy
VALUES (010, 'Szymon', 'Mazur', 'ul. Pola 11', 112374821);

SELECT * FROM rozliczenia.pracownicy

INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES (001, '2011-10-20', 8, 001);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES (002, '2011-10-20', 8, 002);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES (003, '2011-10-20', 8, 003);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES (004, '2011-10-20', 8, 004);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES (005, '2011-10-20', 8, 005);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES (006, '2011-10-20', 8, 006);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES (007, '2011-10-20', 8, 007);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES (008, '2011-10-20', 8, 008);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES (009, '2011-10-20', 8, 009);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES (010, '2011-10-20', 8, 010);

SELECT * FROM rozliczenia.godziny;

INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii)
VALUES (001, 'Konsultant', 10000, 001);
INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii)
VALUES (002, 'Prezes', 20000, 002);
INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii)
VALUES (003, 'Technik', 4000, 003);
INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii)
VALUES (004, 'Obs�uga klienta', 10000, 004);
INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii)
VALUES (005, 'Technik', 4000, 005);
INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii)
VALUES (006, 'Ksi�gowy', 8000, 006);
INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii)
VALUES (007, 'Starszy analityk', 12000, 007);
INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii)
VALUES (008, 'M�odszy analityk', 9000, 008);
INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii)
VALUES (009, 'Kierownik dzia�u rozwoju', 15000, 009);
INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii)
VALUES (010, 'Specjalista ds. promocji', 10000, 010);

SELECT * FROM rozliczenia.pensje

INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota)
VALUES (001, 'motywacyjna', 500);
INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota)
VALUES (002, 'indywidualna', 1000);
INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota)
VALUES (003, 'motywacyjna', 500);
INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota)
VALUES (004, 'indywidualna', 500);
INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota)
VALUES (005, 'motywacyjna', 1000);
INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota)
VALUES (006, 'indywidualna', 500);
INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota)
VALUES (007, 'indywidualna', 500);
INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota)
VALUES (008, 'motywacyjna', 500);
INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota)
VALUES (009, 'd�ugoterminowa', 250);
INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota)
VALUES (010, 'motywacyjna', 5000);

SELECT * FROM rozliczenia.premie

-- Zad 5.Za pomoc� zapytania SQL wy�wietl nazwiska pracownik�w i ich adresy.

SELECT nazwisko, adres FROM rozliczenia.pracownicy;

-- Zad 6.Napisz zapytanie, kt�re przekonwertuje dat� w tabeli godziny tak, aby wy�wietlana by�a informacja jaki to dzie� tygodnia i jaki miesi�c

SELECT DATEPART(WEEKDAY, GETDATE()) AS 'dzien tygodnia', MONTH(data) AS 'miesiac' FROM rozliczenia.godziny;

-- Zad 7.W tabeli pensje zmie� nazw� atrybutu kwota na kwota_brutto oraz dodaj nowy o nazwie kwota_netto. Oblicz kwot� netto i zaktualizuj warto�ci w tabeli.

EXEC sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto', 'COLUMN';
ALTER TABLE rozliczenia.pensje
ADD kwota_netto AS kwota_brutto*0.77;

SELECT * FROM rozliczenia.pensje;