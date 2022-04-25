DROP SCHEMA IF EXISTS DUT_Info CASCADE;

CREATE SCHEMA DUT_Info;
SET SCHEMA DUT_Info;

create table _candidat (
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
)

create _inscription (
    groupe_tp char(2) not null,
    amenagement_evaluation varchar(50) not null
)

create _semestre (
    id_semestre int primary key,
    num_semestre char(5) not null,
    annee_univ char(9) not null
)

create _module (
    id_module char(5) primary key,
    libelle_module varchar(50) not null,
    ue char(2) not null,
)

create _programme (
    coefficient double precision not null,
)
