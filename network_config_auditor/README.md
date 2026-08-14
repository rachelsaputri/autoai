# Network Configuration Auditor

## Overview
The Network Configuration Auditor is a Tcl-based tool designed to analyze network device configurations for policy violations and generate compliance reports. It supports multiple configuration formats and integrates with existing logging infrastructure to provide actionable insights.

## Features
- Configuration parsing and analysis
- Policy violation detection
- Compliance reporting
- Integration with syslog and SIEM systems

## Installation
1. Ensure Tcl 8.5 or later is installed on your system.
2. Place the `auditor.tcl` file in a directory of your choice.
3. Make the script executable: `chmod +x auditor.tcl`

## Usage
Run the auditor with the following command:
```
./auditor.tcl [options] <config_file>
```

Options:
- `-p, --policy <file>`: Specify a policy file.
- `-o, --output <file>`: Specify an output file for the report.
- `-v, --verbose`: Enable verbose output.

## Configuration
Create a policy file in the following format:
```
policy {
    line "^hostname.*" {
        action "alert"
        message "Hostname must be configured."
    }
    line "^ip ssh.*" {
        action "block"
        message "SSH must be enabled."
    }
}
```

## Contributing
Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bug fixes.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
