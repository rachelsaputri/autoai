package JsonProcessor;
use strict;
use warnings;
use JSON::PP;

sub new {
    my ($class, $file) = @_;
    my $self = {
        file => $file,
        json => JSON::PP->new->utf8->canonical,
    };
    return bless $self, $class;
}

sub process {
    my ($self) = @_;
    my $json = $self->{json};
    my $file = $self->{file};

    open(my $fh, '<:encoding(UTF-8)', $file) or die "Could not open file '$file' $!";
    local $/;
    my $content = <$fh>;
    close($fh);
    my $data = $json->decode($content);
    return $data;
}

1;
__END__

=head1 NAME

JsonProcessor - Process JSON files

=head1 SYNOPSIS

  use JsonProcessor;
  my $proc = JsonProcessor->new('data.json');
  my $data = $proc->process();

=cut
