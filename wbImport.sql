set schema 'partie2';

WbImport -file=/media/glavazais/SSD/Cours/SAE 2.04/data/v_candidatures.csv
        -type=text
        -table=_individu
        -mode=update,insert
        -delimiter=';'
        -filecolumns=$wb_skip$,$wb_skip$,$wb_skip$,nom,prenom,sexe,date_naissance,nationalite,code_postal,ville,$wb_skip$,$wb_skip$,$wb_skip$,ine
        -dateformat="yyyy-MM-dd";
        
wbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_inscriptions.csv
         -type=text
         -table=_individu
         -mode=update,insert
         -delimiter=';'
         -filecolumns=%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,ine,nom,prenom,date_naissance,sexe,nationalite,code_postal,ville
         -dateformat="yyyy-MM-dd";
        
wbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_candidatures.csv
         -type=text
         -table=_candidat
         -mode=insert,update
         -delimiter=';'
         -filecolumns=$wb_skip$,$wb_skip$,classement,$wb_skip$,$wb_skip$,$wb_skip$,$wb_skip$,$wb_skip$,$wb_skip$,$wb_skip$,$wb_skip$,boursier_lycee,profil_candidat,ine,$wb_skip$,etablissement,ville_etablissement,dept_etablissement,$wb_skip$,niveau_etude,type_formation_prec,serie_prec,dominante_prec,specialite_prec,lv1,lv2
         -dateformat="yyyy-MM-dd";
         
WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/ppn.csv
         -delimiter=';'
         -table=_module
         -mode=update,insert
         -filecolumns=id_module,ue,libelle_module;
         
wbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_inscriptions.csv
         -type=text
         -table=_etudiant
         -mode=update,insert
         -delimiter=';'
         -filecolumns=%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,code_nip,ine,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,cat_socio_etu,cat_socio_parent,serie_bac,%wb_skip%,$wb_skip$,$wb_skip$,$wb_skip$,$wb_skip$,$wb_skip$,bourse_superieur
         -dateformat="yyyy-MM-dd";
         
wbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_candidatures.csv
         -type=text
         -table=_etudiant
         -keycolumns='ine'
         -mode=update
         -delimiter=';'
         -filecolumns=%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,boursier_superieur,%wb_skip%,ine,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,dominante_bac,special_bac,mention_bac,mois_annee_obtention_bac
         -dateformat="yyyy-MM-dd";
         
wbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -type=text
         -table=_semestre
         -mode=insert,update
         -delimiter=';'
         -filecolumns=annee_univ,num_semestre;
         
wbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -type=text
         -table=_semestre
         -mode=insert,update
         -delimiter=';'
         -filecolumns=annee_univ,num_semestre;
         
wbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -type=text
         -table=_semestre
         -mode=insert,update
         -delimiter=';'
         -filecolumns=annee_univ,num_semestre;
         
wbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -type=text
         -table=_semestre
         -mode=insert,update
         -delimiter=';'
         -filecolumns=annee_univ,num_semestre;
         
wbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -type=text
         -table=_inscription
         -mode=insert,update
         -delimiter=';'
         -filecolumns=%wb_skip%,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,groupe_tp;
         
wbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -type=text
         -table=_inscription
         -mode=update,insert
         -delimiter=';'
         -filecolumns=%wb_skip%,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,groupe_tp;
         
wbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -type=text
         -table=_inscription
         -mode=update,insert
         -delimiter=';'
         -filecolumns=%wb_skip%,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,groupe_tp;
         
wbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -type=text
         -table=_inscription
         -mode=update,insert
         -delimiter=';'
         -filecolumns=%wb_skip%,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,groupe_tp;

DELETE FROM _s_inscrire;  
INSERT INTO _s_inscrire SELECT ine,code_nip FROM _etudiant;

wbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_programme.csv
         -type=text
         -table=_programme
         -keycolumns=id_module,annee_univ,num_semestre
         -mode=insert,update
         -delimiter=';'
         -filecolumns=annee_univ,num_semestre,id_module,coefficient;
         
CREATE TABLE _resultat_tmp(
    moyenne varchar(5),
    id_module varchar(7),
    code_nip varchar(32),
    num_semestre varchar(5),
    annee_univ char(9),
    CONSTRAINT _resultat_tmp_pk PRIMARY KEY (id_module, code_nip, num_semestre, annee_univ)
);

DELETE FROM _resultat_tmp;
      
WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=M1101
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=M1102
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=M1103
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=M1104
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=M1105
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=M1106
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=M1201
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=M1202
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=M1203
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=M1204
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=M1205
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=M1206
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=M1207
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M2101
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M2102
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M2103
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M2104
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M2105
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M2106
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M2107
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M2201
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M2202
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M2203
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M2204
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M2205
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M2206
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M2207
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

-- S3 --

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M3101
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M3102
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M3103
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M3104
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M3105
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M3106C
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M3201
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M3202C
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M3203
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M3204
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M3205
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M3206
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M3301
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M3302
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M3303
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;


-- S4 --

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M4101C
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M4102C
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M4103C
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M4104C
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M4105C
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M41OS1
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M41OS2
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M41OS3
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M4106
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M4201C
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M4202C
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M4203
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M4204
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=M4301
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

DELETE FROM _resultat;
INSERT INTO _resultat SELECT CAST(replace(moyenne,',','.') as double precision), id_module, code_nip, num_semestre, annee_univ from _resultat_tmp where moyenne != '~' AND moyenne != '-c-' AND moyenne != 'NI';
DROP TABLE _resultat_tmp CASCADE;
