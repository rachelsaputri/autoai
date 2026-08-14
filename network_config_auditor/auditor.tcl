#!/usr/bin/env tclsh
# Network Configuration Auditor
# Analyzes network device configurations for policy violations and generates compliance reports.

# Import required packages
package require Tcl 8.5
package require ::tcl::json
package require struct::list

# Global variables
set POLICY_FILE ""
set OUTPUT_FILE ""
set VERBOSE 0

# Parse command line arguments
proc parse_args args {
    global POLICY_FILE OUTPUT_FILE VERBOSE
    set i 0
    while {$i < [llength $args]} {
        set arg [lindex $args $i]
        switch -regexp -- $arg {
            ^-p|--policy {
                incr i
                if {$i < [llength $args]} {
                    set POLICY_FILE [lindex $args $i]
                } else {
                    puts "Error: Missing value for -p/--policy"
                    exit 1
                }
            }
            ^-o|--output {
                incr i
                if {$i < [llength $args]} {
                    set OUTPUT_FILE [lindex $args $i]
                } else {
                    puts "Error: Missing value for -o/--output"
                    exit 1
                }
            }
            ^-v|--verbose {
                set VERBOSE 1
            }
            default {
                if {[string match "*.*" $arg]} {
                    set CONFIG_FILE $arg
                } else {
                    puts "Error: Unknown option $arg"
                    exit 1
                }
            }
        }
        incr i
    }
    if {![file exists $CONFIG_FILE]} {
        puts "Error: Config file not found: $CONFIG_FILE"
        exit 1
    }
    if {![file exists $POLICY_FILE]} {
        puts "Error: Policy file not found: $POLICY_FILE"
        exit 1
    }
}

# Load policy file
proc load_policy {policy_file} {
    global POLICIES
    set POLICIES [list]
    if {[file exists $policy_file]} {
        set fh [open $policy_file r]
        while {[gets $fh line] >= 0} {
            if {[regexp {^\s*line\s+"([^"]+)"\s+\{\s*$} $line -> pattern]} {
                lappend POLICIES [list $pattern "alert"]
            } elseif {[regexp {^\s*action\s+"([^"]+)"\s*\} $line -> action]} {
                if {[llength $POLICIES] > 0} {
                    lassign [lindex $POLICIES end] pattern
                    set POLICIES [lreplace $POLICIES end end [list $pattern $action]]
                }
            } elseif {[regexp {^\s*message\s+"([^"]+)"\s*\} $line -> message]} {
                if {[llength $POLICIES] > 0} {
                    lassign [lindex $POLICIES end] pattern action
                    set POLICIES [lreplace $POLICIES end end [list $pattern $action $message]]
                }
            }
        }
        close $fh
    } else {
        puts "Error: Policy file not found: $policy_file"
        exit 1
    }
}

# Analyze configuration
proc analyze_config {config_file policies} {
    global VERBOSE
    set violations [list]
    if {[file exists $config_file]} {
        set fh [open $config_file r]
        set line_num 0
        while {[gets $fh line] >= 0} {
            incr line_num
            foreach policy $policies {
                set pattern [lindex $policy 0]
                set action [lindex $policy 1]
                set message [lindex $policy 2]
                if {[regexp $pattern $line]} {
                    puts "Line $line_num: $line"
                    puts "Policy: $pattern"
                    puts "Action: $action"
                    puts "Message: $message"
                    lappend violations [list $line_num $pattern $action $message]
                }
            }
        }
        close $fh
    } else {
        puts "Error: Config file not found: $config_file"
        exit 1
    }
    return $violations
}

# Generate report
proc generate_report {violations output_file} {
    if {[string length $output_file] > 0} {
        set fh [open $output_file w]
        puts $fh "Configuration Audit Report"
        puts $fh "========================"
        puts $fh ""
        foreach violation $violations {
            set line_num [lindex $violation 0]
            set pattern [lindex $violation 1]
            set action [lindex $violation 2]
            set message [lindex $violation 3]
            puts $fh "Line $line_num: Pattern=$pattern Action=$action Message=$message"
        }
        close $fh
        puts "Report generated: $output_file"
    } else {
        foreach violation $violations {
            set line_num [lindex $violation 0]
            set pattern [lindex $violation 1]
            set action [lindex $violation 2]
            set message [lindex $violation 3]
            puts "Line $line_num: Pattern=$pattern Action=$action Message=$message"
        }
    }
}

# Main procedure
proc main args {
    global POLICY_FILE OUTPUT_FILE VERBOSE CONFIG_FILE
    if {[llength $args] == 0} {
        puts "Usage: ./auditor.tcl [options] <config_file>"
        puts "Options:"
        puts "  -p, --policy <file>  Specify a policy file."
        puts "  -o, --output <file>  Specify an output file for the report."
        puts "  -v, --verbose        Enable verbose output."
        exit 1
    }
    parse_args $args
    load_policy $POLICY_FILE
    set violations [analyze_config $CONFIG_FILE $POLICIES]
    generate_report $violations $OUTPUT_FILE
}

# Run the main procedure
main $argv
