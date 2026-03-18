prompt --application/shared_components/workflow/task_definitions/bank
begin
--   Manifest
--     TASK_DEF: BANK
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
 p_id=>wwv_flow_imp.id(225505159198340377)
,p_name=>'BANK'
,p_static_id=>'BANK'
,p_subject=>'Suject'
,p_task_type=>'APPROVAL'
,p_priority=>3
,p_due_on_interval=>'SELECT sysdate + 7 FROM dual'
,p_expiration_policy=>'NONE'
,p_max_renewal_count=>3
,p_due_on_type=>'SQL_QUERY'
,p_due_on_language=>'SQL'
,p_details_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP,2:P2_TASK_ID:&TASK_ID.'
,p_initiator_can_complete=>false
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(225505818206347731)
,p_task_def_id=>wwv_flow_imp.id(225505159198340377)
,p_participant_type=>'POTENTIAL_OWNER'
,p_identity_type=>'USER'
,p_value_type=>'SQL_QUERY'
,p_value=>'SELECT UPPER(CONTROL_SECURITY_CONTEXT) from RULESET_SAC where CONTROL_NAME=''Maintain Supplier Bank Accounts'';'
);
wwv_flow_imp.component_end;
end;
/
