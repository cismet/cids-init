# cids Datenmodell

## Attribute und Klassen

####  cs_class 
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    id |integer DEFAULT NEXTVAL(('cs_class_sequence'::|text )::regclass) NOT NULL
|    name |character varying(100) NOT NULL
|    descr |text  
|    class_icon_id |integer NOT NULL
|    object_icon_id |integer NOT NULL
|    table_name |character varying(100) NOT NULL
|    primary_key_field |character varying(100) DEFAULT 'ID'::|character varying NOT NULL
|    indexed |BOOLEAN DEFAULT false NOT NULL
|    tostring |integer
|    editor |integer
|    renderer |integer
|    array_link |BOOLEAN DEFAULT false NOT NULL
|    policy |integer
|    attribute_policy |integer



####  cs_type  
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    id |integer DEFAULT NEXTVAL(('cs_type_sequence'::|text )::regclass) NOT NULL
|    name |character varying(100) NOT NULL
|    class_id |integer
|    complex_type |BOOLEAN DEFAULT false NOT NULL
|    descr |text 
|    editor |integer
|    renderer |integer

####  cs_attr 
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|   id |integer DEFAULT NEXTVAL(('cs_attr_sequence'::|text )::regclass) NOT NULL
|    class_id |integer NOT NULL
|    type_id |integer NOT NULL
|    name |character varying(100) NOT NULL
|    field_name |character varying(50) NOT NULL
|    foreign_key |BOOLEAN DEFAULT false NOT NULL
|    substitute |BOOLEAN DEFAULT false NOT NULL
|    foreign_key_references_to |integer
|    descr |text 
|    visible |BOOLEAN DEFAULT true NOT NULL
|    indexed |BOOLEAN DEFAULT false NOT NULL
|    isarray |BOOLEAN DEFAULT false NOT NULL
|    array_key |character varying(30)
|    editor |integer
|    tostring |integer
|    complex_editor |integer
|    optional |BOOLEAN DEFAULT true NOT NULL
|    default_value |character varying(100)
|    from_string |integer
|    pos |integer DEFAULT 0
|    "precision" |integer
|    scale |integer
|    extension_attr |BOOLEAN DEFAULT false NOT NULL



####  cs_class_attr 
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    id |integer DEFAULT NEXTVAL('cs_class_attr_sequence'::regclass) NOT NULL
|    class_id |integer NOT NULL
|    type_id |integer NOT NULL
|    attr_key |character varying(100) NOT NULL
|    attr_value |text 


## Baum

####  cs_cat_link 
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    id_from |integer NOT NULL
|    id_to |integer NOT NULL
|    org |text 
|    domain_to |integer
|    id |integer DEFAULT NEXTVAL('cs_cat_link_sequence'::regclass) NOT NULL

####  cs_cat_node 
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    id |integer DEFAULT NEXTVAL(('cs_cat_node_sequence'::|text )::regclass) NOT NULL
|    name |character varying(100) NOT NULL
|    descr |integer DEFAULT 1
|    class_id |integer
|    object_id |integer
|    node_type |character(1) DEFAULT 'N'::bpchar NOT NULL
|    is_root |BOOLEAN DEFAULT false NOT NULL
|    org |text 
|    dynamic_children |text 
|    sql_sort BOOLEAN
|    policy |integer
|    derive_permissions_from_class |BOOLEAN DEFAULT true
|    iconfactory |integer
|    icon |character varying(512)
|    artifical_id varchar(200)

## Index



#### cs_attr_object 
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    class_id |integer NOT NULL|
|    object_id |integer NOT NULL|
|   attr_class_id |integer NOT NULL|
|  attr_object_id |integer NOT NULL|




####  cs_attr_object_derived
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
| class_id |integer NOT NULL
|  object_id |integer NOT NULL| 
|  attr_class_id |integer NOT NULL
|  attr_object_id |integer NOT NULL



####  cs_attr_string 
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    class_id |integer NOT NULL
|    attr_id |integer NOT NULL
|    object_id |integer NOT NULL
|    string_val |text   NOT NULL

## Rechte und Rollen


####  cs_domain 
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    id |integer DEFAULT NEXTVAL('cs_domain_sequence'::regclass) NOT NULL
|    name |character varying(30)



####  cs_permission 
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    id |integer DEFAULT NEXTVAL('cs_permission_sequence'::regclass) NOT NULL
|    KEY |character varying(10)
|    description |character varying(100)

####  cs_policy 
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    id |integer DEFAULT NEXTVAL('cs_policy_sequence'::regclass) NOT NULL
|    name |character varying(20) NOT NULL

####  cs_policy_rule 
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    id |integer DEFAULT NEXTVAL('cs_policy_rule_sequence'::regclass) NOT NULL
|    policy |integer NOT NULL
|    permission |integer NOT NULL
|    default_value |BOOLEAN NOT NULL


####  cs_ug  
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    id |integer DEFAULT NEXTVAL('cs_ug_sequence'::regclass) NOT NULL
|    name |character varying(32) NOT NULL
|    descr |text 
|    domain |integer NOT NULL
|    prio |integer NOT NULL
|    UNIQUE ( prio )

####  cs_ug_attr_perm  
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    id |integer DEFAULT NEXTVAL(('cs_ug_attr_perm_sequence'::|text )::regclass) NOT NULL
|    ug_id |integer NOT NULL
|    attr_id |integer NOT NULL
|    permission |integer
|    domain |integer

####  cs_ug_cat_node_perm  
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    id |integer DEFAULT NEXTVAL(('cs_ug_cat_node_perm_sequence'::|text )::regclass) NOT NULL
|    ug_id |integer NOT NULL
|    domain |integer
|    cat_node_id |integer NOT NULL
|    permission |integer

####  cs_ug_class_perm  
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    id |integer DEFAULT NEXTVAL('cs_ug_class_perm_sequence'::regclass) NOT NULL
|    ug_id |integer NOT NULL
|    class_id |integer NOT NULL
|    permission |integer
|    domain |integer

####  cs_ug_membership  
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    ug_id |integer NOT NULL
|    usr_id |integer NOT NULL
|    ug_domain |integer
|    id |integer DEFAULT NEXTVAL('cs_ug_membership_sequence'::regclass) NOT NULL


####  cs_ug_method_perm  
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    id |integer DEFAULT NEXTVAL(('cs_ug_method_perm_sequence'::|text )::regclass) NOT NULL
|    ug_id |integer NOT NULL
|    domain |integer
|    method_id |integer NOT NULL
|    permission |integer

####  cs_usr  
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    id |integer DEFAULT NEXTVAL(('cs_usr_sequence'::|text )::regclass) NOT NULL
|    login_name |character varying(32) NOT NULL
|    password |character varying(16)
|    last_pwd_change timestamp without time zone NOT NULL
|    administrator |BOOLEAN DEFAULT false NOT NULL




## Sonstiges


####  cs_icon 
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    id |integer DEFAULT NEXTVAL('cs_icon_sequence'::regclass) NOT NULL
|    name |character varying(32) NOT NULL
|    file_name |character varying(100) DEFAULT 'default_icon.gif'::|character varying NOT NULL

####  cs_java_class 
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    id |integer DEFAULT NEXTVAL('cs_java_class_sequence'::regclass) NOT NULL
|    qualifier |character varying(100)
|    type |character varying(100) DEFAULT 'unknown'::|character varying NOT NULL
|    notice |character varying(500)

####  cs_locks 
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    class_id |integer
|    object_id |integer
|    user_string |character varying(256)
|    additional_info |character varying(256)
|    id |integer DEFAULT NEXTVAL('cs_locks_sequence'::regclass) NOT NULL



####  cs_config_attr_key  
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    id |integer PRIMARY KEY DEFAULT NEXTVAL('cs_config_attr_key_sequence')
|    KEY VARCHAR(200) NOT NULL 
    
####  cs_config_attr_value  
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    id |integer PRIMARY KEY DEFAULT NEXTVAL('cs_config_attr_value_sequence')
|    value |text  );


####  cs_config_attr_type  
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    id |integer PRIMARY KEY DEFAULT NEXTVAL('cs_config_attr_type_sequence')
|    type char(1) NOT NULL
|    descr varchar(200) 
    
####  cs_config_attr_jt  
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    id      |integer       PRIMARY KEY DEFAULT NEXTVAL('cs_config_attr_jt_sequence')
|    usr_id  |integer
|    ug_id   |integer
|    dom_id  |integer       NOT NULL
|    key_id  |integer       NOT NULL
|    val_id  |integer       NOT NULL
|    -- type is only for editing purposes, determines which editor is suited best
    type_id |integer
|    FOREIGN KEY (usr_id)  REFERENCES cs_usr
|    FOREIGN KEY (ug_id)   REFERENCES cs_ug
|    FOREIGN KEY (dom_id)  REFERENCES cs_domain
|    FOREIGN KEY (key_id)  REFERENCES cs_config_attr_key
|    FOREIGN KEY (val_id)  REFERENCES cs_config_attr_value
|    FOREIGN KEY (type_id) REFERENCES cs_config_attr_type
|    -- NULL != NULL in this case so don't fully rely on that
    UNIQUE ( usr_id, ug_id, dom_id, key_id)

####  cs_config_attr_exempt  
| Feldname | Datentyp und Constraints | Beschreibung|
| ------------- |-------------|-------------|
|    id     |integer       PRIMARY KEY DEFAULT NEXTVAL('cs_config_attr_exempt_sequence')
|    usr_id |integer       NOT NULL
|    key_id |integer
|    ug_id  |integer       NOT NULL
|    FOREIGN KEY (usr_id)  REFERENCES cs_usr
|    FOREIGN KEY (key_id)  REFERENCES cs_config_attr_key
|    FOREIGN KEY (ug_id)   REFERENCES cs_ug
|    UNIQUE ( usr_id, key_id )



