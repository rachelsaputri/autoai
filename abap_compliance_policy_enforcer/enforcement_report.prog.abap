REPORT z_compliance_enforcement_report.

*----------------------------------------------------------------------*
* Program: Z_COMPLIANCE_ENFORCEMENT_REPORT
* Description: Main execution report for triggering compliance enforcement
*              workflows and audit logging.
*----------------------------------------------------------------------*

CLASS lcl_compliance_orchestrator DEFINITION.
  PUBLIC SECTION.
    METHODS: run_enforcement.
ENDCLASS.

CLASS lcl_compliance_orchestrator IMPLEMENTATION.
  METHOD run_enforcement.
    DATA: lo_policy TYPE REF TO zcompliance_policy,
          lo_audit  TYPE REF TO zaudit_logging.
    DATA: lt_policies TYPE zcompliance_policy=>tt_policy_entries,
          lt_logs     TYPE zaudit_logging=>tt_audit_logs.
    DATA: lv_report TYPE string.

    CREATE OBJECT: lo_policy,
                   lo_audit.

    * Define and register sample policies
    lt_policies = VALUE #( (
      policy_id   = 'POL001' policy_name = 'Access Control' severity = '1' rule_id = 'RULE_AC_01' status = 'VALIDATED'
    )
    (
      policy_id   = 'POL002' policy_name = 'Data Encryption' severity = '2' rule_id = 'RULE_DE_02' status = 'DRAFT'
    ) ).

    DATA(lv_reg_count) = lo_policy->register_policy( lt_policies ).
    WRITE: / |Registered { lv_reg_count } policies.|.

    * Evaluate policies and log events
    LOOP AT lt_policies INTO DATA(ls_policy).
      IF lo_policy->evaluate_policy( ls_policy ) = abap_true.
        lo_audit->log_event( EXPORTING i_event = 'COMPLIANCE_CHECK' i_source = 'REPORT_MAIN' i_message = |Passed: { ls_policy-policy_name }| i_severity = '0' ).
      ELSE.
        lo_audit->log_event( EXPORTING i_event = 'COMPLIANCE_CHECK' i_source = 'REPORT_MAIN' i_message = |Failed: { ls_policy-policy_name }| i_severity = '1' ).
      ENDIF.
    ENDLOOP.

    * Generate and display audit report
    lt_logs = lo_audit->mt_audit_entries.
    lo_audit->generate_report( IMPORTING e_report = lv_report ).
    WRITE: / lv_report.

  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  DATA: lo_orchestrator TYPE REF TO lcl_compliance_orchestrator.
  CREATE OBJECT lo_orchestrator.
  lo_orchestrator->run_enforcement( ).
