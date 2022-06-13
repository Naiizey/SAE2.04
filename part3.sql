CREATE OR REPLACE VIEW vRes AS SELECT _resultat.code_nip ,moyenne, id_module, annee_univ, cat_socio_parent from _resultat natural JOIN _etudiant where id_module LIKE 'M1%';

CREATE OR REPLACE VIEW vEnd AS SELECT code_nip, count(moyenne), avg(moyenne)::numeric(5,2) as "moyenne_des_moyennes", id_module, cat_socio_parent from vRes group by cat_socio_parent, id_module, code_nip order by id_module, "moyenne_des_moyennes" desc;

DROP VIEW vres;

DROP VIEW vend;

create extension tablefunc;

CREATE OR REPLACE VIEW vtest AS
SELECT * FROM crosstab(
'
SELECT code_nip, id_module, moyenne_des_moyennes from vend order by 1
',
$$
VALUES ('M1101'), ('M1102'), ('M1103'), ('M1104'), ('M1105'), 
('M1106'), ('M1201'), ('M1202'), ('M1203'), ('M1204'), 
('M1205'), ('M1206'), ('M1207')
$$)
AS test(code_nip varchar(11), 
M1101 numeric(5,2), M1102 numeric(5,2), M1103 numeric(5,2), M1104 numeric(5,2), M1105 numeric(5,2), 
M1106 numeric(5,2), M1201 numeric(5,2), M1202 numeric(5,2), M1203 numeric(5,2), M1204 numeric(5,2), 
M1205 numeric(5,2), M1206 numeric(5,2), M1207 numeric(5,2));

CREATE OR REPLACE VIEW vSoonEnd AS SELECT vtest.code_nip, m1101, m1102, m1103, m1104, m1105, m1106, m1201, m1202, m1203, m1204, m1205, m1206, m1207, cat_socio_parent FROM vtest natural join vend;

CREATE OR REPLACE VIEW vendbis AS SELECT count(m1101) ,m1101, m1102, m1103, m1104, m1105, m1106, m1201, m1202, m1203, m1204, m1205, m1206, m1207, cat_socio_parent FROM vSoonEnd group by m1101, m1102, m1103, m1104, m1105, m1106, m1201, m1202, m1203, m1204, m1205, m1206, m1207, cat_socio_parent;

drop view vtest;

drop view vsoonend;

drop view vendbis;

update vendbis set m1101 = 0 where m1101 is null;