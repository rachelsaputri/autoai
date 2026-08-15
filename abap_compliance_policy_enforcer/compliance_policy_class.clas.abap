CLASS zcompliance_policy DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
    TYPES:
      BEGIN OF ty_policy_entry,
        policy_id   TYPE c LENGTH 20,
        policy_name TYPE c LENGTH 50,
        severity    TYPE c LENGTH 1,
        rule_id     TYPE c LENGTH 30,
        status      TYPE c LENGTH 10,
      END OF ty_policy_entry,
      tt_policy_entries TYPE STANDARD TABLE OF ty_policy_entry WITH DEFAULT KEY.

    METHODS: define_policy
               IMPORTING
                 !i_policy_id   TYPE c LENGTH 20
                 !i_policy_name TYPE c LENGTH 50
                 !i_severity    TYPE c LENGTH 1
                 !i_rule_id     TYPE c LENGTH 30
                 RETURNING VALUE(r_policy) TYPE ty_policy_entry.
    METHODS: evaluate_policy
               IMPORTING
                 !i_entry TYPE ty_policy_entry
               RETURNING VALUE(r_result) TYPE abap_bool.
    METHODS: register_policy
               IMPORTING
                 !i_entries TYPE tt_policy_entries
               RETURNING VALUE(r_registered_count) TYPE i.

  PROTECTED SECTION.
    DATA: mt_registered_policies TYPE tt_policy_entries.

  PRIVATE SECTION.
    METHODS: validate_rule
               IMPORTING
                 !i_rule_id TYPE c LENGTH 30
               RETURNING VALUE(r_valid) TYPE abap_bool.
    METHODS: map_status
               IMPORTING
                 !i_status TYPE c LENGTH 10
               RETURNING VALUE(r_mapped) TYPE c LENGTH 10.
ENDCLASS.



CLASS zcompliance_policy IMPLEMENTATION.

  METHOD define_policy.
    IF i_policy_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_state.
    ENDIF.

    CLEAR: r_policy.
    r_policy-policy_id   = i_policy_id.
    r_policy-policy_name = i_policy_name.
    r_policy-severity    = i_severity.
    r_policy-rule_id     = i_rule_id.
    r_policy-status      = 'DRAFT'.

    IF validate_rule( i_rule_id ) = abap_true.
      r_policy-status = 'VALIDATED'.
    ELSE.
      r_policy-status = 'INVALID'.
    ENDIF.

    r_registered_count = register_policy( VALUE #( ( r_policy ) ) ).
    r_policy = r_policy.
  ENDMETHOD.


  METHOD evaluate_policy.
    DATA: lv_valid TYPE abap_bool.
    lv_valid = validate_rule( i_entry-rule_id ).
    IF lv_valid = abap_true.
      IF i_entry-status = 'VALIDATED'.
        r_result = abap_true.
      ELSE.
        r_result = abap_false.
      ENDIF.
    ELSE.
      r_result = abap_false.
    ENDIF.
  ENDMETHOD.


  METHOD register_policy.
    DATA: lv_count TYPE i VALUE 0.
    LOOP AT i_entries ASSIGNING FIELD-SYMBOL(<ls_entry>).
      <ls_entry>-status = map_status( <ls_entry>-status ).
      APPEND <ls_entry> TO mt_registered_policies.
      lv_count = lv_count + 1.
    ENDLOOP.
    r_registered_count = lv_count.
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
    DATA: lt_policies TYPE tt_policy_entries.
    lt_policies = VALUE #( (
      policy_id   = 'POL001'
      policy_name = 'Access Control'
      severity    = '1'
      rule_id     = 'RULE_AC_01'
      status      = 'VALIDATED'
    )
    (
      policy_id   = 'POL002'
      policy_name = 'Data Encryption'
      severity    = '2'
      rule_id     = 'RULE_DE_02'
      status      = 'DRAFT'
    ) ).

    r_registered_count = register_policy( lt_policies ).
    out->write( |Successfully registered { r_registered_count } policies.| ).

    LOOP AT mt_registered_policies ASSIGNING FIELD-SYMBOL(<ls_policy>).
      IF evaluate_policy( <ls_policy> ) = abap_true.
        out->write( |Compliance Check Passed for { <ls_policy>-policy_name}| ).
      ELSE.
        out->write( |Compliance Check Failed for { <ls_policy>-policy_name}| ).
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


  METHOD validate_rule.
    CASE i_rule_id.
      WHEN 'RULE_AC_01' | 'RULE_DE_02' | 'RULE_LOG_03'.
        r_valid = abap_true.
      WHEN OTHERS.
        r_valid = abap_false.
    ENDCASE.
  ENDMETHOD.


  METHOD map_status.
    CASE i_status.
      WHEN 'DRAFT' | 'VALIDATED' | 'INVALID' | 'ENFORCED'.
        r_mapped = i_status.
      WHEN OTHERS.
        r_mapped = 'UNKNOWN'.
    ENDCASE.
  ENDMETHOD.

ENDCLASS.
