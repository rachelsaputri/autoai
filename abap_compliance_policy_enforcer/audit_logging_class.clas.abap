CLASS zaudit_logging DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
    TYPES:
      BEGIN OF ty_audit_log,
        log_id    TYPE c LENGTH 15,
        timestamp TYPE timestampl,
        event     TYPE c LENGTH 50,
        source    TYPE c LENGTH 30,
        message   TYPE c LENGTH 200,
        severity  TYPE c LENGTH 1,
      END OF ty_audit_log,
      tt_audit_logs TYPE STANDARD TABLE OF ty_audit_log WITH DEFAULT KEY.

    METHODS: log_event
               IMPORTING
                 !i_event    TYPE c LENGTH 50
                 !i_source   TYPE c LENGTH 30
                 !i_message  TYPE c LENGTH 200
                 !i_severity TYPE c LENGTH 1
               RETURNING VALUE(r_log) TYPE ty_audit_log.
    METHODS: persist_logs
               IMPORTING
                 !i_logs TYPE tt_audit_logs
               RETURNING VALUE(r_persisted) TYPE i.
    METHODS: generate_report
               IMPORTING
                 !i_logs TYPE tt_audit_logs
               EXPORTING
                 !e_report TYPE string.

  PROTECTED SECTION.
    DATA: mt_audit_entries TYPE tt_audit_logs.

  PRIVATE SECTION.
    METHODS: generate_log_id
               RETURNING VALUE(r_log_id) TYPE c LENGTH 15.
    METHODS: sanitize_message
               IMPORTING
                 !i_message TYPE c LENGTH 200
               RETURNING VALUE(r_sanitized) TYPE c LENGTH 200.
ENDCLASS.



CLASS zaudit_logging IMPLEMENTATION.

  METHOD log_event.
    CLEAR: r_log.
    r_log-log_id    = generate_log_id( ).
    r_log-timestamp = sy-uzeit.
    r_log-event     = i_event.
    r_log-source    = i_source.
    r_log-message   = sanitize_message( i_message ).
    r_log-severity  = i_severity.
    APPEND r_log TO mt_audit_entries.
  ENDMETHOD.


  METHOD persist_logs.
    DATA: lv_count TYPE i VALUE 0.
    LOOP AT i_logs INTO DATA(ls_log).
      APPEND ls_log TO mt_audit_entries.
      lv_count = lv_count + 1.
    ENDLOOP.
    r_persisted = lv_count.
  ENDMETHOD.


  METHOD generate_report.
    DATA: lv_report TYPE string.
    lv_report = '=== Compliance Audit Report ===
'.
    lv_report = lv_report && |Generated: { sy-datum } { sy-uzeit }| && 
'\n'.
    lv_report = lv_report && |Total Entries: { lines( i_logs ) }| && 
'\n'.
    LOOP AT i_logs INTO DATA(ls_log).
      lv_report = lv_report && |Log ID: { ls_log-log_id }, Event: { ls_log-event }, Message: { ls_log-message }| && 
'\n'.
    ENDLOOP.
    lv_report = lv_report && |=== End of Report ===|.
    e_report = lv_report.
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
    log_event( i_event = 'POLICY_CHECK' i_source = 'ENFORCEMENT_ENGINE' i_message = 'Initiating compliance check' i_severity = '1' ).
    log_event( i_event = 'VERIFICATION' i_source = 'VERIFIER' i_message = 'Policy POL001 validated successfully' i_severity = '0' ).
    log_event( i_event = 'ENFORCEMENT' i_source = 'ENFORCEMENT_ENGINE' i_message = 'Remediation applied for POL002' i_severity = '2' ).

    DATA: lt_logs TYPE tt_audit_logs.
    lt_logs = mt_audit_entries.
    generate_report( IMPORTING e_report = DATA(lv_report) ).
    out->write( lv_report ).
  ENDMETHOD.


  METHOD generate_log_id.
    DATA: lv_id TYPE c LENGTH 15.
    CONCATENATE 'LOG' sy-uzeit sy-uzeito INTO lv_id.
    r_log_id = lv_id.
  ENDMETHOD.


  METHOD sanitize_message.
    r_sanitized = i_message.
    REPLACE ALL OCCURRENCES OF REGEX '[<>]' IN r_sanitized WITH '' .
  ENDMETHOD.

ENDCLASS.
