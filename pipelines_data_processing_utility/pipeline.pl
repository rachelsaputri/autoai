#!/usr/bin/env pipeline
# File: pipeline.pl
# Purpose: Main orchestration engine for the data processing utility.

use strict;
use warnings;

# --- Configuration & Global State ---
my $SCHEMA_FILE = $ARGV[0] || die "Usage: $0 <schema_file>\n";
my $DATA_FILE = $ARGV[1] || die "Usage: $0 <schema_file> <data_file>\n";

my %SCHEMA;
my $INGESTOR;
my $TRANSFORMER;
my $VALIDATOR;
my $REPORTER;

# --- Main Execution Flow ---

sub main {
    print "Initializing Pipeline Engine v1.0...\n";
    
    # 1. Load Schema
    if (!load_schema($SCHEMA_FILE)) {
        die "Fatal: Failed to load schema from $SCHEMA_FILE\n";
    }
    print "[OK] Schema loaded successfully.\n";

    # 2. Initialize Stages
    $INGESTOR = new Ingestor();
    $TRANSFORMER = new Transformer();
    $VALIDATOR = new Validator();
    $REPORTER = new Reporter();

    # 3. Execute Pipeline
    my @raw_records = $INGESTOR->run($DATA_FILE);
    print "[STAGE 1] Ingested " . scalar(@raw_records) . " records.\n";

    my @transformed_records = $TRANSFORMER->run(@raw_records);
    print "[STAGE 2] Transformed " . scalar(@transformed_records) . " records.\n";

    my @valid_records = $VALIDATOR->run(@transformed_records);
    print "[STAGE 3] Validated " . scalar(@valid_records) . " records.\n";

    # 4. Generate Report
    $REPORTER->generate({
        total_input => scalar(@raw_records),
        total_valid => scalar(@valid_records),
        timestamp => strftime("%Y-%m-%dT%H:%M:%SZ", localtime),
        records => \@valid_records
    });

    print "[DONE] Pipeline execution complete.\n";
}

# --- Submodules (Inlined for single-file execution) ---

package Ingestor;
sub new { bless {}, shift }
sub run {
    my ($self, $file) = @_;
    my @records;
    open my $fh, '<', $file or die "Cannot open $file: $!";
    while (my $line = <$fh>) {
        chomp $line;
        next if $line =~ /^#/ || $line eq ''; # Skip comments and empty lines
        push @records, $line;
    }
    close $fh;
    return @records;
}

package Transformer;
sub new { bless {}, shift }
sub run {
    my ($self, @records) = @_;
    my @transformed;
    for my $rec (@records) {
        # Normalize whitespace and trim
        my $cleaned = $rec;
        $cleaned =~ s/\s+/ /g;
        $cleaned =~ s/^[\s,]+//;
        $cleaned =~ s/[\s,]+$//;
        push @transformed, $cleaned;
    }
    return @transformed;
}

package Validator;
sub new { bless {}, shift }
sub run {
    my ($self, @records) = @_;
    my @valid;
    for my $rec (@records) {
        # Basic validation logic based on schema definitions
        # Assuming comma-separated values for this utility
        my @fields = split /,/, $rec;
        next unless scalar(@fields) == 5; # Matches schema field count
        
        # Validate Type Int (ID)
        next unless $fields[0] =~ /^\d+$/;
        # Validate Type Float (Value)
        next unless $fields[3] =~ /^\d+(\.\d+)?$/;
        
        push @valid, { 
            raw => $rec, 
            fields => \@fields 
        };
    }
    return @valid;
}

package Reporter;
sub new { bless {}, shift }
sub generate {
    my ($self, $data) = @_;
    my $json = "";
    $json .= "{\n";
    $json .= "  \"status\": \"SUCCESS\",\n";
    $json .= "  \"total_input\": " . $data->{total_input} . ",\n";
    $json .= "  \"total_valid\": " . $data->{total_valid} . ",\n";
    $json .= "  \"timestamp\": \"" . $data->{timestamp} . "\",\n";
    $json .= "  \"records\": [\n";
    
    for (my $i = 0; $i < scalar(@{$data->{records}}); $i++) {
        my $rec = $data->{records}[$i];
        $json .= "    { \"raw\": \"" . $rec->{raw} . "\" }";
        $json .= "," if $i < scalar(@{$data->{records}}) - 1;
        $json .= "\n";
    }
    
    $json .= "  ]\n";
    $json .= "}\n";
    
    print $json;
}

# Run
main();
