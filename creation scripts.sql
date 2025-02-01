CREATE DATABASE SalesDB;
GO

USE SalesDB;
GO

-- Creation de la table de dimensions client
CREATE TABLE Client (
    PK_Client INT IDENTITY(1,1) PRIMARY KEY,
    Prenom VARCHAR(50),
    Sexe VARCHAR(10),
    Civilite VARCHAR(20),
    Age INT
);
GO

-- Création de la table de dimensions zone
CREATE TABLE Zone (
    PK_Zone INT IDENTITY(1,1) PRIMARY KEY,
    Ville VARCHAR(50),
    Etat VARCHAR(50),
    Region VARCHAR(50)
);
GO

-- Creation de la table de dimensions date
CREATE TABLE DateTable (
    PK_Date INT IDENTITY(1,1) PRIMARY KEY,
    Date_ DATE,
    Annee INT,
    Mois INT,
    Jour INT,
    Jour_de_Semaine NVARCHAR(20)
);
GO

-- Création de la table des faits commande
CREATE TABLE Commande (
    PK_Commande INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalVente DECIMAL(18,2),
    Taxe DECIMAL(18,2),
    Mode_Reglement VARCHAR(50),
    Statut_Ordre VARCHAR(50),
    Source_Cmd VARCHAR(50),
    PK_Client INT NOT NULL,
    PK_Zone INT NOT NULL,
    PK_Date INT NOT NULL,
    FOREIGN KEY (PK_Client) REFERENCES Client(PK_Client),
    FOREIGN KEY (PK_Zone) REFERENCES Zone(PK_Zone),
    FOREIGN KEY (PK_Date) REFERENCES DateTable(PK_Date)
);
GO
