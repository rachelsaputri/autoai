package CsvProcessor;
use strict;
use warnings;
use Text::CSV;

sub new {
    my ($class, $file) = @_;
    my $self = {
        file => $file,
        csv  => Text::CSV->new({ binary => 1, auto_diag => 1 }),
    };
    return bless $self, $class;
}

sub process {
    my ($self) = @_;
    my $csv = $self->{csv};
    my $file = $self->{file};

    open(my $fh, '<:encoding(UTF-8)', $file) or die "Could not open file '$file' $!";
    my $data = [];
    while (my $row = $csv->getline($fh)) {
        push @$data, $row;
    }
    close($fh);
    return $data;
}

1;
__END__

=head1 NAME

CsvProcessor - Process CSV files

=head1 SYNOPSIS

  use CsvProcessor;
  my $proc = CsvProcessor->new('data.csv');
  my $data = $proc->process();

=cut
