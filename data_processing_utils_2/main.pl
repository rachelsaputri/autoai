#!/usr/bin/env perl
use strict;
use warnings;
use lib '.';
use CsvProcessor;
use JsonProcessor;
use TextSanitizer;

sub main {
    my $data_file = $ARGV[0] || 'sample.csv';
    my $output_file = $ARGV[1] || 'output.txt';

    print "Processing data from: $data_file\n";

    my $processor;
    if ($data_file =~ /\.csv$/) {
        $processor = CsvProcessor->new($data_file);
    } elsif ($data_file =~ /\.json$/) {
        $processor = JsonProcessor->new($data_file);
    } else {
        $processor = TextSanitizer->new($data_file);
    }

    my $data = $processor->process();

    # Simple output for demonstration
    open(my $fh, '>', $output_file) or die "Could not open file '$output_file' $!";
    if (ref $data eq 'ARRAY') {
        for my $row (@$data) {
            if (ref $row eq 'ARRAY') {
                print $fh join(',', @$row) . "\n";
            } else {
                print $fh $row . "\n";
            }
        }
    } elsif (ref $data eq 'HASH') {
        use JSON::PP;
        my $json = JSON::PP->new->pretty->canonical;
        print $fh $json->encode($data);
    } else {
        print $fh $data;
    }
    close($fh);

    print "Output written to: $output_file\n";
}

main();

__END__

=head1 NAME

main.pl - Main entry point for data processing utilities

=head1 SYNOPSIS

  perl main.pl [input_file] [output_file]

=cut
