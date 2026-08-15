# Net.Data Audit Gateway

## Overview
The `net_data_audit_gateway` is a secure, web-based audit data gateway and dynamic reporting service built strictly using IBM's **Net.Data** programming language. This legacy CGI framework is leveraged to interface directly with corporate compliance databases, execute parameterized SQL queries, and render real-time security posture metrics, policy violation logs, and compliance reports as dynamic HTML and XML streams.

## Architecture
The gateway is structured into three primary components to maintain separation of concerns and adhere to secure coding practices:
1. `audit_gateway.nd`: The primary Net.Data script that handles HTTP request parsing, authentication validation, database connection pooling, and query routing.
2. `templates/audit_report.ndt`: Net.Data template files that define the layout for dynamic HTML reports, utilizing `<netdata>` tags for data binding and HTML passthrough for styling.
3. `scripts/secure_db_handler.sql`: Parameterized SQL scripts designed specifically for Net.Data's `@QUERY` and `@INSERT` directives to prevent SQL injection and ensure safe data retrieval.

## Security Features
- **Authentication & Authorization**: Validates session tokens against the IAM database before processing any audit requests.
- **Parameterized Queries**: All database interactions use strictly parameterized statements to mitigate SQL injection risks.
- **Input Sanitization**: Automatically sanitizes all incoming CGI parameters before they are injected into SQL queries.
- **Audit Logging**: Every access attempt and query execution is logged to the central `audit_trail` database for regulatory compliance (SOX, HIPAA, GDPR).

## Usage Instructions
1. Configure the `audit_gateway.nd` file with your organization's database connection string and authentication endpoints.
2. Deploy the `templates/` directory to the IBM iSeries (AS/400) CGIPW library.
3. Access the gateway via HTTPS: `https://<your-server>/net_data_audit_gateway/audit_gateway.nd?metric=security_posture&range=30d`
4. Results will be served as formatted HTML for dashboard integration or as XML for external auditor consumption.

## Requirements
- IBM iSeries (AS/400) operating system
- Net.Data Web Server (CGIPW library)
- DB2 for i database access
- Valid SSL/TLS certificates for secure transport

## License
Internal Use Only. Proprietary to the Enterprise Security Architecture Team.
