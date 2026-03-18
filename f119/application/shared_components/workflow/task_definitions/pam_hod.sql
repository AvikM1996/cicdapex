prompt --application/shared_components/workflow/task_definitions/pam_hod
begin
--   Manifest
--     TASK_DEF: PAM_HOD
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>52461504045118878
,p_default_application_id=>119
,p_default_id_offset=>0
,p_default_owner=>'IRM_POC'
);
wwv_flow_imp_shared.create_task_def(
 p_id=>wwv_flow_imp.id(225833305065474159)
,p_name=>'PAM_HOD'
,p_static_id=>'PAM_HOD'
,p_subject=>'PAM_HOD'
,p_task_type=>'ACTION'
,p_priority=>3
,p_expiration_policy=>'NONE'
,p_max_renewal_count=>3
,p_details_link_target=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP,12:P12_TASK_ID:&TASK_ID.'
,p_initiator_can_complete=>false
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(225938438105606441)
,p_task_def_id=>wwv_flow_imp.id(225833305065474159)
,p_label=>'Pam Id'
,p_static_id=>'PAM_ID'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(225958290580670615)
,p_task_def_id=>wwv_flow_imp.id(225833305065474159)
,p_label=>'Pam System Configuration'
,p_static_id=>'PAM_SYSTEM_CONFIGURATION'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(225921353244544007)
,p_task_def_id=>wwv_flow_imp.id(225833305065474159)
,p_participant_type=>'POTENTIAL_OWNER'
,p_identity_type=>'USER'
,p_value_type=>'SQL_QUERY'
,p_value=>'SELECT UPPER(DEFINE_HOD) FROM NEW_RULESET WHERE CONTROL_NAME=:PAM_SYSTEM_CONFIGURATION'
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(225921674885544009)
,p_task_def_id=>wwv_flow_imp.id(225833305065474159)
,p_participant_type=>'BUSINESS_ADMIN'
,p_identity_type=>'USER'
,p_value_type=>'SQL_QUERY'
,p_value=>'SELECT UPPER(DEFINE_HOD) FROM NEW_RULESET WHERE CONTROL_NAME=:PAM_SYSTEM_CONFIGURATION'
);
wwv_flow_imp.component_end;
end;
/
