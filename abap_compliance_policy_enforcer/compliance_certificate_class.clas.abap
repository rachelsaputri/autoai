CLASS zcompliance_certificate DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
    TYPES:
      BEGIN OF ty_cert_entry,
        cert_id      TYPE c LENGTH 20,
        issued_to    TYPE c LENGTH 50,
        policy_id    TYPE c LENGTH 20,
        validity_from TYPE d,
        validity_to   TYPE d,
        status       TYPE c LENGTH 10,
        hash_value   TYPE c LENGTH 40,
      END OF ty_cert_entry,
      tt_cert_entries TYPE STANDARD TABLE OF ty_cert_entry WITH DEFAULT KEY.

    METHODS: generate_certificate
               IMPORTING
                 !i_issued_to   TYPE c LENGTH 50
                 !i_policy_id   TYPE c LENGTH 20
               RETURNING VALUE(r_cert) TYPE ty_cert_entry.
    METHODS: verify_certificate
               IMPORTING
                 !i_cert TYPE ty_cert_entry
               RETURNING VALUE(r_valid) TYPE abap_bool.
    METHODS: serialize_certificates
               IMPORTING
                 !i_certs TYPE tt_cert_entries
               RETURNING VALUE(r_json) TYPE string.

  PROTECTED SECTION.
    DATA: mt_certificates TYPE tt_cert_entries.

  PRIVATE SECTION.
    METHODS: generate_hash
               IMPORTING
                 !i_data TYPE string
               RETURNING VALUE(r_hash) TYPE c LENGTH 40.
    METHODS: validate_dates
               IMPORTING
                 !i_from TYPE d
                 !i_to   TYPE d
               RETURNING VALUE(r_valid) TYPE abap_bool.
ENDCLASS.



CLASS zcompliance_certificate IMPLEMENTATION.

  METHOD generate_certificate.
    CLEAR: r_cert.
    r_cert-cert_id      = |CERT_{ sy-uzeit }_{ sy-uzeiso }|.
    r_cert-issued_to    = i_issued_to.
    r_cert-policy_id    = i_policy_id.
    r_cert-validity_from = sy-datum.
    r_cert-validity_to   = sy-datum + 365.
    r_cert-status       = 'ACTIVE'.
    r_cert-hash_value   = generate_hash( i_issued_to && i_policy_id ).
    APPEND r_cert TO mt_certificates.
  ENDMETHOD.


  METHOD verify_certificate.
    DATA: lv_date_valid TYPE abap_bool.
    lv_date_valid = validate_dates( i_from = i_cert-validity_from i_to = i_cert-validity_to ).
    IF i_cert-status = 'ACTIVE' AND lv_date_valid = abap_true.
      r_valid = abap_true.
    ELSE.
      r_valid = abap_false.
    ENDIF.
  ENDMETHOD.


  METHOD serialize_certificates.
    DATA: lv_json TYPE string.
    lv_json = '{' && '"certificates": ['.
    LOOP AT i_certs INTO DATA(ls_cert) INDEX INTO DATA(lv_index).
      lv_json = lv_json && '{"cert_id": "' && ls_cert-cert_id && '", "issued_to": "' && ls_cert-issued_to && '", "status": "' && ls_cert-status && '"}'.
      IF lv_index < lines( i_certs ).
        lv_json = lv_json && ', '.
      ENDIF.
    ENDLOOP.
    lv_json = lv_json && ']}'.
    r_json = lv_json.
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
    DATA: lo_cert TYPE REF TO zcompliance_certificate.
    CREATE OBJECT lo_cert.
    lo_cert->generate_certificate( EXPORTING i_issued_to = 'Compliance Module A' i_policy_id = 'POL001' ).
    lo_cert->generate_certificate( EXPORTING i_issued_to = 'Audit Subsystem B' i_policy_id = 'POL002' ).

    DATA: lv_json TYPE string.
    lv_json = lo_cert->serialize_certificates( mt_certificates ).
    WRITE: / lv_json.

    LOOP AT mt_certificates INTO DATA(ls_cert).
      IF lo_cert->verify_certificate( ls_cert ) = abap_true.
        WRITE: / |Certificate { ls_cert-cert_id } is VALID.|.
      ELSE.
        WRITE: / |Certificate { ls_cert-cert_id } is INVALID.|.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


  METHOD generate_hash.
    r_hash = cl_abap_message_digest=>calculate_hash_for_char( i_data = i_data i_algo = 'SHA-1' ).
  ENDMETHOD.


  METHOD validate_dates.
    IF i_from IS NOT INITIAL AND i_to IS NOT INITIAL AND i_to >= i_from.
      r_valid = abap_true.
    ELSE.
      r_valid = abap_false.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
