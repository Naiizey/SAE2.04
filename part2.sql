DROP SCHEMA IF EXISTS partie2 CASCADE;

CREATE SCHEMA partie2;
SET SCHEMA 'partie2';

CREATE TABLE _individu(
    id_individu serial,
    nom varchar(32) not null,
    prenom varchar(32) not null,
    date_naissance date not null,
    code_postal varchar(32),
    ville varchar(50),
    sexe char(1) not null,
    nationalite varchar(32) not null,
    ine varchar(32),
    CONSTRAINT _individu_pk PRIMARY KEY (id_individu)
);

CREATE TABLE _etudiant(
    code_nip varchar(32),
    cat_socio_etu varchar(32) not null,
    cat_socio_parent varchar(32) not null,
    bourse_superieur boolean not null,
    mention_bac varchar(32) not null,
    serie_bac varchar(32) not null,
    domainante_bac varchar(32) not null,
    special_bac varchar(32) not null,
    mois_annee_obtention_bac char(7),
    CONSTRAINT _etudiant_pk PRIMARY KEY (code_nip)
);

CREATE TABLE _candidat(
    no_candidat serial,
    classement varchar(50) null,
    boursier_lycee varchar(50) not null,
    profil_candidat varchar(75) not null,
    etablissement varchar(75),
    dept_etablissement varchar(75),
    ville_etablissement varchar(75),
    niveau_etude varchar(75),
    type_formation_prec varchar(75),
    serie_prec varchar(100),
    dominante_prec varchar(100),
    specialite_prec varchar(100),
    LV1 varchar(50),
    LV2 varchar(50),
    CONSTRAINT _candidat_pk PRIMARY KEY (no_candidat)
);

CREATE TABLE _inscription(
    groupe_tp char(2) not null,
    amenagement_evaluation varchar(50) not null,
    code_nip varchar(32),
    id_semestre int,
    CONSTRAINT _inscription_pk PRIMARY KEY (code_nip, id_semestre)
);

CREATE TABLE _semestre(
    id_semestre int,
    num_semestre char(5) not null,
    annee_univ char(9) not null,
    CONSTRAINT _semestre_pk PRIMARY KEY (id_semestre)
);

CREATE TABLE _module(
    id_module varchar(7),
    libelle_module varchar(125) not null,
    ue char(4) not null,
    CONSTRAINT _module_pk PRIMARY KEY (id_module)
);

CREATE TABLE _resultat(
    moyenne double precision not null,
    id_module char(5),
    code_nip varchar(32),
    id_semestre int,
    CONSTRAINT _resultat_pk PRIMARY KEY (id_module, code_nip, id_semestre)
);

CREATE TABLE _programme(
    coefficient double precision not null,
    id_module char(5),
    id_semestre int,
    CONSTRAINT _programme_pk PRIMARY KEY (id_module, id_semestre)
);

CREATE TABLE _postuler(
    id_individu int,
    no_candidat int,
    CONSTRAINT _postuler_pk PRIMARY KEY (id_individu, no_candidat)
);

CREATE TABLE _s_inscrire(
    id_individu int,
    code_nip varchar(32),
    CONSTRAINT _s_inscrire_pk PRIMARY KEY (id_individu, code_nip)
);

ALTER TABLE _resultat ADD
    CONSTRAINT _resultat_id_module_fk FOREIGN KEY (id_module) REFERENCES _module(id_module);
ALTER TABLE _resultat ADD
    CONSTRAINT _resultat_code_nip_fk FOREIGN KEY (code_nip) REFERENCES _etudiant(code_nip);
ALTER TABLE _resultat ADD
    CONSTRAINT _resultat_id_semestre_fk FOREIGN KEY (id_semestre) REFERENCES _semestre(id_semestre);
    
ALTER TABLE _programme ADD
    CONSTRAINT _programme_id_module_fk FOREIGN KEY (id_module) REFERENCES _module(id_module);
ALTER TABLE _programme ADD
    CONSTRAINT _programme_id_semestre_fk FOREIGN KEY (id_semestre) REFERENCES _semestre(id_semestre); 

ALTER TABLE _inscription ADD
    CONSTRAINT _inscription_code_nip_fk FOREIGN KEY (code_nip) REFERENCES _etudiant(code_nip);
ALTER TABLE _inscription ADD
    CONSTRAINT _inscription_id_semestre_fk FOREIGN KEY (id_semestre) REFERENCES _semestre(id_semestre);

ALTER TABLE _postuler ADD
    CONSTRAINT _postuler_id_individu_fk FOREIGN KEY (id_individu) REFERENCES _individu(id_individu);
ALTER TABLE _postuler ADD
    CONSTRAINT _postuler_no_candidat_fk FOREIGN KEY (no_candidat) REFERENCES _candidat(no_candidat);
    
ALTER TABLE _s_inscrire ADD
    CONSTRAINT _s_inscrire_id_individu_fk FOREIGN KEY (id_individu) REFERENCES _individu(id_individu);
ALTER TABLE _s_inscrire ADD
    CONSTRAINT _s_inscrire_code_nip_fk FOREIGN KEY (code_nip) REFERENCES _etudiant(code_nip);
