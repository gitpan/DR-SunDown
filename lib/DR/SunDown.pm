=head1 NAME

DR::SunDown - perl bindings for sundown

=head1 SYNOPSIS

    use DR::SunDown;
    my $markdown = `cat README.markdown`;
    my $html = markdown2html $markdown;

=head1 DESCRIPTION

The library is a perl binding for C-library
L<sundown|https://github.com/vmg/sundown.git>.

=head1 EXPORTS

=head2 markdown2html(TEXT)

Converts markdown text to html.

=head1 AUTHOR

 Dmitry E. Oboukhov <unera@debian.org>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.

=cut

package DR::SunDown;
use Carp ();
use base qw(Exporter);
our $VERSION = '0.01';

our @EXPORT = qw(markdown2html);


require XSLoader;
XSLoader::load('DR::SunDown', $VERSION);
1;

