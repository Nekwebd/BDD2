CREATE DATABASE SDBM2
GO
USE SDBM2
GO

CREATE TABLE couleur (
--id_couleur PRIMARY KEY AUTO_INCREMENT,
--nom_couleur VARCHAR(25) NOT NULL,
id_couleur INT IDENTITY(1,1) NOT NULL,
nom_couleur VARCHAR(25) NOT NULL,
CONSTRAINT pk_couleur PRIMARY KEY CLUSTERED
(
id_couleur ASC
)
)
GO

CREATE TABLE typebiere (
--id_type PRIMARY KEY AUTO_INCREMENT,
--nom_type VARCHAR(25),
id_type INT IDENTITY(1,1) NOT NULL,
nom_type VARCHAR(25) NOT NULL,
CONSTRAINT pk_typebiere PRIMARY KEY NONCLUSTERED 
(
id_type ASC
)
)
GO

CREATE TABLE article (
--id_article PRIMARY KEY AUTO_INCREMENT,
--nom_article VARCHAR(60),
--prix_achat MONEY,
--volume INTEGER,
--titrage FLOAT
--)
id_article INT IDENTITY(1,1) NOT NULL,
nom_article VARCHAR(60) NOT NULL,
prix_achat FLOAT NOT NULL,
volume INT NULL,
titrage FLOAT NULL,
id_marque INT NOT NULL,
id_couleur INT NULL,
id_type INT NULL,
CONSTRAINT pk_article PRIMARY KEY NONCLUSTERED 
(
id_article ASC
)
)
GO

--CREATE TABLE ticket (
--annee PRIMARY KEY INTEGER NOT NULL,
--numero_ticket PRIMARY KEY INTEGER NOT NULL,
--date_vente DATE
--)

CREATE TABLE ticket(
	annee INT NOT NULL,
	numero_ticket INT NOT NULL,
	date_vente DATETIME NOT NULL,
	CONSTRAINT pk_vente PRIMARY KEY NONCLUSTERED 
	(
		annee ASC,
		numero_ticket ASC
	)
) 
GO

CREATE TABLE vendre (
annee INT NOT NULL,
numero_ticket INT NOT NULL,
id_article INT NOT NULL,
quantite INT NULL,
prix_vente MONEY,
CONSTRAINT pk_vendre PRIMARY KEY NONCLUSTERED 
	(
		annee ASC,
		numero_ticket ASC,
		id_article ASC
    )
)

CREATE TABLE marque (
--id_marque PRIMARY KEY AUTO_INCREMENT NOT NULL,
--nom_marque VARCHAR(25)
id_marque INT IDENTITY(1,1) NOT NULL,
nom_marque VARCHAR(40) NOT NULL,
id_pays INT NULL,
id_fabricant INT NULL,
CONSTRAINT pk_marque PRIMARY KEY NONCLUSTERED
(
id_marque ASC
)
)
GO


CREATE TABLE pays (
--id_pays PRIMARY KEY,
--nom_pays VARCHAR(25)
id_pays INT IDENTITY(1,1) NOT NULL,
nom_pays VARCHAR(40) NOT NULL,
id_continent INTEGER NOT NULL,
CONSTRAINT pk_pays PRIMARY KEY NONCLUSTERED
(
id_pays ASC
)
)
GO


CREATE TABLE fabricant (
--id_fabricant PRIMARY KEY AUTO_INCREMENT NOT NULL,
--nom_fabricant VARCHAR(25)
id_fabricant INT IDENTITY(1,1) NOT NULL,
nom_fabricant VARCHAR(40) NOT NULL,
CONSTRAINT pk_fabricant PRIMARY KEY NONCLUSTERED
(
id_fabricant ASC
)
)
GO

CREATE TABLE continent (
--id_continent PRIMARY KEY AUTO_INCREMENT,
--nom_continent VARCHAR(25)
id_continent INT IDENTITY(1,1) NOT NULL,
nom_continent VARCHAR(25) NOT NULL,
CONSTRAINT pk_continent PRIMARY KEY NONCLUSTERED
(
id_continent ASC
)
)
GO


ALTER TABLE marque  WITH CHECK ADD CONSTRAINT fk_marque_fabricant FOREIGN KEY(id_fabricant)
REFERENCES fabricant (id_fabricant)
GO

ALTER TABLE marque  WITH CHECK ADD CONSTRAINT fk_marque_pays FOREIGN KEY(id_pays)
REFERENCES pays (id_pays)
GO


ALTER TABLE pays  WITH CHECK ADD  CONSTRAINT fk_pays_continent FOREIGN KEY(id_continent)
REFERENCES continent (id_continent)
GO


ALTER TABLE article  WITH CHECK ADD  CONSTRAINT fk_article_couleur FOREIGN KEY(id_couleur)
REFERENCES couleur (id_couleur)
GO


ALTER TABLE article  WITH CHECK ADD  CONSTRAINT fk_article_marque FOREIGN KEY(id_marque)
REFERENCES marque (id_marque)
GO


ALTER TABLE article WITH CHECK ADD  CONSTRAINT fk_article_typebiere FOREIGN KEY(id_type)
REFERENCES typebiere (id_type)
GO

ALTER TABLE VENDRE  WITH CHECK ADD  CONSTRAINT FK_VENDRE_ARTICLE FOREIGN KEY(ID_ARTICLE)
REFERENCES ARTICLE (ID_ARTICLE)
GO


ALTER TABLE vendre  WITH CHECK ADD  CONSTRAINT fk_vendre_ticket FOREIGN KEY(annee, numero_ticket)
REFERENCES ticket (annee, numero_ticket)
GO

ALTER TABLE article WITH CHECK
ADD CONSTRAINT  ck_article_prix_achat CHECK (prix_achat > 0.5)
GO

ALTER TABLE article WITH CHECK
ADD CONSTRAINT ck_article_titrage check (titrage between 0.5 and 26)
GO

ALTER TABLE article WITH CHECK
ADD CONSTRAINT ck_article_volume CHECK (volume in (33,75))
GO

alter table ticket
add constraint DF_TICKET_DATE default (getdate()) for date_vente