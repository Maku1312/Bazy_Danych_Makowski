-- 1.Utwórz now¹ bazê danych nazywaj¹c j¹ firma.
CREATE DATABASE firma

-- 2. Dodaj schemat o nazwie ksiegowosc.
CREATE SCHEMA ksiegowosc

-- 3. Dodaj cztery tabele:
-- pracownicy (id_pracownika, imie, nazwisko, adres, telefon)
CREATE TABLE ksiegowosc.pracownicy (id_pracownika SMALLINT PRIMARY KEY NOT NULL, imie VARCHAR(50), nazwisko VARCHAR(50), adres VARCHAR(50), telefon INTEGER)
-- godziny (id_godziny, data, liczba_godzin , id_pracownika)
CREATE TABLE ksiegowosc.godziny (id_godziny SMALLINT PRIMARY KEY NOT NULL, data DATE, liczba_godzin SMALLINT NOT NULL, id_pracownika SMALLINT NOT NULL)
-- pensja (id_pensji, stanowisko, kwota)
CREATE TABLE ksiegowosc.pensje (id_pensji INTEGER PRIMARY KEY NOT NULL, stanowisko VARCHAR(50), kwota INTEGER NOT NULL)
-- premia (id_premii, rodzaj, kwota)
CREATE TABLE ksiegowosc.premie (id_premii INTEGER PRIMARY KEY NOT NULL, rodzaj VARCHAR(50), kwota INTEGER NOT NULL)
-- wynagrodzenie( id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii)
CREATE TABLE ksiegowosc.wynagrodzenie (id_wynagrodzenia INTEGER PRIMARY KEY NOT NULL, data DATE, id_pracownika SMALLINT NOT NULL, id_godziny SMALLINT NOT NULL, id_pensji INTEGER NOT NULL, id_premii INTEGER)

ALTER TABLE ksiegowosc.godziny
ADD CONSTRAINT FK_id_pracownika_godziny
FOREIGN KEY (id_pracownika)
REFERENCES ksiegowosc.pracownicy;

ALTER TABLE ksiegowosc.wynagrodzenie
ADD CONSTRAINT FK_id_pracownika
FOREIGN KEY (id_pracownika)
REFERENCES ksiegowosc.pracownicy;

ALTER TABLE ksiegowosc.wynagrodzenie
ADD CONSTRAINT FK_id_godziny
FOREIGN KEY (id_godziny)
REFERENCES ksiegowosc.godziny;

ALTER TABLE ksiegowosc.wynagrodzenie
ADD CONSTRAINT FK_id_pensji
FOREIGN KEY (id_pensji)
REFERENCES ksiegowosc.pensje;

ALTER TABLE ksiegowosc.wynagrodzenie
ADD CONSTRAINT FK_id_premii
FOREIGN KEY (id_premii)
REFERENCES ksiegowosc.premie;

-- przyjmuj¹c nastêpuj¹ce za³o¿enia:
-- typy atrybutów maj¹ zostaæ dobrane tak, aby sk³adowanie danych by³o optymalne,
-- klucz g³ówny dla ka¿dej tabeli oraz klucze obce tam, gdzie wystêpuj¹ powi¹zania pomiêdzy tabelami,
-- opisy/komentarze dla ka¿dej tabeli – u¿yj polecenia COMMENT

-- 5. Wype³nij ka¿d¹ tabelê 10. rekordami.

INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon)
VALUES (001, 'Jan', 'Kowalski', 'ul. Zielona 18', 111098099);
INSERT INTO ksiegowosc.pracownicy
VALUES (002, 'Adam', 'Nowak', 'ul. Spokojna 3', 111013492);
INSERT INTO ksiegowosc.pracownicy
VALUES (003, 'Anna', 'Baran', 'ul. Siemiradzkiego 14/9', 674011303);
INSERT INTO ksiegowosc.pracownicy
VALUES (004, 'Krzysztof', 'Wiœniewski', 'ul. Mickiewicza 2/31', 501643207);
INSERT INTO ksiegowosc.pracownicy
VALUES (005, 'Ewa', 'Wójcik', 'ul. S³owackiego 70/3', 711349082);
INSERT INTO ksiegowosc.pracownicy
VALUES (006, 'Maciej', 'Kowalczyk', 'ul. 3 Maja 11', 681074391);
INSERT INTO ksiegowosc.pracownicy
VALUES (007, 'Aleksandra', 'Zieliñska', 'ul. Grunwaldzka 14/10', 708341603);
INSERT INTO ksiegowosc.pracownicy
VALUES (008, 'Magdalena', 'Lewandowska', 'ul. Monte Cassino 44/19', 203111926);
INSERT INTO ksiegowosc.pracownicy
VALUES (009, 'Karol', 'Szymañski', 'ul. Warszawska 20/2', 303452911);
INSERT INTO ksiegowosc.pracownicy
VALUES (010, 'Szymon', 'Mazur', 'ul. Pola 11', 112374821);

SELECT * FROM ksiegowosc.pracownicy

INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES (001, '2011-10-20', 8, 001);
INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES (002, '2011-10-20', 9, 002);
INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES (003, '2011-10-20', 9, 003);
INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES (004, '2011-10-20', 8, 004);
INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES (005, '2011-10-20', 7, 005);
INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES (006, '2011-10-20', 7, 006);
INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES (007, '2011-10-20', 8, 007);
INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES (008, '2011-10-20', 10, 008);
INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES (009, '2011-10-20', 8, 009);
INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES (010, '2011-10-20', 8, 010);

SELECT * FROM ksiegowosc.godziny;

INSERT INTO ksiegowosc.pensje (id_pensji, stanowisko, kwota)
VALUES (001, 'Konsultant', 10000);
INSERT INTO ksiegowosc.pensje (id_pensji, stanowisko, kwota)
VALUES (002, 'Prezes', 20000);
INSERT INTO ksiegowosc.pensje (id_pensji, stanowisko, kwota)
VALUES (003, 'Technik', 4000);
INSERT INTO ksiegowosc.pensje (id_pensji, stanowisko, kwota)
VALUES (004, 'Obs³uga klienta', 10000);
INSERT INTO ksiegowosc.pensje (id_pensji, stanowisko, kwota)
VALUES (005, 'Technik', 4000);
INSERT INTO ksiegowosc.pensje (id_pensji, stanowisko, kwota)
VALUES (006, 'Ksiêgowy', 8000);
INSERT INTO ksiegowosc.pensje (id_pensji, stanowisko, kwota)
VALUES (007, 'Starszy analityk', 12000);
INSERT INTO ksiegowosc.pensje (id_pensji, stanowisko, kwota)
VALUES (008, 'M³odszy analityk', 9000);
INSERT INTO ksiegowosc.pensje (id_pensji, stanowisko, kwota)
VALUES (009, 'Kierownik dzia³u rozwoju', 15000);
INSERT INTO ksiegowosc.pensje (id_pensji, stanowisko, kwota)
VALUES (010, 'Specjalista ds. promocji', 10000);

SELECT * FROM ksiegowosc.pensje

INSERT INTO ksiegowosc.premie (id_premii, rodzaj, kwota)
VALUES (001, 'motywacyjna', 500);
INSERT INTO ksiegowosc.premie (id_premii, rodzaj, kwota)
VALUES (002, 'indywidualna', 1000);
INSERT INTO ksiegowosc.premie (id_premii, rodzaj, kwota)
VALUES (003, 'motywacyjna', 500);
INSERT INTO ksiegowosc.premie (id_premii, rodzaj, kwota)
VALUES (004, 'indywidualna', 500);
INSERT INTO ksiegowosc.premie (id_premii, rodzaj, kwota)
VALUES (005, 'motywacyjna', 1000);
INSERT INTO ksiegowosc.premie (id_premii, rodzaj, kwota)
VALUES (006, 'indywidualna', 500);
INSERT INTO ksiegowosc.premie (id_premii, rodzaj, kwota)
VALUES (007, 'indywidualna', 500);
INSERT INTO ksiegowosc.premie (id_premii, rodzaj, kwota)
VALUES (008, 'motywacyjna', 500);
INSERT INTO ksiegowosc.premie (id_premii, rodzaj, kwota)
VALUES (009, 'd³ugoterminowa', 250);
INSERT INTO ksiegowosc.premie (id_premii, rodzaj, kwota)
VALUES (010, 'motywacyjna', 5000);

SELECT * FROM ksiegowosc.premie

INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii)
VALUES (001, '2011-10-20', 001, 001, 001, 001);
INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii)
VALUES (002, '2011-10-20', 002, 002, 002, 002);
INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii)
VALUES (003, '2011-10-20', 003, 003, 003, 003);
INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii)
VALUES (004, '2011-10-20', 004, 004, 004, NULL);
INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii)
VALUES (005, '2011-10-20', 005, 005, 005, 005);
INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii)
VALUES (006, '2011-10-20', 006, 006, 006, 006);
INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii)
VALUES (007, '2011-10-20', 007, 007, 007, 007);
INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii)
VALUES (008, '2011-10-20', 008, 008, 008, 008);
INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii)
VALUES (009, '2011-10-20', 009, 009, 009, NULL);
INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii)
VALUES (010, '2011-10-20', 010, 010, 010, 010);

SELECT * FROM ksiegowosc.wynagrodzenie;

-- 6. Wykonaj nastêpuj¹ce zapytania:
-- a) Wyœwietl tylko id pracownika oraz jego nazwisko.

SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;

-- b) Wyœwietl id pracowników, których p³aca jest wiêksza ni¿ 1000.

SELECT id_pracownika, kwota
FROM ksiegowosc.wynagrodzenie
JOIN ksiegowosc.pensje
ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
WHERE ksiegowosc.pensje.kwota > 8000;

-- c) Wyœwietl id pracowników nieposiadaj¹cych premii, których p³aca jest wiêksza ni¿ 10000.

SELECT id_pracownika
FROM ksiegowosc.wynagrodzenie
JOIN ksiegowosc.pensje
ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
WHERE kwota > 10000 AND id_premii IS NULL;

-- d) Wyœwietl pracowników, których pierwsza litera imienia zaczyna siê na literê ‘J’.

SELECT imie, nazwisko FROM ksiegowosc.pracownicy WHERE imie LIKE 'J%';

-- e) Wyœwietl pracowników, których nazwisko zawiera literê ‘n’ oraz imiê koñczy siê na literê ‘a’.

SELECT imie, nazwisko FROM ksiegowosc.pracownicy WHERE nazwisko LIKE '%n%a';

-- f) Wyœwietl imiê i nazwisko pracowników oraz liczbê ich nadgodzin, przyjmuj¹c, i¿ standardowy czas
-- pracy to 160 h miesiêcznie.

SELECT imie, nazwisko, (liczba_godzin*20-160) AS nadgodziny
FROM ksiegowosc.pracownicy
JOIN (ksiegowosc.wynagrodzenie JOIN ksiegowosc.godziny ON ksiegowosc.wynagrodzenie.id_godziny = ksiegowosc.godziny.id_godziny)
ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika;

-- g) Wyœwietl imiê i nazwisko pracowników, których pensja zawiera siê w przedziale 5000 – 10000 PLN.

SELECT imie, nazwisko, kwota
FROM ksiegowosc.pracownicy
JOIN (ksiegowosc.wynagrodzenie JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji)
ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
WHERE kwota > 5000 AND kwota < 10000;

-- h) Wyœwietl imiê i nazwisko pracowników, którzy pracowali w nadgodzinach i nie otrzymali premii.

SELECT imie, nazwisko, (liczba_godzin*20-160) AS nadgodziny
FROM ksiegowosc.pracownicy JOIN (ksiegowosc.godziny JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.wynagrodzenie.id_godziny = ksiegowosc.godziny.id_godziny)
ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
WHERE (liczba_godzin*20-160)>0 AND id_premii IS NULL;

-- i) Uszereguj pracowników wed³ug pensji.

SELECT imie, nazwisko, kwota
FROM ksiegowosc.pracownicy
JOIN (ksiegowosc.wynagrodzenie JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji)
ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
ORDER BY ksiegowosc.pensje.kwota;

-- j) Uszereguj pracowników wed³ug pensji i premii malej¹co.

SELECT imie, nazwisko, ksiegowosc.pensje.kwota AS pensja, ksiegowosc.premie.kwota AS premia
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
JOIN ksiegowosc.pensje ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenie.id_pensji
JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii
ORDER BY ksiegowosc.pensje.kwota DESC, ksiegowosc.premie.kwota DESC;

-- k) Zlicz i pogrupuj pracowników wed³ug pola ‘stanowisko’.

SELECT COUNT(stanowisko) AS iloœæ, stanowisko
FROM ksiegowosc.pensje
GROUP BY stanowisko;

-- l) Policz œredni¹, minimaln¹ i maksymaln¹ p³acê dla stanowiska ‘kierownik’ (je¿eli takiego nie masz, to
-- przyjmij dowolne inne).

SELECT stanowisko, AVG(kwota) AS Œrednia, MIN(kwota) AS Minimum, MAX(kwota) AS Maksimum
FROM ksiegowosc.pensje
GROUP BY stanowisko;

-- m) Policz sumê wszystkich wynagrodzeñ.

SELECT SUM(kwota) FROM ksiegowosc.pensje;

-- f) Policz sumê wynagrodzeñ w ramach danego stanowiska.

SELECT SUM(kwota) 
FROM ksiegowosc.pensje
GROUP BY stanowisko;

-- g) Wyznacz liczbê premii przyznanych dla pracowników danego stanowiska.

SELECT COUNT(ksiegowosc.premie.id_premii) AS iloœæ, stanowisko
FROM ksiegowosc.pensje
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii
GROUP BY ksiegowosc.pensje.stanowisko;

-- h) Usuñ wszystkich pracowników maj¹cych pensjê mniejsz¹ ni¿ 1200 z³.

DELETE FROM ksiegowosc.pensje WHERE kwota < 1200
