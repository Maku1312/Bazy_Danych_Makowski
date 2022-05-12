--Wykorzystując bazę danych stworzoną na poprzednich ćwiczeniach wykonaj następujące polecenia:

-- a) Zmodyfikuj numer telefonu w tabeli pracownicy, dodając do niego kierunkowy dla Polski w nawiasie (+48)

SELECT * FROM ksiegowosc.pracownicy;
ALTER TABLE ksiegowosc.pracownicy ALTER COLUMN telefon VARCHAR(16);
UPDATE ksiegowosc.pracownicy SET telefon = CONCAT('+48', telefon);

-- b) Zmodyfikuj atrybut telefon w tabeli pracownicy tak, aby numer oddzielony był myślnikami wg wzoru: ‘555-222-333’

SELECT SUBSTRING(telefon, 1, 3) FROM ksiegowosc.pracownicy;
UPDATE ksiegowosc.pracownicy SET telefon = CONCAT(SUBSTRING(telefon, 1, 3), ' ', SUBSTRING(telefon, 4, 3), '-', SUBSTRING(telefon, 7, 3), '-', SUBSTRING(telefon, 10, 3));

-- c) Wyświetl dane pracownika, którego nazwisko jest najdłuższe, używając dużych liter

SELECT * FROM ksiegowosc.pracownicy WHERE LEN(nazwisko) = (SELECT MAX(LEN(nazwisko)) FROM ksiegowosc.pracownicy);

-- d) Wyświetl dane pracowników i ich pensje zakodowane przy pomocy algorytmu md5

SELECT wynagrodzenie.id_pracownika, imie, nazwisko, kwota AS pensja, HASHBYTES('MD5', CONCAT(wynagrodzenie.id_pracownika, '-', imie, '-', nazwisko, '-', kwota)) AS MD5
FROM ksiegowosc.wynagrodzenie
JOIN ksiegowosc.pracownicy ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji;

-- f) Wyświetl pracowników, ich pensje oraz premie. Wykorzystaj złączenie lewostronne.

SELECT wynagrodzenie.id_pracownika, imie, nazwisko, pensje.kwota AS pensja, premie.kwota AS premia
FROM ksiegowosc.wynagrodzenie
JOIN ksiegowosc.pracownicy ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii;

-- g) wygeneruj raport (zapytanie), które zwróci w wyniki treść wg poniższego szablonu:
--Pracownik Jan Nowak, w dniu 7.08.2017 otrzymał pensję całkowitą na kwotę 7540 zł, gdzie wynagrodzenie zasadnicze wynosiło:
--5000 zł, premia: 2000 zł, nadgodziny: 540 zł

SELECT CONCAT('Pracownik ', imie, ' ', nazwisko, ' w dniu ', wynagrodzenie.data, ' otrzymał pensję całkowitą na kwotę ',
(pensje.kwota+premie.kwota+((liczba_godzin*20-160)*20)), ' zł, gdzie wynagrodzenie zasadnicze wynosiło: ', pensje.kwota, ' zł, premia: ',
premie.kwota, ' zł, nadgodziny: ', ((liczba_godzin*20-160)*20))
FROM ksiegowosc.wynagrodzenie
LEFT JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii
JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
JOIN ksiegowosc.pracownicy ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
JOIN ksiegowosc.godziny ON ksiegowosc.wynagrodzenie.id_godziny = ksiegowosc.godziny.id_godziny;