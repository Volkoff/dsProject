[use DilnaSObrabecimiStroji]

CREATE TABLE Adresy(
    id_adres INTEGER IDENTITY (1,1) PRIMARY KEY NOT NULL

);

CREATE TABLE Dodavatele(
    id_dodav INTEGER IDENTITY (1,1) PRIMARY KEY NOT NULL,

    id_adres INTEGER FOREIGN KEY REFERENCES Adresy(id_adres) NOT NULL
);

CREATE TABLE Materialy(
    id_mater INTEGER IDENTITY (1,1) PRIMARY KEY NOT NULL,

    id_dodav INTEGER FOREIGN KEY REFERENCES Dodavatele(id_dodav)
);

CREATE TABLE Typy_stroju(
    id_typ_stroj INTEGER IDENTITY (1,1) PRIMARY KEY NOT NULL

);

CREATE TABLE Procesy(
    id_proc INTEGER IDENTITY (1,1) PRIMARY KEY NOT NULL,

    id_typ_stroj_1 INTEGER FOREIGN KEY REFERENCES Typy_stroju(id_typ_stroj) NOT NULL,
    id_typ_stroj_2 INTEGER FOREIGN KEY REFERENCES Typy_stroju(id_typ_stroj),
    id_typ_stroj_3 INTEGER FOREIGN KEY REFERENCES Typy_stroju(id_typ_stroj)
);

CREATE TABLE Firmy(
    id_firm INTEGER IDENTITY (1,1) PRIMARY KEY NOT NULL,

    id_adres INTEGER FOREIGN KEY REFERENCES Adresy(id_adres) NOT NULL
);

CREATE TABLE Nakupujici(
    id_nakup INTEGER IDENTITY (1,1) PRIMARY KEY NOT NULL,

    id_firm INTEGER FOREIGN KEY REFERENCES Firmy(id_firm),
    id_adres INTEGER FOREIGN KEY REFERENCES Adresy(id_adres) NOT NULL
);

CREATE TABLE Objednavky(
    id_obj INTEGER IDENTITY (1,1) PRIMARY KEY NOT NULL,

    id_nakup INTEGER FOREIGN KEY REFERENCES Nakupujici(id_nakup)
);

CREATE TABLE Vyrobky(
    id_vyrobk INTEGER IDENTITY (1,1) PRIMARY KEY NOT NULL,

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

    id_typ_stroj INTEGER FOREIGN KEY REFERENCES Typy_stroju(id_typ_stroj),
    id_adres INTEGER FOREIGN KEY REFERENCES Adresy(id_adres) NOT NULL
);




