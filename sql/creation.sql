PRAGMA foreign_keys = ON;

CREATE TABLE Joueur(
                       Id INTEGER PRIMARY KEY AUTOINCREMENT,
                       nom VARCHAR(50) NOT NULL,
                       UNIQUE(nom)
);

CREATE TABLE Salle(
                      Id INTEGER PRIMARY KEY AUTOINCREMENT,
                      nom VARCHAR(50) NOT NULL,
                      theme VARCHAR(50) NOT NULL,
                      ordre INT,
                      UNIQUE(nom),
                      UNIQUE(theme)
);

CREATE TABLE Question(
                         Id INTEGER PRIMARY KEY AUTOINCREMENT,
                         question TEXT NOT NULL,
                         ans_a TEXT,
                         ans_b TEXT,
                         ans_c TEXT,
                         answer VARCHAR(50),
                         difficulty INT,
                         Id_Salle INTEGER NOT NULL,
                         FOREIGN KEY(Id_Salle) REFERENCES Salle(Id)
);

CREATE TABLE Gardien(
                        Id INTEGER PRIMARY KEY AUTOINCREMENT ,
                        nom VARCHAR(50),
                        pv INT,
                        Id_Salle INTEGER NOT NULL,
                        UNIQUE(Id_Salle),
                        FOREIGN KEY(Id_Salle) REFERENCES Salle(Id)
);

CREATE TABLE Partie(
                       Id INTEGER PRIMARY KEY AUTOINCREMENT,
                       date_ DATE,
                       pvHero INT,
                       state TEXT NOT NULL DEFAULT 'en_cours',
                       points INTEGER NOT NULL DEFAULT 0,
                       aides INTEGER NOT NULL DEFAULT 2,
                       Id_Salle INTEGER NOT NULL,
                       Id_Joueur INTEGER NOT NULL,
                       FOREIGN KEY(Id_Salle) REFERENCES Salle(Id),
                       FOREIGN KEY(Id_Joueur) REFERENCES Joueur(Id)
);

CREATE TABLE Score(
                      Id INTEGER PRIMARY KEY AUTOINCREMENT,
                      points INT,
                      date_score DATE,
                      Id_Partie INTEGER NOT NULL,
                      UNIQUE(Id_Partie),
                      FOREIGN KEY(Id_Partie) REFERENCES Partie(Id)
);
