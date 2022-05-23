DROP SCHEMA IF EXISTS partie2 CASCADE;

CREATE SCHEMA partie2;
SET SCHEMA 'partie2';

CREATE TABLE _individu(
    ine varchar(32),
    nom varchar(32) not null,
    prenom varchar(32) not null,
    date_naissance date not null,
    code_postal varchar(32),
    ville varchar(50),
    sexe char(1) not null,
    nationalite varchar(32) not null,
    CONSTRAINT _individu_pk PRIMARY KEY (ine)
);

CREATE TABLE _etudiant(
    code_nip varchar(32),
    cat_socio_etu varchar(50),
    cat_socio_parent varchar(50),
    bourse_superieur varchar(50),
    mention_bac varchar(32),
    serie_bac varchar(32),
    dominante_bac varchar(100),
    special_bac varchar(100),
    mois_annee_obtention_bac varchar(20),
    ine varchar(32),
    CONSTRAINT _etudiant_pk PRIMARY KEY (code_nip)
);

CREATE TABLE _candidat(
    ine varchar(32),
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
    CONSTRAINT _candidat_pk PRIMARY KEY (ine)
);

CREATE TABLE _inscription(
    groupe_tp char(2),
    amenagement_evaluation varchar(50),
    code_nip varchar(32),
    num_semestre varchar(5),
    annee_univ char(9),
    ine varchar(32),
    CONSTRAINT _inscription_pk PRIMARY KEY (code_nip, num_semestre, annee_univ)
);

CREATE TABLE _semestre(
    num_semestre varchar(5),
    annee_univ char(9),
    CONSTRAINT _semestre_pk PRIMARY KEY (num_semestre,annee_univ)
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
    num_semestre varchar(5),
    annee_univ char(9),
    CONSTRAINT _resultat_pk PRIMARY KEY (id_module, code_nip, num_semestre, annee_univ)
);

CREATE TABLE _programme(
    coefficient double precision not null,
    id_module char(5),
    num_semestre varchar(5),
    annee_univ char(9),
    CONSTRAINT _programme_pk PRIMARY KEY (id_module, num_semestre, annee_univ)
);

CREATE TABLE _s_inscrire(
    ine varchar(32),
    code_nip varchar(32),
    CONSTRAINT _s_inscrire_pk PRIMARY KEY (ine, code_nip)
);

CREATE TABLE _resultat_tmp(
    moyenne varchar(5),
    id_module char(5),
    code_nip varchar(32),
    num_semestre varchar(5),
    annee_univ char(9),
    CONSTRAINT _resultat_tmp_pk PRIMARY KEY (id_module, code_nip, num_semestre, annee_univ)
);


ALTER TABLE _resultat ADD
    CONSTRAINT _resultat_id_module_fk FOREIGN KEY (id_module) REFERENCES _module(id_module);
ALTER TABLE _resultat ADD
    CONSTRAINT _resultat_code_nip_fk FOREIGN KEY (code_nip) REFERENCES _etudiant(code_nip);
ALTER TABLE _resultat ADD
    CONSTRAINT _resultat_num_semestre_a_univ_fk FOREIGN KEY (num_semestre, annee_univ) REFERENCES _semestre(num_semestre, annee_univ);
    
ALTER TABLE _programme ADD
    CONSTRAINT _programme_id_module_fk FOREIGN KEY (id_module) REFERENCES _module(id_module);
ALTER TABLE _programme ADD
    CONSTRAINT _programme_num_semestre_a_univ_fk FOREIGN KEY (num_semestre, annee_univ) REFERENCES _semestre(num_semestre, annee_univ);

ALTER TABLE _inscription ADD
    CONSTRAINT _inscription_ine_fk FOREIGN KEY (ine) REFERENCES _individu(ine);

ALTER TABLE _inscription ADD
    CONSTRAINT _inscription_code_nip_fk FOREIGN KEY (code_nip) REFERENCES _etudiant(code_nip);
ALTER TABLE _inscription ADD
    CONSTRAINT _inscription_num_semestre_a_univ_fk FOREIGN KEY (num_semestre, annee_univ) REFERENCES _semestre(num_semestre, annee_univ);
    
ALTER TABLE _s_inscrire ADD
    CONSTRAINT _s_inscrire_ine_fk FOREIGN KEY (ine) REFERENCES _individu(ine);
ALTER TABLE _s_inscrire ADD
    CONSTRAINT _s_inscrire_code_nip_fk FOREIGN KEY (code_nip) REFERENCES _etudiant(code_nip);

ALTER TABLE _etudiant ADD
    CONSTRAINT _etudiant_ine_fk FOREIGN KEY (ine) REFERENCES _individu(ine);
ALTER TABLE _candidat ADD
    CONSTRAINT _candidat_ine_fk FOREIGN KEY (ine) REFERENCES _individu(ine);
