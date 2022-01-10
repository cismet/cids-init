DROP VIEW IF EXISTS textsearch;
DROP VIEW IF EXISTS geosuche;
DROP VIEW IF EXISTS cs_class_hierarchy;
DROP TABLE IF EXISTS cs_config_attr_jt; DROP SEQUENCE IF EXISTS cs_config_attr_jt_sequence;
DROP TABLE IF EXISTS cs_config_attr_key; DROP SEQUENCE IF EXISTS cs_config_attr_key_sequence;
DROP TABLE IF EXISTS cs_config_attr_value; DROP SEQUENCE IF EXISTS cs_config_attr_value_sequence;
DROP TABLE IF EXISTS cs_config_attr_type; DROP SEQUENCE IF EXISTS cs_config_attr_type_sequence;
DROP TABLE IF EXISTS cs_config_attr_exempt; DROP SEQUENCE IF EXISTS cs_config_attr_exempt_sequence;
DROP TABLE IF EXISTS cs_attr_object;
DROP TABLE IF EXISTS cs_attr_object_derived;
DROP TABLE IF EXISTS cs_attr; DROP SEQUENCE IF EXISTS cs_attr_sequence;
DROP TABLE IF EXISTS cs_attr_string;
DROP TABLE IF EXISTS cs_cat_link; DROP SEQUENCE IF EXISTS cs_cat_link_sequence;
DROP TABLE IF EXISTS cs_cat_node; DROP SEQUENCE IF EXISTS cs_cat_node_sequence;
DROP TABLE IF EXISTS cs_class; DROP SEQUENCE IF EXISTS cs_class_sequence;
DROP TABLE IF EXISTS cs_class_attr; DROP SEQUENCE IF EXISTS cs_class_attr_sequence;
DROP TABLE IF EXISTS cs_domain; DROP SEQUENCE IF EXISTS cs_domain_sequence;
DROP TABLE IF EXISTS cs_icon; DROP SEQUENCE IF EXISTS cs_icon_sequence;
DROP TABLE IF EXISTS cs_java_class; DROP SEQUENCE IF EXISTS cs_java_class_sequence;
DROP TABLE IF EXISTS cs_locks; DROP SEQUENCE IF EXISTS cs_locks_seq;
DROP TABLE IF EXISTS cs_method; DROP SEQUENCE IF EXISTS cs_method_sequence;
DROP TABLE IF EXISTS cs_method_class_assoc; DROP SEQUENCE IF EXISTS cs_method_class_assoc_sequence;
DROP TABLE IF EXISTS cs_permission; DROP SEQUENCE IF EXISTS cs_permission_sequence;
DROP TABLE IF EXISTS cs_policy; DROP SEQUENCE IF EXISTS cs_policy_sequence;
DROP TABLE IF EXISTS cs_policy_rule; DROP SEQUENCE IF EXISTS cs_policy_rule_sequence;
DROP TABLE IF EXISTS cs_query; DROP SEQUENCE IF EXISTS cs_query_sequence;
DROP TABLE IF EXISTS cs_query_class_assoc; DROP SEQUENCE IF EXISTS cs_query_class_assoc_sequence;
DROP TABLE IF EXISTS cs_query_link; DROP SEQUENCE IF EXISTS cs_query_link_sequence;
DROP TABLE IF EXISTS cs_query_parameter; DROP SEQUENCE IF EXISTS cs_query_parameter_sequence;
DROP TABLE IF EXISTS cs_query_store; DROP SEQUENCE IF EXISTS cs_query_store_sequence;
DROP TABLE IF EXISTS cs_query_store_ug_assoc; DROP SEQUENCE IF EXISTS cs_query_store_ug_assoc_sequence;
DROP TABLE IF EXISTS cs_query_ug_assoc; DROP SEQUENCE IF EXISTS cs_query_ug_assoc_sequence;
DROP TABLE IF EXISTS cs_type; DROP SEQUENCE IF EXISTS cs_type_sequence;
DROP TABLE IF EXISTS cs_ug; DROP SEQUENCE IF EXISTS cs_ug_sequence;
DROP TABLE IF EXISTS cs_ug_attr_perm; DROP SEQUENCE IF EXISTS cs_ug_attr_perm_sequence;
DROP TABLE IF EXISTS cs_ug_cat_node_perm; DROP SEQUENCE IF EXISTS cs_ug_cat_node_perm_sequence;
DROP TABLE IF EXISTS cs_ug_class_perm; DROP SEQUENCE IF EXISTS cs_ug_class_perm_sequence;
DROP TABLE IF EXISTS cs_ug_membership; DROP SEQUENCE IF EXISTS cs_ug_membership_sequence;
DROP TABLE IF EXISTS cs_ug_method_perm; DROP SEQUENCE IF EXISTS cs_ug_method_perm_sequence;
DROP TABLE IF EXISTS cs_usr; DROP SEQUENCE IF EXISTS cs_usr_sequence;
DROP TABLE IF EXISTS geom; DROP SEQUENCE IF EXISTS geom_seq;
DROP TABLE IF EXISTS url_base; DROP SEQUENCE IF EXISTS url_base_seq;
DROP TABLE IF EXISTS url; DROP SEQUENCE IF EXISTS url_seq;
DROP TABLE IF EXISTS cs_changed;
DROP TABLE IF EXISTS cs_scheduled_serveractions; DROP SEQUENCE IF EXISTS cs_scheduled_serveractions_sequence;
DROP TABLE IF EXISTS cs_history;
DROP TABLE IF EXISTS cs_cache;
DROP FUNCTION IF EXISTS insert_cache_entry(classid integer, objectId integer);
DROP FUNCTION IF EXISTS recreate_cache();
DROP FUNCTION IF EXISTS recreate_cache(classid integer);
DROP FUNCTION IF EXISTS recreate_cache(tablename text);
DROP FUNCTION IF EXISTS insert_cache_entry(tableName text, objectId integer);
DROP FUNCTION IF EXISTS update_cache_entry(tableName text, objectId integer);
DROP FUNCTION IF EXISTS reindexpure(classid integer);
DROP FUNCTION IF EXISTS reindexderivedobjects(classid integer);
DROP FUNCTION IF EXISTS reindex();
DROP FUNCTION IF EXISTS reindex(class_id integer);
DROP FUNCTION IF EXISTS reindexpure(classid integer, objectid integer);
DROP FUNCTION IF EXISTS salt(integer);
DROP FUNCTION IF EXISTS cidsObjectExists(cid integer, oid integer);
DROP FUNCTION IF EXISTS execute(_command character varying);
DROP FUNCTION IF EXISTS selexecute(_command character varying);
DROP FUNCTION IF EXISTS execute_query(_command character varying);
DROP FUNCTION IF EXISTS public.cs_refresh_changed();
DROP FUNCTION IF EXISTS public.cs_refresh_changed(classId integer);
-- DROP FUNCTION IF EXISTS cs_recreatecacheddaqview(text);
DROP FUNCTION IF EXISTS cs_recreatecacheddaqview(viewname text);