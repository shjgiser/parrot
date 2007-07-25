#! perl
# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

=head1 NAME

tools/build/pbcversion_h.pl - Create pbcversion.h

=head1 SYNOPSIS

    % perl tools/build/pbcversion_h.pl > include/parrot/pbcversion.h

=head1 DESCRIPTION

The F<PBC_COMPAT> file is used to maintain Parrot bytecode compatability. This
script extracts the latest major and minor bytecode version numbers and places
them in a header file.

=cut

use warnings;
use strict;
use lib 'lib';

my ($major, $minor);

my $compat_file = 'PBC_COMPAT';
open my $IN, '<', $compat_file or die "Can't read $compat_file";
while (<$IN>) {
    if (/^(\d+)\.(\d+)/) {
        ($major, $minor) = ($1, $2);
        last;
    }
}
close $IN;

unless (defined $major && defined $minor) {
    die "No bytecode version found in '$compat_file'.";
}


print << "EOF";
/* ex: set ro:
 * !!!!!!!   DO NOT EDIT THIS FILE   !!!!!!!
 *
 * This file is generated automatically from '$compat_file'
 * by $0.
 *
 * Any changes made here will be lost!
 *
 */

#define PARROT_PBC_MAJOR $major
#define PARROT_PBC_MINOR $minor

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
EOF

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
