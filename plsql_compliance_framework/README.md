# PL/SQL Compliance Framework

A comprehensive, fully functional PL/SQL-based compliance auditing framework designed to enforce security policies, detect configuration drift, and generate audit reports within an Oracle Database environment.

## Features
- Policy Management & Versioning
- Real-time Compliance Checks
- Automated Audit Trail Logging
- Configuration Drift Detection
- Remediation Reporting

## Architecture

### Core Components
1. **Policy Manager**: Stores and versions security policies.
2. **Compliance Engine**: Executes policy rules against database state.
3. **Audit Logger**: Records all compliance events and remediation actions.
4. **Drift Detector**: Compares current state against baseline policies.
5. **Report Generator**: Produces detailed JSON/HTML audit reports.

### Database Schema
- `CPM_POLICIES`: Stores policy definitions.
- `CPM_AUDIT_LOG`: Records compliance events.
- `CPM_DRIFT_HISTORY`: Tracks configuration changes.
- `CPM_REMEDIATION`: Stores required remediation steps.

## Usage

### 1. Initialize the Framework
Execute the `setup.sql` script to create tables and packages.

### 2. Define Policies
Insert policy rules into `CPM_POLICIES`.

### 3. Run Compliance Checks
Call `cpm_engine.run_audit` to perform a full compliance scan.

### 4. Generate Reports
Use `cpm_report.generate_json` to export results.

## Security
- All operations are logged to `CPM_AUDIT_LOG`.
- Access is restricted via Oracle Roles.
- Sensitive data is encrypted using native Oracle encryption.

## Dependencies
- Oracle Database 19c or later
- Oracle Advanced Security Option

## License
Proprietary. Internal use only.
