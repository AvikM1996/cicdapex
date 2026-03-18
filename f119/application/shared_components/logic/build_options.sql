prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 119
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>52461504045118878
,p_default_application_id=>119
,p_default_id_offset=>0
,p_default_owner=>'IRM_POC'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(225480388933071618)
,p_build_option_name=>'Commented Out'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>46309961919617
);
wwv_flow_imp.component_end;
end;
/
