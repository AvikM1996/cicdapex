prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 119
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>52461504045118878
,p_default_application_id=>119
,p_default_id_offset=>0
,p_default_owner=>'IRM_POC'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(225486523921071743)
,p_group_name=>'Administration'
);
wwv_flow_imp.component_end;
end;
/
