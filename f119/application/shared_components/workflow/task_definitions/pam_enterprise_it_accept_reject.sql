prompt --application/shared_components/workflow/task_definitions/pam_enterprise_it_accept_reject
begin
--   Manifest
--     TASK_DEF: PAM_ENTERPRISE_IT_ACCEPT_REJECT
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
 p_id=>wwv_flow_imp.id(225605249681266416)
,p_name=>'PAM_ENTERPRISE_IT_ACCEPT_REJECT'
,p_static_id=>'PAM_ACCEPT_REJECT'
,p_subject=>'PAM_ACCEPT_REJECT'
,p_task_type=>'APPROVAL'
,p_priority=>3
,p_expiration_policy=>'NONE'
,p_max_renewal_count=>3
,p_details_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:P3_TASK_ID:&TASK_ID.'
,p_initiator_can_complete=>false
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(225611319372305234)
,p_task_def_id=>wwv_flow_imp.id(225605249681266416)
,p_label=>'V Pam Business Unit'
,p_static_id=>'V_PAM_BUSINESS_UNIT'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(225611687632305239)
,p_task_def_id=>wwv_flow_imp.id(225605249681266416)
,p_label=>'V Pam Id'
,p_static_id=>'V_PAM_ID'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(225612096156305240)
,p_task_def_id=>wwv_flow_imp.id(225605249681266416)
,p_label=>'V System Configuration'
,p_static_id=>'V_SYSTEM_CONFIGURATION'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(225605631910283059)
,p_task_def_id=>wwv_flow_imp.id(225605249681266416)
,p_participant_type=>'POTENTIAL_OWNER'
,p_identity_type=>'USER'
,p_value_type=>'SQL_QUERY'
,p_value=>'SELECT UPPER(CONTROL_OWNER) FROM NEW_RULESET WHERE CONTROL_NAME=''Set Up Payables'';'
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(225808064503372831)
,p_task_def_id=>wwv_flow_imp.id(225605249681266416)
,p_participant_type=>'BUSINESS_ADMIN'
,p_identity_type=>'USER'
,p_value_type=>'SQL_QUERY'
,p_value=>'SELECT UPPER(CONTROL_OWNER) FROM NEW_RULESET WHERE CONTROL_NAME=''Set Up Payables'';'
);
wwv_flow_imp.component_end;
end;
/
