set schema 'partie2';

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_candidatures.csv
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
         
WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=m1101
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=m1102
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=m1103
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=m1104
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=m1105
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=m1106
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=m1201
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=m1202
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=m1203
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=m1204
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=m1205
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=m1206
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -mode=insert,update
         -constantValues=id_module=m1207
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m2101
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m2102
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m2103
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m2104
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m2105
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m2106
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m2107
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m2201
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m2202
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m2203
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m2204
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m2205
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m2206
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s2.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m2207
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

-- S3 --

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m3101
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m3102
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m3103
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m3104
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m3105
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m3106c
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m3201
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m3202c
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m3203
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m3204
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m3205
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m3206
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m3301
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m3302
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s3.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m3303
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;


-- S4 --

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m4101c
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m4102c
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m4103c
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m4104c
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m4105c
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m41os1
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m41os2
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m41os3
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m4106
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m4201c
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m4202c
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m4203
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m4204
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_resu_s4.csv
         -header=true
         -delimiter=';'
         -table=_resultat_tmp
         -constantValues=id_module=m4301
         -mode=insert,update
         -filecolumns=annee_univ,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;
