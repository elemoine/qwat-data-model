/*
	qWat - QGIS Water Module
	
	SQL file :: status table
*/

/* CREATE */
CREATE TABLE qwat_vl.status () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.status ADD CONSTRAINT vl_status_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.status IS 'Status table, with SIRE id.';

/* COLUMNS */
ALTER TABLE qwat_vl.status ADD COLUMN active     boolean default true; /* determines if the actual status is active or not */
ALTER TABLE qwat_vl.status ADD COLUMN functional boolean default true; /* determines if the actual status is functional or not */
ALTER TABLE qwat_vl.status ADD COLUMN code_sire  smallint default null;


/* VALUES */
INSERT INTO qwat_vl.status (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.status (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.status (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.status (id, active, functional, code_sire, value_en, value_fr, value_ro, description_en, description_fr, description_ro) VALUES (1307, true,  true,  1,    'fictional',      'fictif',       'Fictiv',       '', 'L''objet n''existe pas mais est nécessaire à l''intégrité topologique.', 'Obiectul este fictiv dar este necesar pentru integritatea topologică.');    /*  */
INSERT INTO qwat_vl.status (id, active, functional, code_sire, value_en, value_fr, value_ro, description_en, description_fr, description_ro) VALUES (1303, false, false, NULL, 'shut down',      'désaffecté',   'Dezafectat',   '', 'La mise hors service est quasi-définitive et une remise en service nécessiterai des opérations spéciales. Par exemple, une source non-captée est considérée comme désaffectée. Ou encore, une conduite n''étant plus raccordée maism étant toutefois dans état propre à son utilisation.', 'Punerea în stare dezafectată este semi definitivă iar repunerea în stare funcţională ar necesita operaţiuni speciale. Spre exemplu, o sursă necaptată este considerată ca dezafectată. Sau mai mult, o conductă care nu este racordată dar a cărei stare e utilizabilă.');    /*  */
INSERT INTO qwat_vl.status (id, active, functional, code_sire, value_en, value_fr, value_ro, description_en, description_fr, description_ro) VALUES (1305, false, false, NULL, 'destroyed',      'détruit',      'Distrus',      '', 'L''objet a été partiellement ou complètement détruit.', 'Obiectul este distrus complet sau parţial');    /*  */
INSERT INTO qwat_vl.status (id, active, functional, code_sire, value_en, value_fr, value_ro, description_en, description_fr, description_ro) VALUES (1302, false, true,  NULL, 'out of service', 'hors service', 'Nefuncţional', '', 'Ne contribue actuellement pas au réseau, mais peut être remis en service sans opération spéciale. La mise hors service est considérée comme temporaire. Par exemple, une source mise hors service pour des problèmes de qualité.', 'Nu contribuie efectiv la reţea, dar poate fi repusă în stare funcţională fară operaţiuni speciale. Starea nefuncţională este considerată ca una temporară. De exemplu, putem avea o sursă care a fost pusă în stare nefuncţională datorită unor probleme de calitate.');    /*  */
INSERT INTO qwat_vl.status (id, active, functional, code_sire, value_en, value_fr, value_ro, description_en, description_fr, description_ro) VALUES (1301, true,  true,  1,    'in use',         'en service',   'Funcţional',   '', 'Contribue actuellement au réseau.', 'Contribuie efectiv la reţea.');    /*  */
INSERT INTO qwat_vl.status (id, active, functional, code_sire, value_en, value_fr, value_ro, description_en, description_fr, description_ro) VALUES (1304, false, false, NULL, 'disused',        'abandonné',    'Abandonat',    '', 'L''objet est inutilisable et sa mise hors service est strictement définitive. Par exemple, une conduite non raccordée et impropre au transport d''eau, mais pouvant éventuellement servir à passer des câbles. Ou encore une station de pompage sans pompe en état de fonctionner.', 'Obiectul este abandonat iar scoaterea din funcţiune este strict definitivă. Spre exemplu, putem avea o conductă neracordată și improprie transportului de apă dar care poate fi eventual folosită ca mediu protector pentru alte conducte sau pt. cabluri. Alt exemplu este o statie de pompare fară nici o pompă  în stare funcţională.');    /*  */
INSERT INTO qwat_vl.status (id, active, functional, code_sire, value_en, value_fr, value_ro, description_en, description_fr, description_ro) VALUES (1306, false, false, NULL, 'project',        'projet',       'Proiect',      '', 'L''objet est un projet validé en attente ou en cours de réalisation.', 'Obiectul face parte dintr-un proiect care se va face sau în curs de realizare. ');    /*  */




