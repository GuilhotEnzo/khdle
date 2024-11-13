DROP TABLE khdleEstAffilie;
DROP TABLE khdlePerso;
DROP TABLE khdleOrigine;
DROP TABLE khdleJeu;
DROP TABLE khdleAffiliation;

-- Table khdlePerso
CREATE TABLE khdlePerso (
    idPerso INT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    genre VARCHAR(20),
    idOrigine INT,
    idJeu INT
);

-- Table khdleAffiliation
CREATE TABLE khdleAffiliation (
    idAffiliation INT PRIMARY KEY,
    nomAffiliation VARCHAR(100) NOT NULL
);

-- Table khdleEstAffilie
CREATE TABLE khdleEstAffilie (
    idPerso INT,
    idAffiliation INT,
    PRIMARY KEY (idPerso, idAffiliation)
);

-- Table khdleOrigine
CREATE TABLE khdleOrigine (
    idOrigine INT PRIMARY KEY,
    nomOrigine VARCHAR(100) NOT NULL
);

-- Table khdleJeu
CREATE TABLE khdleJeu (
    idJeu INT PRIMARY KEY,
    nomJeu VARCHAR(100) NOT NULL
);

-- Ajout des contraintes de clé étrangère
ALTER TABLE khdlePerso
ADD CONSTRAINT fk_perso_origine
FOREIGN KEY (idOrigine) REFERENCES khdleOrigine(idOrigine);

ALTER TABLE khdlePerso
ADD CONSTRAINT fk_perso_jeu
FOREIGN KEY (idJeu) REFERENCES khdleJeu(idJeu);

ALTER TABLE khdleEstAffilie
ADD CONSTRAINT fk_estaffilie_perso
FOREIGN KEY (idPerso) REFERENCES khdlePerso(idPerso);

ALTER TABLE khdleEstAffilie
ADD CONSTRAINT fk_estaffilie_affiliation
FOREIGN KEY (idAffiliation) REFERENCES khdleAffiliation(idAffiliation);

INSERT INTO khdleJeu (idJeu, nomJeu) VALUES
(1, 'Kingdom Hearts'),
(2, 'Kingdom Hearts: Chain of Memories'),
(3, 'Kingdom Hearts II'),
(4, 'Kingdom Hearts 358/2 Days'),
(5, 'Kingdom Hearts Birth by Sleep'),
(6, 'Kingdom Hearts coded'),
(7, 'Kingdom Hearts 3D: Dream Drop Distance'),
(8, 'Kingdom Hearts χ'),
(9, 'Kingdom Hearts 0.2: Birth by Sleep – A Fragmentary Passage'),
(10, 'Kingdom Hearts III'),
(11, 'Kingdom Hearts: Melody of Memory'),
(12, 'Kingdom Hearts Union X'),
(13, 'Kingdom Hearts Dark Road'),
(14, 'Kingdom Hearts Missing Links');

INSERT INTO khdleOrigine (idOrigine, nomOrigine) VALUES
(1, 'Destiny Islands'),
(2, 'Traverse Town'),
(3, 'Wonderland'),
(4, 'Olympus Coliseum'),
(5, 'Deep Jungle'),
(6, 'Agrabah'),
(7, 'Atlantica'),
(8, 'Halloween Town'),
(9, 'Neverland'),
(10, 'Hollow Bastion'),
(11, '100 Acre Wood'),
(12, 'End of the World'),
(13, 'Disney Castle'),
(14, 'Twilight Town'),
(15, 'The World That Never Was'),
(16, 'Land of Dragons'),
(17, 'Beast''s Castle'),
(18, 'Port Royal'),
(19, 'Pride Lands'),
(20, 'Space Paranoids'),
(21, 'Radiant Garden'),
(22, 'The Land of Departure'),
(23, 'Castle Oblivion'),
(24, 'Kingdom of Corona'),
(25, 'Toy Box'),
(26, 'Monstropolis'),
(27, 'Arendelle'),
(28, 'San Fransokyo'),
(29, 'The Caribbean'),
(30, 'Scala ad Caelum');

INSERT INTO khdleAffiliation (idAffiliation, nomAffiliation) VALUES
(1, 'Disney'),
(2, 'Final Fantasy'),
(3, 'Groupe de Maléfique'),
(4, 'Organisation XIII'),
(5, 'Comité de Restauration du Jardin Radieux'),
(6, 'Dandelions'),
(7, 'Union Unicornis'),
(8, 'Union Anguis'),
(9, 'Union Leopardos'),
(10, 'Union Ursus'),
(11, 'Union Vulpes'),
(12, 'Foretellers'),
(13, 'Élèves de l''Académie des Maîtres de la Keyblade'),
(14, 'Gardiens de la Lumière'),
(15, 'Chercheurs des Ténèbres'),
(16, 'Habitants de la Cité du Crépuscule');

-- Insertion des personnages dans khdlePerso
INSERT INTO khdlePerso (idPerso, nom, genre, idOrigine, idJeu) VALUES
(1, 'Sora', 'Masculin', 1, 1),
(2, 'Riku', 'Masculin', 1, 1),
(3, 'Kairi', 'Féminin', 1, 1),
(4, 'Mickey Mouse', 'Masculin', 13, 1),
(5, 'Donald Duck', 'Masculin', 13, 1),
(6, 'Goofy', 'Masculin', 13, 1),
(7, 'Roxas', 'Masculin', 14, 3),
(8, 'Axel', 'Masculin', 21, 2),
(9, 'Xion', 'Féminin', 15, 4),
(10, 'Naminé', 'Féminin', 23, 2),
(11, 'Terra', 'Masculin', 22, 5),
(12, 'Aqua', 'Féminin', 22, 5),
(13, 'Ventus', 'Masculin', 22, 5),
(14, 'Xehanort', 'Masculin', 1, 5),
(15, 'Ansem le Sage', 'Masculin', 21, 1),
(16, 'Maléfique', 'Féminin', 10, 1),
(17, 'Cloud', 'Masculin', 21, 1),
(18, 'Leon', 'Masculin', 21, 1),
(19, 'Yuffie', 'Féminin', 21, 1),
(20, 'Aerith', 'Féminin', 21, 1);

-- Insertion des affiliations dans khdleEstAffilie
INSERT INTO khdleEstAffilie (idPerso, idAffiliation) VALUES
(1, 14), -- Sora - Gardiens de la Lumière
(2, 14), -- Riku - Gardiens de la Lumière
(3, 14), -- Kairi - Gardiens de la Lumière
(4, 1),  -- Mickey - Disney
(4, 14), -- Mickey - Gardiens de la Lumière
(5, 1),  -- Donald - Disney
(6, 1),  -- Goofy - Disney
(7, 4),  -- Roxas - Organisation XIII
(7, 14), -- Roxas - Gardiens de la Lumière
(8, 4),  -- Axel - Organisation XIII
(8, 14), -- Axel - Gardiens de la Lumière
(9, 4),  -- Xion - Organisation XIII
(9, 14), -- Xion - Gardiens de la Lumière
(10, 14),-- Naminé - Gardiens de la Lumière
(11, 14),-- Terra - Gardiens de la Lumière
(12, 14),-- Aqua - Gardiens de la Lumière
(13, 14),-- Ventus - Gardiens de la Lumière
(14, 15),-- Xehanort - Chercheurs des Ténèbres
(15, 5), -- Ansem le Sage - Comité de Restauration du Jardin Radieux
(16, 3), -- Maléfique - Groupe de Maléfique
(17, 2), -- Cloud - Final Fantasy
(17, 5), -- Cloud - Comité de Restauration du Jardin Radieux
(18, 2), -- Leon - Final Fantasy
(18, 5), -- Leon - Comité de Restauration du Jardin Radieux
(19, 2), -- Yuffie - Final Fantasy
(19, 5), -- Yuffie - Comité de Restauration du Jardin Radieux
(20, 2), -- Aerith - Final Fantasy
(20, 5); -- Aerith - Comité de Restauration du Jardin Radieux

-- Insertion des membres de l'Organisation XIII
INSERT INTO khdlePerso (idPerso, nom, genre, idOrigine, idJeu) VALUES
(21, 'Xemnas', 'Masculin', 1, 2),
(22, 'Xigbar', 'Masculin', 1, 2),
(23, 'Xaldin', 'Masculin', 4, 2),
(24, 'Vexen', 'Masculin', 10, 2),
(25, 'Lexaeus', 'Masculin', 10, 2),
(26, 'Zexion', 'Masculin', 10, 2),
(27, 'Saïx', 'Masculin', 14, 2),
(28, 'Demyx', 'Masculin', 21, 2),
(29, 'Luxord', 'Masculin', 21, 2),
(30, 'Marluxia', 'Masculin', 12, 2),
(31, 'Larxene', 'Féminin', 12, 2),
(32, 'Roxas', 'Masculin', 14, 3);

-- Insertion des méchants du groupe de Maléfique
INSERT INTO khdlePerso (idPerso, nom, genre, idOrigine, idJeu) VALUES
(33, 'Maléfique', 'Féminin', 10, 1),
(34, 'Jafar', 'Masculin', 6, 1),
(35, 'Scar', 'Masculin', 19, 1),
(36, 'Hades', 'Masculin', 4, 1);

-- Insertion d'autres personnages Disney
INSERT INTO khdlePerso (idPerso, nom, genre, idOrigine, idJeu) VALUES
(37, 'Cendrillon', 'Féminin', 13, 1),
(38, 'Peter Pan', 'Masculin', 9, 1),
(39, 'Ariel', 'Féminin', 7, 1),
(40, 'Simba', 'Masculin', 19, 1);

-- Insertion des affiliations pour les membres de l'Organisation XIII
INSERT INTO khdleEstAffilie (idPerso, idAffiliation) VALUES
(21, 4), -- Xemnas - Organisation XIII
(22, 4), -- Xigbar - Organisation XIII
(23, 4), -- Xaldin - Organisation XIII
(24, 4), -- Vexen - Organisation XIII
(25, 4), -- Lexaeus - Organisation XIII
(26, 4), -- Zexion - Organisation XIII
(27, 4), -- Saïx - Organisation XIII
(28, 4), -- Demyx - Organisation XIII
(29, 4), -- Luxord - Organisation XIII
(30, 4), -- Marluxia - Organisation XIII
(31, 4), -- Larxene - Organisation XIII
(32, 14);-- Roxas - Gardiens de la Lumière

-- Insertion des affiliations pour les méchants du groupe de Maléfique
INSERT INTO khdleEstAffilie (idPerso, idAffiliation) VALUES
(33, 3), -- Maléfique - Groupe de Maléfique
(34, 3), -- Jafar - Groupe de Maléfique
(35, 3), -- Scar - Groupe de Maléfique
(36, 3); -- Hades - Groupe de Maléfique

-- Insertion des affiliations pour les personnages Disney
INSERT INTO khdleEstAffilie (idPerso, idAffiliation) VALUES
(37, 1), -- Cendrillon - Disney
(38, 1), -- Peter Pan - Disney
(39, 1), -- Ariel - Disney
(40, 1); -- Simba - Disney

-- Insertion des personnages de Kingdom Hearts: Dark Road
INSERT INTO khdlePerso (idPerso, nom, genre, idOrigine, idJeu) VALUES
(41, 'Xehanort jeune', 'Masculin', 30, 13),
(42, 'Eraqus', 'Masculin', 30, 13),
(43, 'Baldr', 'Masculin', 30, 13),
(44, 'Vidar', 'Masculin', 30, 13),
(45, 'Hoder', 'Masculin', 30, 13),
(46, 'Bragi', 'Masculin', 30, 13),
(47, 'Vor', 'Féminin', 30, 13),
(48, 'Hermod', 'Masculin', 30, 13),
(49, 'Urd', 'Féminin', 30, 13);

-- Insertion des personnages Dandelions de Kingdom Hearts Union χ
INSERT INTO khdlePerso (idPerso, nom, genre, idOrigine, idJeu) VALUES
(50, 'Luxu', 'Masculin', 30, 12),
(51, 'Master of Masters', 'Masculin', 30, 12),
(52, 'Aced', 'Masculin', 30, 12),
(53, 'Invi', 'Féminin', 30, 12),
(54, 'Gula', 'Masculin', 30, 12),
(55, 'Ava', 'Féminin', 30, 12),
(56, 'Ephemer', 'Masculin', 30, 12),
(57, 'Skuld', 'Féminin', 30, 12);

-- Insertion mise à jour des affiliations pour les personnages de Kingdom Hearts: Dark Road
INSERT INTO khdleEstAffilie (idPerso, idAffiliation) VALUES
(41, 15), -- Xehanort - Chercheurs des Ténèbres
(42, 14), -- Eraqus - Gardiens de la Lumière
(41, 13), -- Xehanort - Chercheurs des Ténèbres
(42, 13), -- Eraqus - Gardiens de la Lumière
(43, 13), -- Baldr - Pas d'affiliation connue
(44, 13), -- Vidar - Pas d'affiliation connue
(45, 13), -- Hoder - Pas d'affiliation connue
(46, 13), -- Bragi - Pas d'affiliation connue
(47, 13), -- Vor - Pas d'affiliation connue
(48, 13), -- Hermod - Pas d'affiliation connue
(49, 13); -- Urd - Pas d'affiliation connue

-- Insertion mise à jour des affiliations pour les personnages Dandelions de Kingdom Hearts Union χ
INSERT INTO khdleEstAffilie (idPerso, idAffiliation) VALUES
(50, 12), -- Luxu - Pas d'affiliation connue mais lié aux Foretellers
(51, 12), -- Master of Masters - Pas d'affiliation connue mais lié aux Foretellers
(52, 12), -- Aced - Foreteller
(53, 12), -- Invi - Foreteller
(54, 12), -- Gula - Foreteller
(55, 12), -- Ava - Foreteller
(56, 6),   -- Ephemer - Dandelions 
(57, 6);   -- Skuld - Dandelions 

-- Insertion de personnages supplémentaires dans khdlePerso
INSERT INTO khdlePerso (idPerso, nom, genre, idOrigine, idJeu) VALUES
(58, 'Lea', 'Masculin', 21, 3),
(59, 'Isa', 'Masculin', 21, 3),
(60, 'Hayner', 'Masculin', 14, 3),
(61, 'Pence', 'Masculin', 14, 3),
(62, 'Olette', 'Féminin', 14, 3),
(63, 'Ansem, Chercheur des Ténèbres', 'Masculin', 21, 1),
(64, 'Xemnas', 'Masculin', 21, 2),
(65, 'Vanitas', 'Masculin', 22, 5),
(66, 'Strelitzia', 'Féminin', 30, 12),
(67, 'Lauriam', 'Masculin', 30, 12),
(68, 'Elrena', 'Féminin', 30, 12),
(69, 'Brain', 'Masculin', 30, 12),
(70, 'Yen Sid', 'Masculin', 13, 2);

-- Insertion des affiliations pour ces nouveaux personnages
INSERT INTO khdleEstAffilie (idPerso, idAffiliation) VALUES
(58, 14), -- Lea - Gardiens de la Lumière
(59, 4),  -- Isa - Organisation XIII (initialement)
(60, 16), -- Hayner - Habitants de la Cité du Crépuscule
(61, 16), -- Pence - Habitants de la Cité du Crépuscule
(62, 16), -- Olette - Habitants de la Cité du Crépuscule
(63, 15), -- Ansem, Chercheur des Ténèbres - Chercheurs des Ténèbres
(64, 4),  -- Xemnas - Organisation XIII
(65, 15), -- Vanitas - Chercheurs des Ténèbres
(66, 6),  -- Strelitzia - Dandelions
(67, 6),  -- Lauriam - Dandelions
(68, 6),  -- Elrena - Dandelions
(69, 6),  -- Brain - Dandelions
(70, 14); -- Yen Sid - Gardiens de la Lumière

