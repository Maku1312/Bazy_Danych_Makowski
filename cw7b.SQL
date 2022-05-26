--1.Napisz procedurę wypisującą do konsoli ciąg Fibonacciego. Procedura musi przyjmować jako argument wejściowy liczbę n.
--Generowanie ciągu Fibonacciego musi zostać zaimplementowane jako osobna funkcja, wywoływana przez procedurę.

CREATE OR ALTER FUNCTION fibonacci_fun(@n INT)
RETURNS @tablica TABLE(liczba int)
AS
BEGIN
	DECLARE @a int = 0
	DECLARE @b int = 1
	DECLARE @c int = 0
	DECLARE @i INT = 0
	INSERT INTO @tablica VALUES(0),(1)
	WHILE @i < @n
	BEGIN
		SET @c = @a + @b
		SET @a = @b
		SET @b = @c
		INSERT INTO @tablica VALUES(@c)
		SET @i = @i + 1
	END
	RETURN
END;

CREATE OR ALTER PROCEDURE fibonacci_proc @n INT
AS
BEGIN
	SELECT * FROM dbo.fibonacci_fun(@n)
END

EXEC fibonacci_proc 15

--2.Napisz trigger DML, który po wprowadzeniu danych do tabeli Persons zmodyfikuje nazwisko tak, aby było napisane dużymi literami.

USE AdventureWorks2017

CREATE TRIGGER DML
ON Person.Person
AFTER INSERT 
AS
BEGIN
UPDATE Person.Person SET LastName = UPPER(LastName)
END;

--3.Przygotuj trigger ‘taxRateMonitoring’, który wyświetli komunikat o błędzie, jeżeli nastąpi zmiana wartości w polu ‘TaxRate’ o więcej niż 30%.

CREATE TRIGGER TaxRateMonitoring ON Sales.SalesTaxRate
INSTEAD OF UPDATE
AS
BEGIN
DECLARE @old INT, @new INT
SET @old = (SELECT TaxRate FROM deleted)
SET @new = (SELECT TaxRate FROM inserted)
IF (@new < 0.7 * @old OR @new > 1.3 * @old)
	PRINT 'Błąd! Zmiana wartości przekracza dopuszczalne 30%'
ELSE
	UPDATE Sales.SalesTaxRate
	SET TaxRate = @new
	WHERE SalesTaxRateID = (SELECT SalesTaxRateID FROM inserted)
END

--Usuwanie triggera

DROP TRIGGER Sales.TaxRateMonitoring

--Sprawdzanie działania triggera

SELECT * FROM Sales.SalesTaxRate

UPDATE Sales.SalesTaxRate SET TaxRate = 30 WHERE SalesTaxRateID = 1