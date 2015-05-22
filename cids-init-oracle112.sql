
--------------------------------------------------------------------------------
-- ================================ ENTITIES ================================ --
--------------------------------------------------------------------------------


CREATE TABLE cs_all_attr_mapping (
    id integer NOT NULL PRIMARY KEY,
    class_id integer NOT NULL,
    object_id integer NOT NULL,
    attr_class_id integer NOT NULL,
    attr_object_id integer NOT NULL
);

CREATE TABLE cs_attr_object (
    class_id integer NOT NULL,
    object_id integer NOT NULL,
    attr_class_id integer NOT NULL,
    attr_object_id integer NOT NULL
);

CREATE TABLE cs_attr_object_derived
(
  class_id integer NOT NULL,
  object_id integer NOT NULL,
  attr_class_id integer NOT NULL,
  attr_object_id integer NOT NULL
);

CREATE TABLE cs_attr
  (
     id                        INTEGER NOT NULL PRIMARY KEY,
     class_id                  INTEGER NOT NULL,
     type_id                   INTEGER NOT NULL,
     name                      VARCHAR(100) NOT NULL,
     field_name                VARCHAR(50) NOT NULL,
     foreign_key               char(1) DEFAULT '0' NOT NULL CHECK (foreign_key IN ('0', '1')),
     substitute                char(1) DEFAULT '0' NOT NULL CHECK (substitute IN ('0', '1')),
     foreign_key_references_to INTEGER,
     descr                     CLOB,
     visible                   char(1) DEFAULT '1' NOT NULL CHECK (visible IN ('0', '1')),
     indexed                   char(1) DEFAULT '0' NOT NULL CHECK (indexed IN ('0', '1')),
     isarray                   char(1) DEFAULT '0' NOT NULL CHECK (isarray IN ('0', '1')),
     array_key                 VARCHAR(30),
     editor                    INTEGER,
     tostring                  INTEGER,
     complex_editor            INTEGER,
     optional                  char(1) DEFAULT '1' NOT NULL CHECK (optional IN ('0', '1')),
     default_value             VARCHAR(100),
     from_string               INTEGER,
     pos                       INTEGER DEFAULT 0,
     PRECISION                 INTEGER,
     scale                     INTEGER,
     extension_attr            char(1) DEFAULT '0' NOT NULL CHECK (extension_attr IN ('0', '1'))
  );  

CREATE TABLE cs_attr_string (
    class_id integer NOT NULL,
    attr_id integer NOT NULL,
    object_id integer NOT NULL,
    string_val CLOB NOT NULL
);

CREATE TABLE cs_cat_link (
    id integer NOT NULL PRIMARY KEY,
    id_from integer NOT NULL,
    id_to integer NOT NULL,
    org clob,
    domain_to integer
);

CREATE TABLE cs_cat_node (
    id integer NOT NULL PRIMARY KEY,
    name varchar(100) NOT NULL,
    descr integer DEFAULT 1,
    class_id integer,
    object_id integer,
    node_type char(1) DEFAULT '0' NOT NULL CHECK (node_type IN ('N', 'O', 'C')),
    is_root char(1) DEFAULT '0' NOT NULL CHECK (is_root IN ('0', '1')),
    org clob,
    dynamic_children clob,
    sql_sort char(1),
    policy integer,
    derive_permissions_from_class char(1) DEFAULT '1' CHECK (derive_permissions_from_class IN ('0', '1')),
    iconfactory integer,
    icon varchar(512),
    artifical_id varchar(200)
);

CREATE TABLE cs_class (
    id integer NOT NULL PRIMARY KEY,
    name varchar(100) NOT NULL,
    descr clob,
    class_icon_id integer NOT NULL,
    object_icon_id integer NOT NULL,
    table_name varchar(100) NOT NULL,
    primary_key_field varchar(100) DEFAULT 'ID' NOT NULL,
    indexed char(1) DEFAULT '0' NOT NULL CHECK (indexed IN ('0', '1')),
    tostring integer,
    editor integer,
    renderer integer,
    array_link char(1) DEFAULT '0' NOT NULL CHECK (array_link IN ('0', '1')),
    policy integer,
    attribute_policy integer
);

CREATE TABLE cs_class_attr (
    id integer NOT NULL PRIMARY KEY,
    class_id integer NOT NULL,
    type_id integer NOT NULL,
    attr_key varchar(100) NOT NULL,
    attr_value clob
);

CREATE TABLE cs_domain (
    id integer NOT NULL PRIMARY KEY,
    name varchar(30)
);

CREATE TABLE cs_icon (
    id integer NOT NULL PRIMARY KEY,
    name varchar(32) NOT NULL,
    file_name varchar(100) DEFAULT 'default_icon.gif' NOT NULL
);

CREATE TABLE cs_java_class (
    id integer NOT NULL PRIMARY KEY,
    qualifier varchar(100),
    type varchar(100) DEFAULT 'unknown' NOT NULL,
    notice varchar(500)
);

CREATE TABLE cs_locks (
    id integer NOT NULL PRIMARY KEY,
    class_id integer,
    object_id integer,
    user_string varchar(256),
    additional_info varchar(256)
);

CREATE TABLE cs_method (
    id integer NOT NULL PRIMARY KEY,
    descr clob,
    mult char(1) DEFAULT '0' NOT NULL CHECK (mult IN ('0', '1')),
    class_mult char(1) DEFAULT '0' NOT NULL CHECK (class_mult IN ('0', '1')),
    plugin_id varchar(30) DEFAULT '' NOT NULL,
    method_id varchar(100) DEFAULT '' NOT NULL
);

CREATE TABLE cs_method_class_assoc (
    id integer NOT NULL PRIMARY KEY,
    class_id integer NOT NULL,
    method_id integer NOT NULL
);

CREATE TABLE cs_permission (
    id integer NOT NULL PRIMARY KEY,
    KEY varchar(10),
    description varchar(100)
);

CREATE TABLE cs_policy (
    id integer NOT NULL PRIMARY KEY,
    name varchar(20) NOT NULL
);

CREATE TABLE cs_policy_rule (
    id integer NOT NULL PRIMARY KEY,
    policy integer NOT NULL,
    permission integer NOT NULL,
    default_value char(1) NOT NULL CHECK (default_value IN ('0', '1')),
    UNIQUE (policy, permission)
);

CREATE TABLE cs_query (
    id integer NOT NULL PRIMARY KEY,
    name varchar(256) NOT NULL UNIQUE,
    descr clob,
    statement clob,
    result integer,
    is_update char(1) DEFAULT '0' NOT NULL CHECK (is_update IN ('0', '1')),
    is_union char(1) DEFAULT '0' NOT NULL CHECK (is_union IN ('0', '1')),
    is_root char(1) DEFAULT '0' NOT NULL CHECK (is_root IN ('0', '1')),
    is_batch char(1) DEFAULT '0' NOT NULL CHECK (is_batch IN ('0', '1')),
    conjunction char(1) DEFAULT '0' NOT NULL CHECK (conjunction IN ('0', '1')),
    is_search char(1) DEFAULT '0' NOT NULL CHECK (is_search IN ('0', '1'))
);

CREATE TABLE cs_query_class_assoc (
    class_id integer NOT NULL,
    query_id integer NOT NULL,
    id integer NOT NULL PRIMARY KEY
);

CREATE TABLE cs_query_link (
    id integer NOT NULL PRIMARY KEY,
    id_from integer NOT NULL,
    id_to integer NOT NULL,
    domain_to integer
);

CREATE TABLE cs_query_parameter (
    id integer NOT NULL PRIMARY KEY,
    query_id integer NOT NULL,
    param_key varchar(100) NOT NULL,
    descr clob,
    is_query_result char(1) DEFAULT '0' NOT NULL CHECK (is_query_result IN ('0', '1')),
    type_id integer,
    query_position integer DEFAULT 0
);
    
CREATE TABLE cs_query_store (
    id integer NOT NULL PRIMARY KEY,
    user_id integer NOT NULL,
    name varchar(100) NOT NULL,
    file_name varchar(100) NOT NULL
);

CREATE TABLE cs_query_store_ug_assoc (
    ug_id integer NOT NULL,
    query_store_id integer NOT NULL,
    permission integer,
    domain integer,
    id integer NOT NULL PRIMARY KEY
);

CREATE TABLE cs_query_ug_assoc (
    ug_id integer NOT NULL,
    query_id integer NOT NULL,
    permission integer,
    domain integer,
    id integer NOT NULL PRIMARY KEY
);

CREATE TABLE cs_type (
    id integer NOT NULL PRIMARY KEY,
    name varchar(100) NOT NULL UNIQUE,
    class_id integer,
    complex_type char(1) DEFAULT '0' NOT NULL CHECK (complex_type IN ('0', '1')),
    descr clob,
    editor integer,
    renderer integer
);

CREATE TABLE cs_ug (
    id integer NOT NULL PRIMARY KEY,
    name varchar(32) NOT NULL,
    descr clob,
    domain integer NOT NULL,
    prio integer NOT NULL UNIQUE
);

CREATE TABLE cs_ug_attr_perm (
    id integer NOT NULL PRIMARY KEY,
    ug_id integer NOT NULL,
    attr_id integer NOT NULL,
    permission integer,
    domain integer
);

CREATE TABLE cs_ug_cat_node_perm (
    id integer NOT NULL PRIMARY KEY,
    ug_id integer NOT NULL,
    domain integer,
    cat_node_id integer NOT NULL,
    permission integer
);

CREATE TABLE cs_ug_class_perm (
    id integer NOT NULL PRIMARY KEY,
    ug_id integer NOT NULL,
    class_id integer NOT NULL,
    permission integer,
    domain integer
);

CREATE TABLE cs_ug_membership (
    ug_id integer NOT NULL,
    usr_id integer NOT NULL,
    ug_domain integer,
    id integer NOT NULL PRIMARY KEY
);

CREATE TABLE cs_ug_method_perm (
    id integer NOT NULL PRIMARY KEY,
    ug_id integer NOT NULL,
    domain integer,
    method_id integer NOT NULL,
    permission integer
);
    
CREATE TABLE cs_usr (
    id integer NOT NULL PRIMARY KEY,
    login_name varchar(32) NOT NULL UNIQUE,
    password varchar(16),
    last_pwd_change timestamp NOT NULL,
    administrator char(1) DEFAULT '0' NOT NULL CHECK (administrator in ('0', '1'))
);

CREATE TABLE geom
(
    id integer NOT NULL PRIMARY KEY,
    geo_field SDO_GEOMETRY
);

--- necessary entry for geometry column
INSERT INTO user_sdo_geom_metadata
    (TABLE_NAME,
     COLUMN_NAME,
     DIMINFO,
     SRID)
  VALUES (
  'geom',
  'geo_field',
  SDO_DIM_ARRAY(   -- lat lon boundaries, minimal tolerance (approx 5 cm)
    SDO_DIM_ELEMENT('X', -180, 180, 0.05),
    SDO_DIM_ELEMENT('Y', -90, 90, 0.05)
     ),
  4326   -- SRID
);

CREATE TABLE url (
    id INTEGER NOT NULL PRIMARY KEY,
    object_name clob NOT NULL,
    url_base_id INTEGER NOT NULL
);

CREATE TABLE url_base
(
    id INTEGER NOT NULL PRIMARY KEY,
    prot_prefix VARCHAR(32) NOT NULL,
    path clob NOT NULL,
    server clob NOT NULL
);


------------- depend on other tables


CREATE TABLE cs_history (
    class_id    INTEGER     NOT NULL,
    object_id   INTEGER     NOT NULL,
 -- because of anonymous usage null must be allowed
    usr_id      INTEGER             ,
 -- because of anonymous usage null must be allowed
    ug_id       INTEGER             ,
    valid_from  TIMESTAMP   NOT NULL,
    json_data   clob        NOT NULL,

    FOREIGN KEY (class_id)  REFERENCES cs_class,
    FOREIGN KEY (usr_id)    REFERENCES cs_usr,
    FOREIGN KEY (ug_id)     REFERENCES cs_ug,

    PRIMARY KEY (class_id, object_id, valid_from)
);

CREATE TABLE cs_stringrepcache (
  class_id integer NOT NULL,
  object_id integer NOT NULL,
  stringrep varchar(512),
  CONSTRAINT cid_oid PRIMARY KEY (class_id , object_id )
);

CREATE TABLE cs_config_attr_key (
    id INTEGER NOT NULL PRIMARY KEY,
    KEY VARCHAR(200) NOT NULL,
    group_name VARCHAR(256) NOT NULL 
);

CREATE TABLE cs_config_attr_value (
    id INTEGER NOT NULL PRIMARY KEY,
    value clob
);

CREATE TABLE cs_config_attr_type (
    id INTEGER NOT NULL PRIMARY KEY,
    type char(1) NOT NULL CHECK (type in ('C', 'A', 'X')),
    descr varchar(200)
);
    
CREATE TABLE cs_config_attr_jt (
    id      INTEGER       NOT NULL PRIMARY KEY,
    usr_id  INTEGER,
    ug_id   INTEGER,
    dom_id  INTEGER       NOT NULL,
    key_id  INTEGER       NOT NULL,
    val_id  INTEGER       NOT NULL,
    -- type is only for editing purposes, determines which editor is suited best
    type_id INTEGER,
    FOREIGN KEY (usr_id)  REFERENCES cs_usr,
    FOREIGN KEY (ug_id)   REFERENCES cs_ug,
    FOREIGN KEY (dom_id)  REFERENCES cs_domain,
    FOREIGN KEY (key_id)  REFERENCES cs_config_attr_key,
    FOREIGN KEY (val_id)  REFERENCES cs_config_attr_value,
    FOREIGN KEY (type_id) REFERENCES cs_config_attr_type,
    -- NULL != NULL in this case so don't fully rely on that
    UNIQUE ( usr_id, ug_id, dom_id, key_id)
);

CREATE TABLE cs_config_attr_exempt (
    id     INTEGER       NOT NULL PRIMARY KEY,
    usr_id INTEGER       NOT NULL,
    key_id INTEGER,
    ug_id  INTEGER       NOT NULL,
    FOREIGN KEY (usr_id)  REFERENCES cs_usr,
    FOREIGN KEY (key_id)  REFERENCES cs_config_attr_key,
    FOREIGN KEY (ug_id)   REFERENCES cs_ug,
    UNIQUE ( usr_id, key_id )
);



--------------------------------------------------------------------------------
-- =============================== SEQUENCES ================================ --
--------------------------------------------------------------------------------


CREATE SEQUENCE cs_all_attr_mapping_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_attr_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_cat_link_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_cat_node_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_class_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_class_attr_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_domain_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_icon_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_java_class_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_locks_seq
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_method_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_method_class_assoc_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_permission_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_policy_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_policy_rule_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_query_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_query_class_assoc_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_query_link_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_query_parameter_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_query_store_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_query_store_ug_assoc_seq
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_query_ug_assoc_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_type_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_ug_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_ug_attr_perm_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_ug_cat_node_perm_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_ug_class_perm_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_ug_membership_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_ug_method_perm_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_usr_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE geom_seq
    INCREMENT BY 1
    NOMAXVALUE
    MINVALUE 1;
    
CREATE SEQUENCE url_seq 
	MINVALUE 1 
	NOMAXVALUE;
	
CREATE SEQUENCE url_base_seq 
	MINVALUE 1 
	NOMAXVALUE;

CREATE SEQUENCE cs_config_attr_key_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_config_attr_value_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_config_attr_type_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;
    
CREATE SEQUENCE cs_config_attr_jt_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;

CREATE SEQUENCE cs_config_attr_exempt_sequence
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE;



--------------------------------------------------------------------------------
-- ================================ TRIGGERS ================================ --
--------------------------------------------------------------------------------


CREATE OR REPLACE TRIGGER cs_all_attr_mapping_id_trigger
  BEFORE INSERT
  ON cs_all_attr_mapping
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_all_attr_mapping_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_attr_id_trigger
  BEFORE INSERT
  ON cs_attr
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_attr_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_cat_link_id_trigger
  BEFORE INSERT
  ON cs_cat_link
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_cat_link_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_cat_node_id_trigger
  BEFORE INSERT
  ON cs_cat_node
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_cat_node_sequence.nextval INTO :new.id FROM DUAL;
END;
/
    
CREATE OR REPLACE TRIGGER cs_class_id_trigger
  BEFORE INSERT
  ON cs_class
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_class_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_class_attr_id_trigger
  BEFORE INSERT
  ON cs_class_attr
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_class_attr_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_domain_id_trigger
  BEFORE INSERT
  ON cs_domain
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_domain_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_icon_id_trigger
  BEFORE INSERT
  ON cs_icon
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_icon_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_java_class_id_trigger
  BEFORE INSERT
  ON cs_java_class
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_java_class_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_locks_id_trigger
  BEFORE INSERT
  ON cs_locks
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_locks_seq.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_method_id_trigger
  BEFORE INSERT
  ON cs_method
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_method_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_meth_class_assoc_id_trig
  BEFORE INSERT
  ON cs_method_class_assoc
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_method_class_assoc_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_permission_id_trigger
  BEFORE INSERT
  ON cs_permission
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_permission_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_policy_id_trigger
  BEFORE INSERT
  ON cs_policy
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_policy_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_policy_rule_id_trigger
  BEFORE INSERT
  ON cs_policy_rule
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_policy_rule_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_query_id_trigger
  BEFORE INSERT
  ON cs_query
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_query_sequence.nextval INTO :new.id FROM DUAL;
END;
/
    
CREATE OR REPLACE TRIGGER cs_query_class_assoc_id_trig
  BEFORE INSERT
  ON cs_query_class_assoc
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_query_class_assoc_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_query_link_id_trigger
  BEFORE INSERT
  ON cs_query_link
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_query_link_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_query_parameter_id_trigger
  BEFORE INSERT
  ON cs_query_parameter
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_query_parameter_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_query_store_id_trigger
  BEFORE INSERT
  ON cs_query_store
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_query_store_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_qu_sto_ug_assoc_id_trig
  BEFORE INSERT
  ON cs_query_store_ug_assoc
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_query_store_ug_assoc_seq.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_query_ug_assoc_id_trigger
  BEFORE INSERT
  ON cs_query_ug_assoc
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_query_ug_assoc_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_type_id_trigger
  BEFORE INSERT
  ON cs_type
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_type_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_ug_id_trigger
  BEFORE INSERT
  ON cs_ug
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_ug_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_ug_attr_perm_id_trigger
  BEFORE INSERT
  ON cs_ug_attr_perm
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_ug_attr_perm_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_ug_cat_node_perm_id_trigger
  BEFORE INSERT
  ON cs_ug_cat_node_perm
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_ug_cat_node_perm_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_ug_class_perm_id_trigger
  BEFORE INSERT
  ON cs_ug_class_perm
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_ug_class_perm_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_ug_membership_id_trigger
  BEFORE INSERT
  ON cs_ug_membership
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_ug_membership_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_ug_method_perm_id_trigger
  BEFORE INSERT
  ON cs_ug_method_perm
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_ug_method_perm_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_usr_id_trigger
  BEFORE INSERT
  ON cs_usr
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_usr_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER geom_id_trigger
  BEFORE INSERT
  ON geom
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT geom_seq.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER url_id_trigger
  BEFORE INSERT
  ON url
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT url_seq.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER url_base_id_trigger
  BEFORE INSERT
  ON url_base
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT url_base_seq.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_config_attr_key_id_trigger
  BEFORE INSERT
  ON cs_config_attr_key
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_config_attr_key_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_config_attr_value_id_trig
  BEFORE INSERT
  ON cs_config_attr_value
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_config_attr_value_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_config_attr_type_id_trig
  BEFORE INSERT
  ON cs_config_attr_type
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_config_attr_type_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_config_attr_jt_id_trigger
  BEFORE INSERT
  ON cs_config_attr_jt
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_config_attr_jt_sequence.nextval INTO :new.id FROM DUAL;
END;
/

CREATE OR REPLACE TRIGGER cs_config_attr_exempt_id_trig
  BEFORE INSERT
  ON cs_config_attr_exempt
  FOR EACH ROW
  WHEN (new.id is null)
BEGIN
  SELECT cs_config_attr_exempt_sequence.nextval INTO :new.id FROM DUAL;
END;
/



--------------------------------------------------------------------------------
-- ================================ INDEXES ================================= --
--------------------------------------------------------------------------------


CREATE INDEX cs_all_attr_mapping_index1 ON cs_all_attr_mapping (class_id);
CREATE INDEX cs_all_attr_mapping_index2 ON cs_all_attr_mapping (attr_class_id);
CREATE INDEX cs_all_attr_mapping_index3 ON cs_all_attr_mapping (attr_object_id);

CREATE INDEX attr_object_index ON cs_attr_object (class_id, object_id, attr_class_id, attr_object_id);

CREATE INDEX attr_object_der_idx_acid_aoid ON cs_attr_object_derived (attr_class_id, attr_object_id);
CREATE INDEX attr_object_der_idx_cid_oid   ON cs_attr_object_derived (class_id, object_id);
CREATE INDEX attr_object_derived_index     ON cs_attr_object_derived (class_id, object_id, attr_class_id, attr_object_id);

CREATE INDEX cs_attr_string_class_idx  ON cs_attr_string (class_id);
CREATE INDEX cs_attr_string_object_idx ON cs_attr_string (object_id);
CREATE INDEX i_cs_attr_string_aco_id   ON cs_attr_string (attr_id, class_id, object_id);

CREATE INDEX cl_idx     ON cs_cat_node (class_id);
CREATE INDEX ob_idx     ON cs_cat_node (object_id);
CREATE INDEX obj_cl_idx ON cs_cat_node (class_id, object_id);

CREATE INDEX geo_index ON geom ( geo_field ) INDEXTYPE IS MDSYS.SPATIAL_INDEX;



--------------------------------------------------------------------------------
-- =============================== INIT DATA ================================ --
--------------------------------------------------------------------------------


INSERT INTO cs_icon ( name, file_name ) VALUES ( 'Georeferenz', 'georeferenz.gif' );
INSERT INTO cs_icon ( name, file_name ) VALUES ( 'Erde', 'erde.gif' );

INSERT INTO cs_class ( name, descr, class_icon_id, object_icon_id, table_name, primary_key_field, indexed, tostring, editor) VALUES ('GEOM','Cids Geodatentyp',(SELECT id FROM cs_icon WHERE name = 'Georeferenz'),(SELECT id FROM cs_icon WHERE name = 'Georeferenz'),'GEOM','ID','1',NULL,NULL);
INSERT INTO cs_class ( name, descr, class_icon_id, object_icon_id, table_name, primary_key_field, indexed, tostring, editor) VALUES( 'URL' , NULL, (SELECT id FROM cs_icon WHERE name ='Erde'), (SELECT id FROM cs_icon WHERE name ='Erde'), 'URL', 'ID','0', NULL,NULL);
INSERT INTO cs_class ( name, descr, class_icon_id, object_icon_id, table_name, primary_key_field, indexed, tostring, editor) VALUES( 'URL_BASE', NULL , (SELECT id FROM cs_icon WHERE name ='Erde'), (SELECT id FROM cs_icon WHERE name ='Erde'), 'URL_BASE', 'ID','0', NULL,NULL);

INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'cids_GEOMETRY', NULL, '0', NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'INTEGER', NULL, '0', NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'INT2', NULL, '0', NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'INT4', NULL, '0', NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'INT8', NULL, '0', NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'NUMERIC', NULL, '0', NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'CHAR', NULL, '0', NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'VARCHAR', NULL, '0', NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'TEXT', NULL, '0', NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'BOOL', NULL, '0', NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'FLOAT4', NULL, '0', NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'FLOAT8', NULL, '0', NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'DATE', NULL, '0', NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'TIMESTAMP', NULL, '0', NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'BPCHAR', NULL, '0', NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'Extension Type', NULL, '0', NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'URL_BASE', (SELECT id FROM cs_class WHERE name = 'URL_BASE'), '1', NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'URL', (SELECT id FROM cs_class WHERE name = 'URL'), '1', NULL, NULL, NULL);
INSERT INTO cs_type ( name, class_id, complex_type, descr, editor, renderer) VALUES ( 'GEOM', (SELECT id FROM cs_class WHERE name = 'GEOM'), '1', NULL, NULL, NULL);

INSERT INTO cs_attr ( class_id, type_id, name, field_name, foreign_key,pos,optional) VALUES ( (SELECT id FROM cs_class WHERE name = 'GEOM'), (SELECT id FROM cs_type WHERE name = 'INTEGER'), 'ID', 'ID', '0',   0,'0');
INSERT INTO cs_attr ( class_id, type_id, name, field_name, editor, pos,optional)     VALUES (  (SELECT id FROM cs_class WHERE name = 'GEOM'), (SELECT id FROM cs_type WHERE name = 'cids_GEOMETRY') , 'GEO_STRING', 'GEO_FIELD', (SELECT id FROM cs_java_class WHERE qualifier ='Sirius.navigator.ui.attributes.editor.metaobject.SimpleFromStringMetaAttributeEditor'),  1,'1');
INSERT INTO cs_attr ( class_id, type_id, name, field_name, foreign_key,pos,optional) VALUES ( (SELECT id FROM cs_class WHERE name = 'URL_BASE'), (SELECT id FROM cs_type WHERE name = 'INTEGER'), 'ID', 'ID', '0',   0,'0');
INSERT INTO cs_attr ( class_id, type_id, name, field_name, foreign_key,pos,optional) VALUES ( (SELECT id FROM cs_class WHERE name = 'URL_BASE'), (SELECT id FROM cs_type WHERE name = 'VARCHAR'), 'PROT_PREFIX', 'PROT_PREFIX', '0',   1,'0');
INSERT INTO cs_attr ( class_id, type_id, name, field_name, foreign_key,pos,optional) VALUES ( (SELECT id FROM cs_class WHERE name = 'URL_BASE'), (SELECT id FROM cs_type WHERE name = 'TEXT'), 'PATH', 'PATH', '0',   3,'0');
INSERT INTO cs_attr ( class_id, type_id, name, field_name, foreign_key,pos,optional) VALUES ( (SELECT id FROM cs_class WHERE name = 'URL_BASE'), (SELECT id FROM cs_type WHERE name = 'TEXT'), 'SERVER', 'SERVER', '0',   2,'0');
INSERT INTO cs_attr ( class_id, type_id, name, field_name, foreign_key,pos,optional) VALUES ( (SELECT id FROM cs_class WHERE name = 'URL'), (SELECT id FROM cs_type WHERE name = 'INTEGER'), 'ID', 'ID', '0',   0,'0');
INSERT INTO cs_attr ( class_id, type_id, name, field_name, foreign_key,pos,optional) VALUES ( (SELECT id FROM cs_class WHERE name = 'URL'), (SELECT id FROM cs_type WHERE name = 'TEXT'), 'OBJECT_NAME', 'OBJECT_NAME', '0', 2, '0');
INSERT INTO cs_attr ( class_id, type_id, name, field_name, foreign_key, foreign_key_references_to, pos, optional) VALUES ( (SELECT id FROM cs_class WHERE name = 'URL'), (SELECT id FROM cs_type WHERE name LIKE 'URL_BASE'), 'URL_BASE_ID', 'URL_BASE_ID', '1', (SELECT id FROM cs_class WHERE name LIKE 'URL_BASE'), 1,'0');

-- default config attr types

INSERT INTO cs_config_attr_type (type, descr) VALUES ('C', 'regular configuration attribute, a simple string value');
INSERT INTO cs_config_attr_type (type, descr) VALUES ('A', 'action tag configuration attribute, value of no relevance');
INSERT INTO cs_config_attr_type (type, descr) VALUES ('X', 'XML configuration attribute, XML content wrapped by some root element');

-- rights

INSERT INTO cs_policy (id, name) VALUES (0, 'STANDARD');
INSERT INTO cs_policy (id, name) VALUES (1, 'WIKI');
INSERT INTO cs_policy (id, name) VALUES (2, 'SECURE');

INSERT INTO cs_policy_rule (id, policy, permission, default_value) VALUES (1, 0, 0, '1');
INSERT INTO cs_policy_rule (id, policy, permission, default_value) VALUES (2, 0, 1, '0');
INSERT INTO cs_policy_rule (id, policy, permission, default_value) VALUES (3, 1, 0, '1');
INSERT INTO cs_policy_rule (id, policy, permission, default_value) VALUES (4, 1, 1, '1');
INSERT INTO cs_policy_rule (id, policy, permission, default_value) VALUES (5, 2, 0, '0');
INSERT INTO cs_policy_rule (id, policy, permission, default_value) VALUES (6, 2, 1, '0');

INSERT INTO cs_permission (id, KEY, description) VALUES (0, 'read', 'Leserecht');
INSERT INTO cs_permission (id, KEY, description) VALUES (1, 'write', 'Schreibrecht');

INSERT INTO cs_domain (name) VALUES('LOCAL');

INSERT INTO cs_ug (name, domain, prio) VALUES ('Administratoren', (SELECT id FROM cs_domain WHERE name = 'LOCAL'), 0);
INSERT INTO cs_ug (name, domain, prio) VALUES ('G?ste', (SELECT id FROM cs_domain WHERE name = 'LOCAL'), 1);

INSERT INTO cs_usr(login_name,password,last_pwd_change,administrator) VALUES('admin','cismet',(SELECT CURRENT_TIMESTAMP FROM DUAL),'1');
INSERT INTO cs_usr(login_name,password,last_pwd_change,administrator) VALUES('gast','cismet',(SELECT CURRENT_TIMESTAMP FROM DUAL),'0');

INSERT INTO cs_ug_membership (ug_id,usr_id) VALUES ((SELECT id FROM cs_ug WHERE name ='Administratoren'),(SELECT id FROM cs_usr WHERE login_name ='admin'));
INSERT INTO cs_ug_membership (ug_id,usr_id) VALUES ((SELECT id FROM cs_ug WHERE name ='G?ste'),(SELECT id FROM cs_usr WHERE login_name ='gast'));



--------------------------------------------------------------------------------
-- ================================= VIEWS ================================== --
--------------------------------------------------------------------------------


--- to_char because distinct on clob is not possible, thus limited to 4000 chars
CREATE OR REPLACE VIEW textsearch
( class_id, object_id, name, string_val )
AS
  SELECT DISTINCT x.class_id,
                  x.object_id,
                  c.name,
                  To_char(x.string_val)
  FROM   (cs_attr_string x
          left join cs_cat_node c
                 ON (( ( x.class_id = c.class_id )
                       AND ( x.object_id = c.object_id ) )) )
  ORDER  BY x.class_id,
            x.object_id,
            c.name,
            Cast(x.string_val AS VARCHAR2(100));


CREATE OR REPLACE VIEW geosuche
( class_id, object_id, name, geo_field )
AS
  SELECT DISTINCT x.class_id,
                  x.object_id,
                  c.name,
                  x.geo_field
  FROM   ( (SELECT DISTINCT cs_attr_object.class_id,
                          cs_attr_object.object_id,
                          geom.geo_field
          FROM   geom,
                 cs_attr_object
          WHERE  ( ( cs_attr_object.attr_class_id = (SELECT id
                                                     FROM   cs_class
                                                     WHERE  table_name = 'GEOM')
                   )
                   AND ( cs_attr_object.attr_object_id = geom.id ) )
          ORDER  BY cs_attr_object.class_id,
                    cs_attr_object.object_id,
                    geom.geo_field) x
           left join cs_cat_node c
                  ON (( ( x.class_id = c.class_id )
                        AND ( x.object_id = c.object_id ) )) )
  ORDER  BY x.class_id,
            x.object_id,
            c.name,
            x.geo_field;  


CREATE OR REPLACE VIEW cs_class_hierarchy
AS
  SELECT father_child.father,
         father_child.child
  FROM   (SELECT a.foreign_key_references_to AS child,
                 a.class_id                  AS father,
                 c.primary_key_field         AS pk,
                 c.table_name,
                 a.field_name,
                 a.isarray
          FROM   cs_attr a,
                 cs_class c
          WHERE  a.foreign_key = '1'
                 AND a.class_id = c.id
                 AND a.indexed = '1') father_child;  
          
          

--------------------------------------------------------------------------------
-- =============================== FUNCTIONS ================================ --
--------------------------------------------------------------------------------


CREATE OR REPLACE FUNCTION execute(cmd IN varchar2)
  RETURN varchar2 AS
BEGIN
  EXECUTE IMMEDIATE cmd;
  RETURN 'Yes: ' || cmd || ' executed';
EXCEPTION
    WHEN OTHERS THEN
    RETURN 'No:  ' || cmd || ' failed';
END;
/

CREATE GLOBAL TEMPORARY TABLE cs_attr_object_temp (class_id INTEGER, object_id INTEGER, attr_class_id INTEGER, attr_object_id INTEGER) ON COMMIT DELETE ROWS;
CREATE GLOBAL TEMPORARY TABLE cs_attr_string_temp (class_id INTEGER, attr_id INTEGER, object_id INTEGER, string_val clob) ON COMMIT DELETE ROWS;
CREATE GLOBAL TEMPORARY TABLE cs_attr_object_derived_temp (class_id INTEGER, object_id INTEGER, attr_class_id INTEGER, attr_object_id INTEGER) ON COMMIT DELETE ROWS;
            
CREATE OR REPLACE PROCEDURE reindexpure_class(classid IN INTEGER)
  IS
    TYPE pk_cur_type IS REF CURSOR;
    TYPE id_cur_type IS REF CURSOR;
    pk_cur pk_cur_type;
    id_cur id_cur_type;
    attr cs_attr%ROWTYPE;
    pField varchar2(100);
    fName varchar2(200);
    attr_obj_id INTEGER;
    class cs_class%ROWTYPE;
    query varchar2(1000);
    secQuery varchar2(1000);
    attrClass cs_class%ROWTYPE;
    backreference varchar2(200);
BEGIN
  DELETE FROM cs_attr_object_temp;
  DELETE FROM cs_attr_string_temp;
  
	SELECT * INTO class FROM cs_class WHERE id = classId;

	FOR attr IN (SELECT * FROM cs_attr WHERE class_id = classId) LOOP	
		IF attr.indexed = '1' THEN
			IF attr.foreign_key_references_to < 0 THEN
				query := 'SELECT ' || class.primary_key_field || ' AS pField, cast(' ||  class.primary_key_field || ' as varchar2(200)) AS fName FROM ' || class.table_name;
			ELSE
				query := 'SELECT ' || class.primary_key_field || ' AS pField, cast(' ||  attr.field_name || ' as varchar2(200)) AS fName FROM ' || class.table_name;
			END IF;
      
      OPEN pk_cur FOR query;
      LOOP
        FETCH pk_cur INTO pField, fName;
        EXIT WHEN pk_cur%NOTFOUND;
        
				IF attr.foreign_key = '1' THEN
					SELECT cs_class.* INTO attrClass FROM cs_class, cs_type WHERE cs_type.class_id = cs_class.id AND cs_type.id = attr.type_id;
					IF attr.foreign_key_references_to < 0 THEN
						SELECT field_name INTO backreference FROM cs_attr WHERE class_id = abs(attr.foreign_key_references_to) AND foreign_key_references_to = attr.class_id AND rownum = 1;
            
						secQuery := 'SELECT id as id FROM ' || attrClass.table_name || ' WHERE ' || backreference  || ' =  ' || pField;
            
            OPEN id_cur FOR secQuery;
						LOOP
              FETCH id_cur INTO attr_obj_id;
              EXIT WHEN id_cur%NOTFOUND;
              
							INSERT INTO cs_attr_object_temp (class_id, object_id, attr_class_id, attr_object_id) VALUES (class.id, pField, attrClass.id, attr_obj_id);
						END LOOP;
            CLOSE id_cur;
					ELSIF attrClass.array_link = '1' THEN
						secQuery := 'SELECT id as id FROM ' || attrClass.table_name || ' WHERE ' || attr.array_key  || ' =  ' || pField;
            
            OPEN id_cur FOR secQuery;
						LOOP
              FETCH id_cur INTO attr_obj_id;
              EXIT WHEN id_cur%NOTFOUND;
              
							INSERT INTO cs_attr_object_temp (class_id, object_id, attr_class_id, attr_object_id) VALUES (class.id, pField, attrClass.id, attr_obj_id);
						END LOOP;
            CLOSE id_cur;
					ELSE
						secQuery := 'select ' || class.table_name || '.' || attr.field_name || ' as attr_obj_id from ' || class.table_name || ', ' || attrclass.table_name || ' WHERE ' || class.table_name || '.' || class.primary_key_field || ' = ' || pField || ' AND ' || class.table_name || '.' || attr.field_name || ' = ' || attrClass.table_name || '.' || attrClass.primary_key_field;
            
            OPEN id_cur FOR secQuery;
            FETCH id_cur INTO attr_obj_id;
            -- never more than one row
            IF id_cur%FOUND THEN
              -- one row
              insert into cs_attr_object_temp (class_id, object_id, attr_class_id, attr_object_id) VALUES (class.id, pField, attrClass.id, attr_obj_id);
            ELSE
              -- no rows at all
              INSERT INTO cs_attr_object_temp (class_id, object_id, attr_class_id, attr_object_id) VALUES (class.id, pField, attrclass.id, -1);
            END IF;
            CLOSE id_cur;
					END IF;
				ELSE 
					IF fName IS NOT NULL THEN
						INSERT INTO cs_attr_string_temp (class_id, attr_id, object_id, string_val) VALUES (classId, attr.id, pField, fName);
					END IF;
				END IF;
			END LOOP;
		END IF;
	END LOOP;

	DELETE FROM cs_attr_object WHERE class_id = class.id;
	DELETE FROM cs_attr_string WHERE class_id = class.id;
	INSERT INTO cs_attr_object ( class_id, object_id, attr_class_id, attr_object_id) (SELECT class_id, object_id, attr_class_id, attr_object_id FROM cs_attr_object_temp);
	INSERT INTO cs_attr_string ( class_id, attr_id, object_id, string_val) (SELECT class_id, attr_id, object_id, string_val FROM cs_attr_string_temp);
END;
/


CREATE OR REPLACE PROCEDURE reindexderivedobjects(classid IN integer) AS
BEGIN
  DELETE FROM CS_ATTR_OBJECT_DERIVED_TEMP;
  
	INSERT INTO   cs_attr_object_derived_temp WITH derived_index
	       (
		      xocid,
		      xoid ,
		      ocid ,
		      oid  ,
		      acid ,
		      aid  ,
		      depth
	       )
	       AS
	       ( SELECT class_id,
		       object_id,
		       class_id ,
		       object_id,
		       class_id ,
		       object_id,
		       0
	       FROM    cs_attr_object
	       WHERE   class_id=classid
	       
	       UNION ALL
	       
	       SELECT di.xocid          ,
		      di.xoid           ,
		      aam.class_id      ,
		      aam.object_id     ,
		      aam.attr_class_id ,
		      aam.attr_object_id,
		      di.depth+1
	       FROM   cs_attr_object aam,
		      derived_index di
	       WHERE  aam.class_id =di.acid
	       AND    aam.object_id=di.aid
	       )
	SELECT DISTINCT xocid,
			xoid ,
			acid ,
			aid
	FROM            derived_index
  -- limit recursion
  WHERE rownum <= 1000000000
	ORDER BY        1,2,3,4;
  
  
	DELETE FROM cs_attr_object_derived WHERE class_id = classid;
	INSERT INTO cs_attr_object_derived ( class_id, object_id, attr_class_id, attr_object_id) (SELECT class_id, object_id, attr_class_id, attr_object_id FROM cs_attr_object_derived_temp);
	
END;
/


CREATE OR REPLACE PROCEDURE cids_reindex_all
  IS
    CURSOR c1 IS SELECT id FROM cs_class;
    CURSOR c2 IS SELECT id FROM cs_class where indexed = '1';
BEGIN
	FOR r IN c1 LOOP
    reindexpure_class(r.id);
	END LOOP;

	FOR r IN c2 LOOP
		reindexderivedobjects(r.id);
	END LOOP;
END;
/


CREATE OR REPLACE PROCEDURE reindex_single(class_id IN INTEGER)
  IS
    CURSOR c1 IS WITH derived_child(father,child,depth) AS
                    ( SELECT father,
                            father ,
                            0
                    FROM    cs_class_hierarchy
                    WHERE   father IN (class_id)
                    
                    UNION ALL
                    
                    SELECT ch.father,
                           abs(ch.child) ,
                           dc.depth+1
                    FROM   derived_child dc,
                           cs_class_hierarchy ch
                    WHERE  ch.father=dc.child
                    )
             SELECT DISTINCT child
             FROM            derived_child 
             WHERE rownum <= 100;
    CURSOR c2 IS WITH derived_child(father,child,depth) AS
                    ( SELECT father,
                            father ,
                            0
                    FROM    cs_class_hierarchy
                    WHERE   father IN (class_id)
                    
                    UNION ALL
                    
                    SELECT ch.father,
                           abs(ch.child) ,
                           dc.depth+1
                    FROM   derived_child dc,
                           cs_class_hierarchy ch
                    WHERE  ch.father=dc.child
                    )
             SELECT DISTINCT child
             FROM            derived_child dc JOIN cs_class cc ON (cc.id = dc.child) WHERE cc.indexed = '1' AND rownum <= 100;
begin
	FOR r IN c1 LOOP
		reindexpure_class(abs(r.child));
	END LOOP;

	FOR r IN c2 LOOP
		reindexderivedobjects(abs(r.child));
	END LOOP;
END;
/


CREATE OR REPLACE PROCEDURE reindexpure_obj(classid IN INTEGER, objectid IN INTEGER)
  IS
    TYPE pk_cur_type IS REF CURSOR;
    TYPE id_cur_type IS REF CURSOR;
    pk_cur pk_cur_type;
    id_cur id_cur_type;
    attr cs_attr%ROWTYPE;
    pField varchar2(100);
    fName varchar2(200);
    attr_obj_id INTEGER;
    class cs_class%ROWTYPE;
    query varchar2(1000);
    secQuery varchar2(1000);
    attrClass cs_class%ROWTYPE;
    backreference varchar2(200);
BEGIN

	SELECT * INTO class FROM cs_class WHERE id = classId;

	FOR attr IN (SELECT * FROM cs_attr WHERE class_id = classid) LOOP	
		IF attr.indexed = '1' THEN
			IF attr.foreign_key_references_to < 0 THEN
				query := 'SELECT ' || class.primary_key_field || ' AS pField, cast(' ||  class.primary_key_field || ' as varchar2(200)) AS fName FROM ' || class.table_name || ' where id = ' || objectid;
			ELSE
				query := 'SELECT ' || class.primary_key_field || ' AS pField, cast(' ||  attr.field_name || ' as varchar2(200)) AS fName FROM ' || class.table_name || ' where id = ' || objectid;
			END IF;
      
      OPEN pk_cur FOR query;
      LOOP
        FETCH pk_cur INTO pField, fName;
        EXIT WHEN pk_cur%NOTFOUND;
        
				IF attr.foreign_key = '1' THEN
					SELECT cs_class.* INTO attrClass FROM cs_class, cs_type WHERE cs_type.class_id = cs_class.id AND cs_type.id = attr.type_id;
					IF attr.foreign_key_references_to < 0 THEN
						SELECT field_name INTO backreference FROM cs_attr WHERE class_id = abs(attr.foreign_key_references_to) AND foreign_key_references_to = attr.class_id;
            
						secQuery := 'SELECT id as id FROM ' || attrClass.table_name || ' WHERE ' || backreference  || ' =  ' || pField;
            
            OPEN id_cur FOR secQuery;
						LOOP
              FETCH id_cur INTO attr_obj_id;
              EXIT WHEN id_cur%NOTFOUND;
              
							INSERT INTO cs_attr_object_temp (class_id, object_id, attr_class_id, attr_object_id) VALUES (class.id, pField, attrClass.id, attr_obj_id);
						END LOOP;
            CLOSE id_cur;
					ELSIF attrClass.array_link = '1' THEN
						secQuery := 'SELECT id as id FROM ' || attrClass.table_name || ' WHERE ' || attr.array_key  || ' =  ' || pField;
            
            OPEN id_cur FOR secQuery;
						LOOP
              FETCH id_cur INTO attr_obj_id;
              EXIT WHEN id_cur%NOTFOUND;
              
							INSERT INTO cs_attr_object_temp (class_id, object_id, attr_class_id, attr_object_id) VALUES (class.id, pField, attrClass.id, attr_obj_id);
						END LOOP;
            CLOSE id_cur;
					ELSE
						secQuery := 'select ' || class.table_name || '.' || attr.field_name || ' as attr_obj_id from ' || class.table_name || ', ' || attrclass.table_name || ' WHERE ' || class.table_name || '.' || class.primary_key_field || ' = ' || pField || ' AND ' || class.table_name || '.' || attr.field_name || ' = ' || attrClass.table_name || '.' || attrClass.primary_key_field;
            
            OPEN id_cur FOR secQuery;
            FETCH id_cur INTO attr_obj_id;
            -- never more than one row
            IF id_cur%FOUND THEN
              -- one row
              insert into cs_attr_object_temp (class_id, object_id, attr_class_id, attr_object_id) VALUES (class.id, pField, attrClass.id, attr_obj_id);
            ELSE
              -- no rows at all
              INSERT INTO cs_attr_object_temp (class_id, object_id, attr_class_id, attr_object_id) VALUES (class.id, pField, attrclass.id, -1);
            END IF;
            CLOSE id_cur;
					END IF;
				ELSE 
					IF fName IS NOT NULL THEN
						INSERT INTO cs_attr_string_temp (class_id, attr_id, object_id, string_val) VALUES (classId, attr.id, pField, fName);
					END IF;
				END IF;
			END LOOP;
		END IF;
	END LOOP;

	DELETE FROM cs_attr_object WHERE class_id = class.id AND object_id = objectid;
	DELETE FROM cs_attr_string WHERE class_id = class.id AND object_id = objectid;
	INSERT INTO cs_attr_object ( class_id, object_id, attr_class_id, attr_object_id) (SELECT class_id, object_id, attr_class_id, attr_object_id FROM cs_attr_object_temp);
	INSERT INTO cs_attr_string ( class_id, attr_id, object_id, string_val) (SELECT class_id, attr_id, object_id, string_val FROM cs_attr_string_temp);
	
END;
/


CREATE OR REPLACE FUNCTION cidsObjectExists(cid INTEGER, oid INTEGER)
  RETURN CHAR IS
    b CHAR(1);
    i INTEGER;
    table_name VARCHAR2(200);
    pk_field VARCHAR2(200);
    s1 VARCHAR2(200);
    s2 VARCHAR2(200);
BEGIN   
    s1 := 'SELECT table_name, primary_key_field FROM cs_class WHERE id = :1';
    EXECUTE IMMEDIATE s1 INTO table_name, pk_field USING cid;
    
    -- this seems to work much like prepared statements thus no var in FROM clause, etc.
    s2 := 'SELECT count(*) FROM ' || table_name || ' WHERE ' || pk_field || ' = :1';
    EXECUTE IMMEDIATE s2 INTO b USING oid;

    RETURN b;    
EXCEPTION
    WHEN OTHERS THEN
    RETURN '0';
END;
/


CREATE OR REPLACE PROCEDURE recreate_stringrepcache_class(classid IN INTEGER)
  IS
  attr_value VARCHAR2(2000);
  ins_stmt VARCHAR2(2100);
BEGIN
  DELETE FROM cs_stringrepcache WHERE class_id = classid;
  
  SELECT attr_value INTO attr_value FROM cs_class_attr WHERE attr_key = 'tostringcache' AND class_id = classid;
  
  ins_stmt := 'INSERT INTO cs_stringrepcache (class_id, object_id, stringrep) SELECT ' || classid || ', '|| attr_value;
  
  EXECUTE IMMEDIATE ins_stmt;
EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Error occured while recreating the stringrepcache for class ' || classid);
  DBMS_OUTPUT.PUT_LINE('ERRM: ' || SQLERRM);
  DBMS_OUTPUT.PUT_LINE('CODE: ' || SQLCODE);
  RETURN;
END;
/


CREATE OR REPLACE PROCEDURE recreate_stringrepcache
  IS
BEGIN
	FOR rec IN (SELECT c.id FROM cs_class c, cs_class_attr a WHERE c.id = a.class_id AND a.attr_key = 'tostringcache') LOOP
		recreate_stringrepcache_class(rec.id);
	END LOOP;
END;
/
