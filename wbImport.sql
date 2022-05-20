WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_candidatures.csv
        -type=text
        -table=_individu
        -delimiter=';'
        -filecolumns=$wb_skip$,$wb_skip$,$wb_skip$,nom,prenom,sexe,date_naissance,nationalite,code_postal,ville,$wb_skip$,$wb_skip$,$wb_skip$,ine
        -dateformat="yyyy-MM-dd";
        
wbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_candidatures.csv
         -type=text
         -table=_candidat
         -delimiter=';'
         -filecolumns=$wb_skip$,$wb_skip$,classement,$wb_skip$,$wb_skip$,$wb_skip$,$wb_skip$,$wb_skip$,$wb_skip$,$wb_skip$,$wb_skip$,boursier_lycee,profil_candidat,$wb_skip$,$wb_skip$,etablissement,ville_etablissement,dept_etablissement,$wb_skip$,niveau_etude,type_formation_prec,serie_prec,dominante_prec,specialite_prec,lv1,lv2
         -dateformat="yyyy-MM-dd";

wbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/v_inscriptions.csv
         -type=text
         -table=_individu
         -delimiter=';'
         -filecolumns=%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,ine,nom,prenom,date_naissance,sexe,nationalite,code_postal,ville
         -dateformat="yyyy-MM-dd";

WbImport -file=/media/flguillou/SSD de Flo/Cours/SAE 2.04/data/ppn.csv
         -header=true
         -delimiter=';'
         -table=_module
         -filecolumns=id_module,ue,libelle_module;


WbImport -file=./data/ppn.csv
         -header=true
         -delimiter=';'
         -table=_programme
         -schema=partie2
         -filecolumns=id_module,%wb_skip%,%wb_skip%,coefficient,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,id_semestre;
         
         
WbImport -file=./data/v_resu_s1.csv
         -header=true
         -delimiter=';'
         -table=_resultat
         -schema=partie1
         -filecolumns=%wb_skip%,num_semestre,code_nip,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,%wb_skip%,moyenne;
