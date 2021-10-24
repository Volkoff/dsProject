use DsProject;
CREATE TABLE Adresy(
    id_adres INTEGER IDENTITY (1,1) PRIMARY KEY NOT NULL,
	mesto nvarchar(25) NOT NULL,
	ulice nvarchar(25) NOT NULL, 
	cislo_popis int NOT NULL,
	psc decimal(5,0) NOT NULL

);

CREATE TABLE Dodavatele(
    id_dodav INTEGER IDENTITY (1,1) PRIMARY KEY NOT NULL,
    id_adres INTEGER FOREIGN KEY REFERENCES Adresy(id_adres) NOT NULL,
	nazev nvarchar(25) NOT NULL,
	telefon decimal(9,0) NOT NULL,
	email nvarchar(25) NOT NULL

);

CREATE TABLE Materialy(
    id_mater INTEGER IDENTITY (1,1) PRIMARY KEY NOT NULL,
    id_dodav INTEGER FOREIGN KEY REFERENCES Dodavatele(id_dodav) NOT NULL,
	nazev nvarchar(25) NOT NULL,
	popis nvarchar(100) NOT NULL,
	cena_za_kg decimal(8,2) NOT NULL

);

CREATE TABLE Typy_stroju(
    id_typ_stroj INTEGER IDENTITY (1,1) PRIMARY KEY NOT NULL,
	typ_stroj nvarchar(25) NOT NULL,
	vyuziti nvarchar(25) NOT NULL

);

CREATE TABLE Procesy(
    id_proc INTEGER IDENTITY (1,1) PRIMARY KEY NOT NULL,
    id_typ_stroj_1 INTEGER FOREIGN KEY REFERENCES Typy_stroju(id_typ_stroj) NOT NULL,
    id_typ_stroj_2 INTEGER FOREIGN KEY REFERENCES Typy_stroju(id_typ_stroj),
    id_typ_stroj_3 INTEGER FOREIGN KEY REFERENCES Typy_stroju(id_typ_stroj),
	nazev nvarchar(25) NOT NULL

);

CREATE TABLE Firmy(
    id_firm INTEGER IDENTITY (1,1) PRIMARY KEY NOT NULL,
    id_adres INTEGER FOREIGN KEY REFERENCES Adresy(id_adres) NOT NULL,
	nazev nvarchar(25) NOT NULL,
	telefon decimal(9,0) NOT NULL,
	email nvarchar(25) NOT NULL,
	ico decimal(8,0) NOT NULL,
	dic varchar(12) NOT NULL
);
---------------------------------------------------

CREATE TABLE Nakupujici(
    id_nakup INTEGER IDENTITY (1,1) PRIMARY KEY NOT NULL,

    id_firm INTEGER FOREIGN KEY REFERENCES Firmy(id_firm),
    id_adres INTEGER FOREIGN KEY REFERENCES Adresy(id_adres) NOT NULL
);

CREATE TABLE Objednavky(
    id_obj INTEGER IDENTITY (1,1) PRIMARY KEY NOT NULL,

    id_nakup INTEGER FOREIGN KEY REFERENCES Nakupujici(id_nakup)
);

CREATE TABLE Dilny(
    id_dil INTEGER IDENTITY (1,1) PRIMARY KEY NOT NULL,

    id_adres INTEGER FOREIGN KEY REFERENCES Adresy(id_adres)
);

CREATE TABLE Vyrobky(
    id_vyrobk INTEGER IDENTITY (1,1) PRIMARY KEY NOT NULL,

    id_dil INTEGER FOREIGN KEY REFERENCES Dilny(id_dil),
    id_proc INTEGER FOREIGN KEY REFERENCES Procesy(id_proc),
    id_obj INTEGER FOREIGN KEY REFERENCES Objednavky(id_obj)
);

CREATE TABLE Vyrobci(
    id_vyrobc INTEGER IDENTITY (1,1) PRIMARY KEY NOT NULL,

    id_adres INTEGER FOREIGN KEY REFERENCES Adresy(id_adres) NOT NULL
);

CREATE TABLE Stroje(
    id_stroj INTEGER IDENTITY (1,1) PRIMARY KEY NOT NULL,

    id_typ_stroj INTEGER FOREIGN KEY REFERENCES Typy_stroju(id_typ_stroj) NOT NULL,
    id_vyrobc INTEGER FOREIGN KEY REFERENCES Vyrobci(id_vyrobc)
);

CREATE TABLE Zamestnanci(
    id_zam INTEGER IDENTITY (1,1) PRIMARY KEY NOT NULL,
    id_dil INTEGER FOREIGN KEY REFERENCES Dilny(id_dil),
    id_typ_stroj INTEGER FOREIGN KEY REFERENCES Typy_stroju(id_typ_stroj),
    id_adres INTEGER FOREIGN KEY REFERENCES Adresy(id_adres) NOT NULL
);







