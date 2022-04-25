DROP SCHEMA IF EXISTS DUT_Info CASCADE;

CREATE SCHEMA DUT_Info;
SET SCHEMA DUT_Info;

DROP SCHEMA IF EXISTS DUT_Info CASCADE;

CREATE SCHEMA DUT_Info;

CREATE TABLE DUT_info._individu(
    id_individu integer,
    nom varchar(32) not null,
    prenom varchar(32) not null,
    date_naissance date not null,
    code_postal varchar(32) not null,
    ville varchar(32) not null,
    sexe char(1) not null,
    nationalite varchar(32) not null,
    INE varchar(32) not null,
    CONSTRAINT _individu_pk PRIMARY KEY (id_individu)
);

CREATE TABLE DUT_info._etudiant(
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

CREATE TABLE DUT_info._candidat (
    no_candidat int primary key,
    classement varchar(50) null,
    boursier_lycee varchar(50) not null,
    profil_candidat varchar(50) not null,
    etablissement varchar(50) not null,
    dept_etablissement varchar(50) not null,
    ville_etablissement varchar(50) not null,
    niveau_etude varchar(50) not null,
    type_formation_prec varchar(50) not null,
    serie_prec varchar(50) not null,
    dominante_prec varchar(50) not null,
    specialite_prec varchar(50) not null,
    LV1 varchar(50) not null,
    LV2 varchar(50) not null
);

CREATE TABLE DUT_info._inscription (
    groupe_tp char(2) not null,
    amenagement_evaluation varchar(50) not null
);

CREATE TABLE DUT_info._semestre (
    id_semestre int,
    num_semestre char(5) not null,
    annee_univ char(9) not null,
    CONSTRAINT _semestre PRIMARY KEY (id_semestre)
);

CREATE TABLE DUT_info._module (
    id_module char(5),
    libelle_module varchar(50) not null,
    ue char(2) not null,
    CONSTRAINT _module PRIMARY KEY (id_module)
);

CREATE TABLE DUT_info._programme (
    coefficient double precision not null,
);
