package TextSanitizer;
use strict;
use warnings;

sub new {
    my ($class, $input) = @_;
    my $self = {
        input => $input,
    };
    return bless $self, $class;
}

sub sanitize {
    my ($self) = @_;
    my $text = $self->{input};
    # Remove control characters
    $text =~ s/[\x00-\x1F]//g;
    # Normalize whitespace
    $text =~ s/\s+/ /g;
    $text =~ s/^\s+//;
    $text =~ s/\s+$//;
    return $text;
}

sub sanitize_file {
    my ($self, $file) = @_;
    open(my $fh, '<:encoding(UTF-8)', $file) or die "Could not open file '$file' $!";
    my $text = do { local $/; <$fh> };
    close($fh);
    return $self->new($text)->sanitize();
}

1;
__END__

=head1 NAME

TextSanitizer - Sanitize text data

=head1 SYNOPSIS

  use TextSanitizer;
  my $sanitizer = TextSanitizer->new('Hello World!');
  my $clean_text = $sanitizer->sanitize();

=cut
