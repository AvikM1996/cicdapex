prompt --application/shared_components/workflow/task_definitions/pm_hod
begin
--   Manifest
--     TASK_DEF: PM_HOD
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
 p_id=>wwv_flow_imp.id(226101862586454005)
,p_name=>'PM_HOD'
,p_static_id=>'PM_HOD'
,p_subject=>'PAM_HOD'
,p_task_type=>'ACTION'
,p_priority=>3
,p_expiration_policy=>'NONE'
,p_max_renewal_count=>3
,p_initiator_can_complete=>false
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(226102829558454008)
,p_task_def_id=>wwv_flow_imp.id(226101862586454005)
,p_label=>'Pam Id'
,p_static_id=>'PAM_ID'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(226103209775454010)
,p_task_def_id=>wwv_flow_imp.id(226101862586454005)
,p_label=>'Pam System Configuration'
,p_static_id=>'PAM_SYSTEM_CONFIGURATION'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(226104115812457468)
,p_task_def_id=>wwv_flow_imp.id(226101862586454005)
,p_label=>'V Hod Owner'
,p_static_id=>'V_HOD_OWNER'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(226102003763454006)
,p_task_def_id=>wwv_flow_imp.id(226101862586454005)
,p_participant_type=>'POTENTIAL_OWNER'
,p_identity_type=>'USER'
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'UPPER(:V_HOD_OWNER)'
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(226102480089454007)
,p_task_def_id=>wwv_flow_imp.id(226101862586454005)
,p_participant_type=>'BUSINESS_ADMIN'
,p_identity_type=>'USER'
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'UPPER(:V_HOD_OWNER)'
);
wwv_flow_imp.component_end;
end;
/
