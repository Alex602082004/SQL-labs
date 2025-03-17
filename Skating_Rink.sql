-- Creare tabel Patinoar
CREATE TABLE Patinoar (
    idPatinoar INT PRIMARY KEY,
    Nume VARCHAR(100) NOT NULL,
    Adresa VARCHAR(200) NOT NULL
);

-- Creare tabel Ring
CREATE TABLE Ring (
    idRing INT PRIMARY KEY,
    Nume VARCHAR(200) NOT NULL,
    GradDificultate VARCHAR(100) NOT NULL,
    idPatinoar INT NOT NULL,
    FOREIGN KEY (idPatinoar) REFERENCES Patinoar(idPatinoar)
);

-- Creare tabel Echipament
CREATE TABLE Echipament (
    idEchipament INT PRIMARY KEY,
    idPatinoar INT NOT NULL,
    Denumire VARCHAR(200) NOT NULL,
    Pret DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (idPatinoar) REFERENCES Patinoar(idPatinoar)
);

-- Creare tabel Client
CREATE TABLE Client (
    idClient INT PRIMARY KEY,
    Nume VARCHAR(200) NOT NULL,
    Telefon VARCHAR(15) NOT NULL
);

-- Creare tabel Inchiriere
CREATE TABLE Inchiriere (
    idInchiriere INT PRIMARY KEY,
    idClient INT NOT NULL,
    idEchipament INT NOT NULL,
    DataInchiriere DATE NOT NULL,
    Pret DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (idClient) REFERENCES Client(idClient),
    FOREIGN KEY (idEchipament) REFERENCES Echipament(idEchipament)
);
GO

-- Procedura GestionareInchiriere
CREATE or ALTER PROCEDURE GestionareInchiriere
    @idInchiriere INT,
    @idClient INT,
    @idEchipament INT,
    @DataInchiriere DATE,
    @Pret DECIMAL(10, 2)
AS
BEGIN
    DECLARE @ExistaInchiriere INT;

    -- Verifică dacă există deja închirierea
    SELECT @ExistaInchiriere = COUNT(*)
    FROM Inchiriere
    WHERE idInchiriere = @idInchiriere;

    -- Dacă există, actualizează
    IF @ExistaInchiriere > 0
    BEGIN
        UPDATE Inchiriere
        SET idClient = @idClient, 
            idEchipament = @idEchipament, 
            DataInchiriere = @DataInchiriere, 
            Pret = @Pret
        WHERE idInchiriere = @idInchiriere;
    END
    ELSE
    BEGIN
        -- Dacă nu există, inserează
        INSERT INTO Inchiriere (idInchiriere, idClient, idEchipament, DataInchiriere, Pret)
        VALUES (@idInchiriere, @idClient, @idEchipament, @DataInchiriere, @Pret);
    END
END;
GO

-- Trigger cu PRINT în loc de LogOperatii
CREATE OR ALTER TRIGGER TriggerInchiriere
ON Inchiriere
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        PRINT 'Operație realizată: Închiriere nouă sau modificare';
        SELECT 'Detalii Închiriere:', * FROM inserted;
    END
END;
GO
	
-- Inserare date în tabelul Patinoar
INSERT INTO Patinoar (idPatinoar, Nume, Adresa) VALUES 
(1, 'Patinoar Central', 'Strada Principala 1'),
(2, 'Patinoar Nord', 'Strada Libertatii 10'),
(3, 'Patinoar Sud', 'Bulevardul Independentei 5');

-- Inserare date în tabelul Client
INSERT INTO Client (idClient, Nume, Telefon) VALUES 
(1, 'Ion Popescu', '0723456789'),
(2, 'Maria Ionescu', '0744567890'),
(3, 'George Vasile', '0712345678');

-- Inserare date în tabelul Echipament
INSERT INTO Echipament (idEchipament, idPatinoar, Denumire, Pret) VALUES 
(1, 1, 'Patine', 20.00),
(2, 1, 'Casca Protectie', 10.00),
(3, 2, 'Patine', 25.00);

-- Inserare date în tabelul Ring
INSERT INTO Ring (idRing, Nume, GradDificultate, idPatinoar) VALUES 
(1, 'Ring Avansati', 'Avansat', 1),
(2, 'Ring Incepatori', 'Usor', 1),
(3, 'Ring Mediu', 'Mediu', 2);
GO

-- Apelare procedură pentru a gestiona închirierea
EXEC GestionareInchiriere 
    @idInchiriere = 1, 
    @idClient = 1, 
    @idEchipament = 1, 
    @DataInchiriere = '2025-01-15', 
    @Pret = 20.00;

-- Apelare procedură pentru o închiriere nouă
EXEC GestionareInchiriere 
    @idInchiriere = 2, 
    @idClient = 2, 
    @idEchipament = 2, 
    @DataInchiriere = '2025-01-16', 
    @Pret = 10.00;

-- Verificare date în tabelul Inchiriere
SELECT * FROM Inchiriere;
GO



