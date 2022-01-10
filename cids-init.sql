INSERT INTO cs_icon ( name, file_name ) VALUES ('Georeferenz', 'georeferenz.gif');
INSERT INTO cs_icon (name, file_name) VALUES ('Erde', 'erde.gif');

INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'cids_GEOMETRY', NULL, FALSE, NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'INTEGER', NULL, FALSE, NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'INT2', NULL, FALSE, NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'INT4', NULL, FALSE, NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'INT8', NULL, FALSE, NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'NUMERIC', NULL, FALSE, NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'CHAR', NULL, FALSE, NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'VARCHAR', NULL, FALSE, NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'TEXT', NULL, FALSE, NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'BOOL', NULL, FALSE, NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'FLOAT4', NULL, FALSE, NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'FLOAT8', NULL, FALSE, NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'DATE', NULL, FALSE, NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'TIMESTAMP', NULL, FALSE, NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'TIMESTAMPTZ', NULL, FALSE, NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'BPCHAR', NULL, FALSE, NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'Extension Type', NULL, FALSE, NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'URL_BASE', (SELECT id FROM cs_class WHERE name = 'URL_BASE'), TRUE, NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'URL', (SELECT id FROM cs_class WHERE name = 'URL'), TRUE, NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'GEOM', (SELECT id FROM cs_class WHERE name = 'GEOM'), TRUE, NULL, NULL, NULL);

INSERT INTO cs_class ( name, descr, class_icon_id, object_icon_id, table_name, primary_key_field, indexed, tostring, editor) VALUES ('GEOM','Cids Geodatentyp',(SELECT id FROM cs_icon WHERE name = 'Georeferenz'),(SELECT id FROM cs_icon WHERE name = 'Georeferenz'),'GEOM','ID',TRUE,NULL,NULL);
INSERT INTO cs_class ( name, descr, class_icon_id, object_icon_id, table_name, primary_key_field, indexed, tostring, editor) VALUES( 'URL' , NULL, (SELECT id FROM cs_icon WHERE name ='Erde'), (SELECT id FROM cs_icon WHERE name ='Erde'), 'URL', 'ID',false, NULL,NULL);
INSERT INTO cs_class ( name, descr, class_icon_id, object_icon_id, table_name, primary_key_field, indexed, tostring, editor) VALUES( 'URL_BASE', NULL , (SELECT id FROM cs_icon WHERE name ='Erde'), (SELECT id FROM cs_icon WHERE name ='Erde'), 'URL_BASE', 'ID',false, NULL,NULL);

INSERT INTO cs_attr ( class_id, type_id, name, field_name, foreign_key,pos,optional) VALUES ( (SELECT id FROM cs_class WHERE name = 'GEOM'), (SELECT id FROM cs_type WHERE name = 'INTEGER'), 'ID', 'ID', FALSE,   0,FALSE);
INSERT INTO cs_attr ( class_id, type_id, name,  field_name,editor, pos,optional)VALUES (  (SELECT id FROM cs_class WHERE name = 'GEOM'), (SELECT id FROM cs_type WHERE name = 'cids_GEOMETRY') , 'GEO_STRING', 'GEO_FIELD', (SELECT id FROM cs_java_class WHERE qualifier ='Sirius.navigator.ui.attributes.editor.metaobject.SimpleFromStringMetaAttributeEditor'),  1,TRUE);
-- url_base attribute
INSERT INTO cs_attr ( class_id, type_id, name, field_name, foreign_key,pos,optional) VALUES ( (SELECT id FROM cs_class WHERE name = 'URL_BASE'), (SELECT id FROM cs_type WHERE name = 'INTEGER'), 'ID', 'ID', FALSE, 0,FALSE);
INSERT INTO cs_attr ( class_id, type_id, name, field_name, foreign_key,pos,optional) VALUES ( (SELECT id FROM cs_class WHERE name = 'URL_BASE'), (SELECT id FROM cs_type WHERE name = 'TEXT'), 'PROT_PREFIX', 'PROT_PREFIX', FALSE, 1,FALSE);
INSERT INTO cs_attr ( class_id, type_id, name, field_name, foreign_key,pos,optional) VALUES ( (SELECT id FROM cs_class WHERE name = 'URL_BASE'), (SELECT id FROM cs_type WHERE name = 'TEXT'), 'PATH', 'PATH', FALSE, 3,FALSE);
INSERT INTO cs_attr ( class_id, type_id, name, field_name, foreign_key,pos,optional) VALUES ( (SELECT id FROM cs_class WHERE name = 'URL_BASE'), (SELECT id FROM cs_type WHERE name = 'TEXT'), 'SERVER', 'SERVER', FALSE, 2,FALSE);
-- url attribute
INSERT INTO cs_attr ( class_id, type_id, name, field_name, foreign_key,pos,optional) VALUES ( (SELECT id FROM cs_class WHERE name = 'URL'), (SELECT id FROM cs_type WHERE name = 'INTEGER'), 'ID', 'ID', FALSE, 0,FALSE);
INSERT INTO cs_attr ( class_id, type_id, name, field_name, foreign_key,pos,optional) VALUES ( (SELECT id FROM cs_class WHERE name = 'URL'), (SELECT id FROM cs_type WHERE name = 'TEXT'), 'OBJECT_NAME', 'OBJECT_NAME', FALSE, 2, FALSE);
INSERT INTO cs_attr ( class_id, type_id, name, field_name, foreign_key, foreign_key_references_to, pos, optional) VALUES ( (SELECT id FROM cs_class WHERE name = 'URL'), (SELECT id FROM cs_type WHERE name LIKE 'URL_BASE'), 'URL_BASE_ID', 'URL_BASE_ID', TRUE, (SELECT id FROM cs_class WHERE name LIKE 'URL_BASE'), 1,FALSE);

-- default config attr types

INSERT INTO cs_config_attr_type (type, descr) VALUES ('C', 'regular configuration attribute, a simple string value');
INSERT INTO cs_config_attr_type (type, descr) VALUES ('A', 'action tag configuration attribute, value of no relevance');
INSERT INTO cs_config_attr_type (type, descr) VALUES ('X', 'XML configuration attribute, XML content wrapped by some root element');

-- rechte
INSERT INTO public.cs_policy (id, name) VALUES (0, 'STANDARD');
INSERT INTO public.cs_policy (id, name) VALUES (1, 'WIKI');
INSERT INTO public.cs_policy (id, name) VALUES (2, 'SECURE');

INSERT INTO public.cs_policy_rule (id, policy, permission, default_value) VALUES (1, 0, 0, '1');
INSERT INTO public.cs_policy_rule (id, policy, permission, default_value) VALUES (2, 0, 1, '0');
INSERT INTO public.cs_policy_rule (id, policy, permission, default_value) VALUES (3, 1, 0, '1');
INSERT INTO public.cs_policy_rule (id, policy, permission, default_value) VALUES (4, 1, 1, '1');
INSERT INTO public.cs_policy_rule (id, policy, permission, default_value) VALUES (5, 2, 0, '0');
INSERT INTO public.cs_policy_rule (id, policy, permission, default_value) VALUES (6, 2, 1, '0');

INSERT INTO public.cs_permission (id, KEY, description) VALUES (0, 'read', 'Leserecht');
INSERT INTO public.cs_permission (id, KEY, description) VALUES (1, 'write', 'Schreibrecht');

-- Inserts zum Anlegen eines Standardbenutzers admin und einer neuen Benutzergruppe Administratoren
INSERT INTO cs_domain (name) VALUES('LOCAL');
INSERT INTO cs_ug (name, domain, prio) VALUES ('Administratoren', (SELECT id FROM cs_domain WHERE name = 'LOCAL'), 0);
INSERT INTO cs_ug (name, domain, prio) VALUES ('Gäste', (SELECT id FROM cs_domain WHERE name = 'LOCAL'), 1);
INSERT INTO cs_usr(login_name,password,last_pwd_change,administrator) VALUES('admin','cismet',(SELECT CURRENT_TIMESTAMP),True);
INSERT INTO cs_usr(login_name,password,last_pwd_change,administrator) VALUES('gast','cismet',(SELECT CURRENT_TIMESTAMP),false);
INSERT INTO cs_ug_membership (ug_id,usr_id) VALUES ((SELECT id FROM cs_ug WHERE name ='Administratoren'),(SELECT id FROM cs_usr WHERE login_name ='admin'));
INSERT INTO cs_ug_membership (ug_id,usr_id) VALUES ((SELECT id FROM cs_ug WHERE name ='Gäste'),(SELECT id FROM cs_usr WHERE login_name ='gast'));

--- Umstellung auf Passwort-Hash (einmalig)
UPDATE cs_usr SET salt = salt(16);
UPDATE cs_usr SET pw_hash = md5(salt || password);
UPDATE cs_usr SET password = '*****';