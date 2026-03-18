prompt --application/pages/page_00010
begin
--   Manifest
--     PAGE: 00010
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>52461504045118878
,p_default_application_id=>119
,p_default_id_offset=>0
,p_default_owner=>'IRM_POC'
);
wwv_flow_imp_page.create_page(
 p_id=>10
,p_name=>'PAM REPORTS'
,p_alias=>'PAM-REPORTS'
,p_step_title=>'PAM REPORTS'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.card-bd{',
'    background: #020024;',
'background: linear-gradient(90deg, rgba(2, 0, 36, 1) 0%, rgba(240, 240, 250, 1) 0%, rgba(175, 221, 227, 1) 100%);',
'height:12em;',
'overflow-y: scroll;',
'padding: 1em;',
'}',
'',
'::-webkit-scrollbar {',
'',
'  width: 0px;',
'',
'  background: transparent;',
'',
'}',
' ',
'.icon-green {',
'    background-color: green !important;',
'    color: white;',
'    padding: 4px 8px;',
'    border-radius: 4px;',
'}',
'',
'.icon-yellow {',
'    background-color: yellow  !important;',
'    color: black;',
'    padding: 4px 8px;',
'    border-radius: 4px;',
'}',
'',
'.icon-orange {',
'    background-color: orange  !important;',
'    color: white;',
'    padding: 4px 8px;',
'    border-radius: 4px;',
'}',
'',
'.icon-red {',
'    background-color: red  !important;',
'    color: white;',
'    padding: 4px 8px;',
'    border-radius: 4px;',
'}',
'',
'.main-body{',
'    display: flex;',
'    height: 100px;',
'    justify-content: space-evenly;',
'    align-items: center;',
'}',
'',
'.main-body-control{',
'     display: flex;',
'     flex-direction: column;',
'     gap: 1em;',
'    /* height: 100px; */',
'    justify-content: space-between;',
'    /* align-items: center; */',
'    padding-left: 1em;',
'    padding-top: 1em;',
'    padding-bottom: 1em;',
'',
'}',
'',
'',
'.rskcnt{',
'    font-size: 4em;',
'    font-weight: 700;',
'     /* border-left: 2px solid black; */',
'}',
'',
'',
'.risk-low{',
'    font-weight: 700;',
'    background-color: #28d397;',
'    padding-left: 2em;',
'    padding-right: 2em;',
'    padding-bottom: 1em;',
'    padding-top: 1em;',
'    border-radius: 2em;',
'}',
' .risk-medium{',
'    font-weight: 700;',
'    background-color: #f9c149;',
'    padding-left: 2em;',
'    padding-right: 2em;',
'    padding-bottom: 1em;',
'    padding-top: 1em;',
'    border-radius: 2em;',
' ',
' }',
' .risk-high{',
'    font-weight: 700;',
'    background-color: #f95e68;',
'    padding-left: 2em;',
'    padding-right: 2em;',
'    padding-bottom: 1em;',
'    padding-top: 1em;',
'    border-radius: 2em;',
'    /* border-right: 2px solid black; */',
' }',
' .divider{',
'  width: 5px;                /* thickness */',
unistr('  height: 70%;               /* relative height \2014 change to 100% to stretch fully */'),
'  background: #111;          /* line color */',
'  margin: 0 18px;            /* gap on both sides of the line */',
'  align-self: center;        /* center vertically */',
'}',
'',
'',
'',
'.Total_Count_Of_Transactions{',
'    font-weight: 700;',
'    font-size: 1.5em;',
'    background-color: #58c6c8;',
'    border-radius: 1em;',
'}',
'',
'',
'.Total_Count_Of_Transactions::after {',
'  content: "";',
'  position: absolute;',
'  right: 2%;   /* adjust position */',
'  bottom: 5%;  /* adjust position */',
'  width: 100px;  /* size of the icon */',
'  height: 100px;',
'  background: url(''#APP_FILES#file-invoice.png'') no-repeat center;',
'  background-size: contain;',
'  /* opacity: 0.01;  */',
'    /* makes it faint in background */',
'    opacity: 0.2;',
'  pointer-events: none;',
'  overflow: hidden;',
'}',
'',
'',
'/* ',
'',
'.Total_Count_Of_Transactions{',
'    font-weight: 700;',
'    font-size: 1.5em;',
'    background-color: #58c6c8;',
'    border-radius: 1em;',
'    text-shadow: 2px solid black;',
'} */',
'',
'',
'.Invoice_Without_PO_And_GRN::after {',
'  content: "";',
'  position: absolute;',
'  right: 2%;   /* adjust position */',
'  bottom: 5%;  /* adjust position */',
'  width: 100px;  /* size of the icon */',
'  height: 100px;',
'  background: url(''#APP_FILES#file-invoice.png'') no-repeat center;',
'  background-size: contain;',
'  opacity: 0.2;   /* makes it faint in background */',
'  pointer-events: none;',
'  overflow: hidden;',
'}',
'',
'',
'',
'.Back_Dated_Posting_Of_Invoices_In_The_System{',
'       font-weight: 700;',
'    font-size: 1.3em;',
'    background-color: #58c6c8;',
'    border-radius: 1em;',
'}',
'',
'.Back_Dated_Posting_Of_Invoices_In_The_System::after {',
'  content: "";',
'  position: absolute;',
'  right: 2%;   /* adjust position */',
'  bottom: 5%;  /* adjust position */',
'  width: 100px;  /* size of the icon */',
'  height: 100px;',
'  background: url(''#APP_FILES#receipt.png'') no-repeat center;',
'  background-size: contain;',
'  opacity: 0.2;  /* makes it faint in background */',
'  pointer-events: none;',
'  overflow: hidden;',
'}',
'',
'.Duplicate_Vendor_Analysis{',
'      font-weight: 700;',
'    font-size: 1.3em;',
'    background-color: #00b294 ;',
'    border-radius: 1em;',
'}',
'',
'.Duplicate_Vendor_Analysis::after {',
'  content: "";',
'  position: absolute;',
'  right: 2%;   /* adjust position */',
'  bottom: 5%;  /* adjust position */',
'  width: 100px;  /* size of the icon */',
'  height: 100px;',
'  background: url(''#APP_FILES#supplier.png'') no-repeat center;',
'  background-size: contain;',
' opacity: 0.2;   /* makes it faint in background */',
'  pointer-events: none;',
'  overflow: hidden;',
'}',
'',
'',
'.Back_Dated_Posting_Of_Payments_In_The_System{',
'      font-weight: 700;',
'    font-size: 1.3em;',
'    background-color: #e8cd36;',
'    border-radius: 1em;',
'}',
'',
'.Back_Dated_Posting_Of_Payments_In_The_System::after {',
'  content: "";',
'  position: absolute;',
'  right: 2%;   /* adjust position */',
'  bottom: 5%;  /* adjust position */',
'  width: 100px;  /* size of the icon */',
'  height: 100px;',
'  background: url(''#APP_FILES#wallet-arrow.png'') no-repeat center;',
'  background-size: contain;',
'  opacity: 0.2;  /* makes it faint in background */',
'  pointer-events: none;',
'  overflow: hidden;',
'}',
'',
'.Duplicate_Bank_Account{',
'      font-weight: 700;',
'    font-size: 1.3em;',
'    background-color: #e8cd36;',
'    border-radius: 1em;',
'}',
'',
'.Duplicate_Bank_Account::after {',
'  content: "";',
'  position: absolute;',
'  right: 2%;   /* adjust position */',
'  bottom: 5%;  /* adjust position */',
'  width: 100px;  /* size of the icon */',
'  height: 100px;',
'  background: url(''#APP_FILES#bank.png'') no-repeat center;',
'  background-size: contain;',
'  opacity: 0.2;  /* makes it faint in background */',
'  pointer-events: none;',
'  overflow: hidden;',
'}',
'',
'',
'.Suppliers_with_Trade_License_Expiring_Within_One_Month_from_Control_Date{',
'      font-weight: 700;',
'    font-size: 1.3em;',
'    background-color: #fe5210 ;',
'    border-radius: 1em;',
'}',
'',
'.Suppliers_with_Trade_License_Expiring_Within_One_Month_from_Control_Date::after {',
'  content: "";',
'  position: absolute;',
'  right: 2%;   /* adjust position */',
'  bottom: 5%;  /* adjust position */',
'  width: 100px;  /* size of the icon */',
'  height: 100px;',
'  background: url(''#APP_FILES#legal.png'') no-repeat center;',
'  background-size: contain;',
'  opacity: 0.2;   /* makes it faint in background */',
'  pointer-events: none;',
'  overflow: hidden;',
'}',
'',
'.control_attribute_span{',
'    flex-basis: 50%;',
'    color: azure;',
'    font-size: 1.3em;',
'}',
'',
'.dev_count_span{',
'       /* flex-basis: 50%; */',
'    color: azure;',
'    font-size: 1.8em;',
'    /* text-shadow: -2px -2px 0 #000,',
'                2px -2px 0 #000,',
'                -2px 2px 0 #000,',
'                2px 2px 0 #000,',
'                -3px 0px 0 #000,',
'                3px 0px 0 #000,',
'                0px -3px 0 #000,',
'                0px 3px 0 #000; */',
'    ',
'                ',
'}',
'',
'',
'',
'',
'',
'.a-CardView has-body{',
'    border-radius: 1em;',
'}',
'',
'',
'',
'',
'.GRN_Document_Date_And_Posting_Date_Difference{',
'',
'     font-weight: 700;',
'    font-size: 1.3em;',
'    background-color: #1e86f5 ;',
'    border-radius: 1em;',
'}',
'',
'.GRN_Document_Date_And_Posting_Date_Difference::after{',
'',
'',
'    content: "";',
'  position: absolute;',
'  right: 2%;   /* adjust position */',
'  bottom: 5%;  /* adjust position */',
'  width: 100px;  /* size of the icon */',
'  height: 100px;',
'  background: url(''#APP_FILES#note-svgrepo-com (1).svg'') no-repeat center;',
'  background-size: contain;',
'  opacity: 0.2;   /* makes it faint in background */',
'  pointer-events: none;',
'  overflow: hidden; ',
'}',
'',
'',
'',
'',
'.PR_To_Payment{',
'       font-weight: 700;',
'    font-size: 1.3em;',
'    /* background-color: #1e86f5 ; */',
'    background: #020024;',
'background: linear-gradient(90deg, rgba(2, 0, 36, 1) 0%, rgba(9, 9, 121, 1) 0%, rgba(0, 212, 255, 1) 94%);',
'    border-radius: 1em;',
'    padding: 1em;',
'}',
'',
'.PR_To_Payment::after{',
'',
'',
'    content: "";',
'  position: absolute;',
'  right: 2%;   /* adjust position */',
'  bottom: 5%;  /* adjust position */',
'  width: 100px;  /* size of the icon */',
'  height: 100px;',
'  background: url(''#APP_FILES#icons8-p2p-64.png'') no-repeat center;',
'  background-size: contain;',
'  opacity: 0.2;   /* makes it faint in background */',
'  pointer-events: none;',
'  overflow: hidden; ',
'}',
'',
'#btn{',
'    margin-top: 18px !important;',
'}',
'',
'#risk-medium{',
'    cursor: pointer;',
'}',
'.risk-medium{',
'    cursor: pointer;',
'}',
'.risk-low{',
'    cursor: pointer;',
'}',
'',
'/* #APEX_ERROR_MESSAGE{',
'    display: none;',
'} */',
'',
'',
'',
'#customTooltip {',
'    position: absolute;',
'    padding: 6px 10px;',
'    background: #333;',
'    color: #fff;',
'    border-radius: 4px;',
'    font-size: 12px;',
'    display: none;',
'    z-index: 9999;',
'    max-width: 260px;',
'    line-height: 1.4;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(225787295914327608)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(225480902732071626)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(225787917617327611)
,p_plug_name=>'PAM REPORTS'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID,',
'       SYSTEM_CONFIGURATION,',
'       BUSINESS_UNIT,',
'       CREATION_DATE,',
'       CREATED_BY,',
'       CREATED_BY___AIC_OR_ITSM,',
'       LAST_UPDATE_DATE,',
'       LAST_UPDATED_BY,',
'       UPDATED_BY___AIC_OR_ITSM,',
'       W_STATUS',
'  from PAM'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'PAM REPORTS'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(225788077394327611)
,p_name=>'PAM REPORTS'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'IPSITA.PAL@TECHRISKPARTNERS.COM'
,p_internal_uid=>225788077394327611
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225788622216327977)
,p_db_column_name=>'ID'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225789084548327981)
,p_db_column_name=>'SYSTEM_CONFIGURATION'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'System Configuration'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225789487817327983)
,p_db_column_name=>'BUSINESS_UNIT'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Business Unit'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225789700273327985)
,p_db_column_name=>'CREATION_DATE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Creation Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225790167718327987)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225790511553327989)
,p_db_column_name=>'CREATED_BY___AIC_OR_ITSM'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Created By Aic Or Itsm'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225790977926327991)
,p_db_column_name=>'LAST_UPDATE_DATE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Last Update Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225791332924327992)
,p_db_column_name=>'LAST_UPDATED_BY'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Last Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225791701205327994)
,p_db_column_name=>'UPDATED_BY___AIC_OR_ITSM'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Updated By Aic Or Itsm'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225820895939402840)
,p_db_column_name=>'W_STATUS'
,p_display_order=>19
,p_column_identifier=>'J'
,p_column_label=>'W Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(225792780342334435)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2257928'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID:SYSTEM_CONFIGURATION:BUSINESS_UNIT:CREATION_DATE:CREATED_BY:CREATED_BY___AIC_OR_ITSM:LAST_UPDATE_DATE:LAST_UPDATED_BY:UPDATED_BY___AIC_OR_ITSM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(225820607204402838)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select COUNT(ID)  AS VAL,',
'      ''Total Count Of Transactions'' AS LBL',
'  from PAM',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_required_patch=>wwv_flow_imp.id(225480388933071618)
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(225820728600402839)
,p_region_id=>wwv_flow_imp.id(225820607204402838)
,p_layout_type=>'GRID'
,p_card_css_classes=>'&CLASS_NAME.'
,p_title_adv_formatting=>true
,p_title_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'&LBL.',
'',
'<div class="main-body-control">',
'    <span class="control_attribute_span">&LBL.</span>',
'    <!-- <span class="divider" aria-hidden="true"></span> -->',
'    <span class="dev_count_span">&VAL.</span>',
'',
'</div>',
'    <!-- <img src="#APP_FILES#Icons_card/bell.png"> -->'))
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>true
,p_body_html_expr=>'&VAL.'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(225501369359110245)
,p_button_sequence=>20
,p_button_name=>'INVOKE_WORKFLOW'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Invoke Workflow'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(225501296312110244)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_WORKFLOW'
,p_process_name=>'WORKFLOW'
,p_attribute_01=>'START'
,p_attribute_02=>wwv_flow_imp.id(225496992507110201)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(225501369359110245)
,p_internal_uid=>225501296312110244
);
wwv_flow_imp.component_end;
end;
/
