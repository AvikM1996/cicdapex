prompt --application/shared_components/workflow/task_definitions/pam_en_it_ar
begin
--   Manifest
--     TASK_DEF: PAM_EN_IT_AR
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
 p_id=>wwv_flow_imp.id(226098836277447324)
,p_name=>'PAM_EN_IT_AR'
,p_static_id=>'PAM_EN_IT_AR'
,p_subject=>'PAM_ACCEPT_REJECT'
,p_task_type=>'APPROVAL'
,p_priority=>3
,p_expiration_policy=>'NONE'
,p_max_renewal_count=>3
,p_initiator_can_complete=>false
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(226099882589447331)
,p_task_def_id=>wwv_flow_imp.id(226098836277447324)
,p_label=>'V Pam Business Unit'
,p_static_id=>'V_PAM_BUSINESS_UNIT'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(226100272235447333)
,p_task_def_id=>wwv_flow_imp.id(226098836277447324)
,p_label=>'V Pam Id'
,p_static_id=>'V_PAM_ID'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(226100678237447334)
,p_task_def_id=>wwv_flow_imp.id(226098836277447324)
,p_label=>'V System Configuration'
,p_static_id=>'V_SYSTEM_CONFIGURATION'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(226101441023452286)
,p_task_def_id=>wwv_flow_imp.id(226098836277447324)
,p_label=>'V P Owner'
,p_static_id=>'V_P_OWNER'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(226099092474447327)
,p_task_def_id=>wwv_flow_imp.id(226098836277447324)
,p_participant_type=>'POTENTIAL_OWNER'
,p_identity_type=>'USER'
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'UPPER(:V_P_OWNER)'
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(226099452725447328)
,p_task_def_id=>wwv_flow_imp.id(226098836277447324)
,p_participant_type=>'BUSINESS_ADMIN'
,p_identity_type=>'USER'
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'UPPER(:V_P_OWNER)'
);
wwv_flow_imp.component_end;
end;
/
