CREATE DATABASE Pozoriste
GO

USE Pozoriste
GO


CREATE TABLE Korisnici
(
    korisnik_id INT PRIMARY KEY IDENTITY(1,1),

    korisnicko_ime NVARCHAR(50) NOT NULL,

    lozinka NVARCHAR(50) NOT NULL,

    uloga NVARCHAR(20) NOT NULL
)
GO


CREATE TABLE Predstave
(
    predstava_id INT PRIMARY KEY IDENTITY(1,1),

    naziv NVARCHAR(100) NOT NULL,

    zanr NVARCHAR(50),

    trajanje_min INT,

    opis NVARCHAR(200)
)
GO

CREATE TABLE Termini
(
    termin_id INT PRIMARY KEY IDENTITY(1,1),

    predstava_id INT
    FOREIGN KEY REFERENCES Predstave(predstava_id),

    datum DATETIME,

    sala NVARCHAR(50),

    broj_mesta INT
)
GO

CREATE TABLE Rezervacije
(
    rezervacija_id INT PRIMARY KEY IDENTITY(1,1),

    korisnik_id INT
    FOREIGN KEY REFERENCES Korisnici(korisnik_id),

    termin_id INT
    FOREIGN KEY REFERENCES Termini(termin_id),

    broj_karata INT,

    status_rezervacije NVARCHAR(30)
)
GO


CREATE PROCEDURE ProveraKorisnika
    @ime NVARCHAR(50),
    @pass NVARCHAR(50)
AS
BEGIN

    SELECT *
    FROM Korisnici
    WHERE korisnicko_ime = @ime
    AND lozinka = @pass

END
GO


CREATE PROCEDURE Registracija
    @ime NVARCHAR(50),
    @pass NVARCHAR(50)
AS
BEGIN

    INSERT INTO Korisnici
    (
        korisnicko_ime,
        lozinka,
        uloga
    )
    VALUES
    (
        @ime,
        @pass,
        'korisnik'
    )

END
GO

CREATE PROCEDURE DodajPredstavu
    @naziv NVARCHAR(100),
    @zanr NVARCHAR(50),
    @trajanje INT,
    @opis NVARCHAR(200)
AS
BEGIN

    INSERT INTO Predstave
    VALUES
    (
        @naziv,
        @zanr,
        @trajanje,
        @opis
    )

END
GO

CREATE PROCEDURE PrikaziPredstave
AS
BEGIN

    SELECT *
    FROM Predstave

END
GO

CREATE PROCEDURE ObrisiPredstavu
    @id INT
AS
BEGIN

    DELETE FROM Predstave
    WHERE predstava_id = @id

END
GO


CREATE PROCEDURE DodajTermin
    @predstava_id INT,
    @datum DATETIME,
    @sala NVARCHAR(50),
    @broj_mesta INT
AS
BEGIN

    INSERT INTO Termini
    VALUES
    (
        @predstava_id,
        @datum,
        @sala,
        @broj_mesta
    )

END
GO

CREATE PROCEDURE PrikaziTermine
AS
BEGIN

    SELECT
        t.termin_id,
        p.naziv,
        t.datum,
        t.sala,
        t.broj_mesta

    FROM Termini t

    INNER JOIN Predstave p
        ON t.predstava_id = p.predstava_id

END
GO

CREATE PROCEDURE ObrisiTermin
    @id INT
AS
BEGIN

    DELETE FROM Termini
    WHERE termin_id = @id

END
GO

CREATE PROCEDURE DodajRezervaciju
    @korisnik_id INT,
    @termin_id INT,
    @broj_karata INT
AS
BEGIN

    INSERT INTO Rezervacije
    VALUES
    (
        @korisnik_id,
        @termin_id,
        @broj_karata,
        'aktivna'
    )

END
GO

CREATE PROCEDURE MojeRezervacije
    @korisnik_id INT
AS
BEGIN

    SELECT
        r.rezervacija_id,
        p.naziv,
        t.datum,
        t.sala,
        r.broj_karata,
        r.status_rezervacije

    FROM Rezervacije r

    INNER JOIN Termini t
        ON r.termin_id = t.termin_id

    INNER JOIN Predstave p
        ON t.predstava_id = p.predstava_id

    WHERE r.korisnik_id = @korisnik_id

END
GO

CREATE PROCEDURE ObrisiRezervaciju
    @id INT
AS
BEGIN

    DELETE FROM Rezervacije
    WHERE rezervacija_id = @id

END
GO

INSERT INTO Korisnici
VALUES
('admin', '1234', 'admin'),
('marko', '1234', 'korisnik')
GO

INSERT INTO Predstave
VALUES
('Hamlet', 'Drama', 120, 'Sekspirova drama'),
('Balkan Ekspres', 'Komedija', 95, 'Domaca komedija')
GO

INSERT INTO Termini
VALUES
(1, '2026-06-10 19:00', 'Sala 1', 100),
(2, '2026-06-11 20:00', 'Sala 2', 80)
GO
ALTER PROCEDURE PrikaziTermine
AS
BEGIN

    SELECT
        t.termin_id,
        p.naziv,
        p.zanr,
        p.trajanje_min,
        p.opis,
        t.datum,
        t.sala,
        t.broj_mesta

    FROM Termini t

    INNER JOIN Predstave p
        ON t.predstava_id = p.predstava_id

END
GO