# GAP Version Check
if Length(VERSION) < 11 then
    Error("This tool requires GAP version 4.11 or higher. Please upgrade your installation.");
fi;

# Input Validation & File Loading
LoadCompressedPackage( "composites" );; # Optional, for advanced algebraic ops if needed

# Data Structures
count := 0;
compliance_data := [];
score_threshold := 85.0;

# Load and Parse Input Data
LoadCompressedPackage( "json" );; # Not strictly needed for GAP native types, but we'll use native lists/records for strict GAP compliance

# Simulating data ingestion from a file or standard input
captureOutput := function( filename )
    local stream, line, record, i;
    if filename = "" then
        # Fallback to inline data for demonstration if no file is provided
        return [
            rec(id := 1, policy_group := "AUTH", rules := ["REQ_001", "REQ_002"], status := 1),
            rec(id := 2, policy_group := "AUTH", rules := ["REQ_001"], status := 1),
            rec(id := 3, policy_group := "ACCESS", rules := ["REQ_003", "REQ_004"], status := 0),
            rec(id := 4, policy_group := "ACCESS", rules := ["REQ_003"], status := 1),
            rec(id := 5, policy_group := "ACCESS", rules := ["REQ_004"], status := 1),
            rec(id := 6, policy_group := "AUDIT", rules := ["REQ_005", "REQ_006", "REQ_007"], status := 0),
            rec(id := 7, policy_group := "AUDIT", rules := ["REQ_005", "REQ_006"], status := 1),
            rec(id := 8, policy_group := "AUDIT", rules := ["REQ_006", "REQ_007"], status := 1)
        ];
    else
        stream := ReadStream( filename );
        count := 0;
        while not EndOfStream( stream ) do
            line := ReadLine( stream );
            # Simplified parsing for demonstration, assuming structured input
            # In production, this would use a robust parser for the specific data format
        od;
        CloseStream( stream );
        return [];
    fi;
end;

# Main Processing Engine
ProcessComplianceData := function( data )
    local groups, group_sum, group_rules, total_rules, passed_rules, compliance_score;
    groups := Set( List( data, d -> d.policy_group ) );
    compliance_score := 0.0;
    Print( "================================================================\n" );
    Print( "  GAP COMPLIANCE MATH PROCESSOR - INITIALIZED\n" );
    Print( "================================================================\n\n" );
    for group in groups do
        Print( "Processing Policy Group: " , group , "\n" );
        group_rules := List( Filtered( data, d -> d.policy_group = group ), d -> d.rules );
        total_rules := Set( Concatenation( group_rules ) );
        passed_rules := Filtered( total_rules, rule -> ForAll( data, d -> d.policy_group = group and IsSubset( d.rules, total_rules ) and d.status = 1 ) );
        # More robust algebraic scoring based on rule subset coverage
        passed_rules := [];
        for rule in total_rules do
            if ForAll( data, d -> not (d.policy_group = group and rule in d.rules) or d.status = 1 ) then
                Add( passed_rules, rule );
            fi;
        od;
        Print( "  Total Unique Rules: " , Length( total_rules ) , "\n" );
        Print( "  Passed/Compliant Rules: " , Length( passed_rules ) , "\n" );
        Print( "  Deviations Found: " , Length( total_rules ) - Length( passed_rules ) , "\n" );
        if Length( total_rules ) > 0 then
            compliance_score := compliance_score + (Length( passed_rules ) / Length( total_rules ));
        fi;
        Print( "\n" );
    od;
    if Length( groups ) > 0 then
        compliance_score := (compliance_score / Length( groups )) * 100.0;
        Print( "================================================================\n" );
        Print( "  FINAL COMPLIANCE SCORE: " , compliance_score , "%\n" );
        if compliance_score >= score_threshold then
            Print( "  STATUS: COMPLIANT\n" );
        else
            Print( "  STATUS: NON-COMPLIANT\n" );
        fi;
        Print( "================================================================\n" );
    fi;
    return compliance_score;
end;

# Execution
compliance_data := captureOutput( "" );
if Length( compliance_data ) > 0 then
    ProcessComplianceData( compliance_data );
else
    Error( "No valid compliance data loaded. Ensure input format is correct." );
fi;
