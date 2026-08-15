# ABAP SAP Security Audit Suite

## Overview
The ABAP SAP Security Audit Suite is a production-grade tool designed for enterprise SAP environments. It automates the auditing of security configurations, enforces Role-Based Access Control (RBAC) policies, validates transport request integrity, and generates comprehensive compliance reports.

## Features
- **Security Configuration Audit**: Scans SAP system configurations for deviations from security baselines.
- **RBAC Validation**: Checks user roles and authorizations against least-privilege principles.
- **Transport Integrity**: Verifies the integrity and approval status of transport requests.
- **Compliance Reporting**: Generates machine-readable reports (JSON) for continuous governance and audit trails.

## Prerequisites
- SAP NetWeaver environment with ABAP stack.
- Authorization to access security tables (USR01, USR02, USR41, STUNS2, etc.).
- ABAP Development Tools (ADT) in Eclipse or SE80.

## Installation
1. Import the ABAP objects into your SAP system using the ABAP Package manager.
2. Activate all classes and interfaces.
3. Configure the `ZCL_SAP_SECURITY_AUDIT_CONFIG` class with your specific security policies.
4. Run the `ZCL_SAP_SECURITY_AUDIT_REPORTER` class to generate reports.

## Usage
```abap
DATA: lo_auditor TYPE REF TO zcl_sap_security_auditor.
DATA: lt_results TYPE ztt_security_audit_results.

CREATE OBJECT lo_auditor.

lo_auditor->run_audit( IMPORTING et_results = lt_results ).

LOOP AT lt_results INTO DATA(ls_result).
  WRITE: / ls_result-object_name, ls_result-check_status.
ENDLOOP.
``` 

## License
Internal Use Only.
