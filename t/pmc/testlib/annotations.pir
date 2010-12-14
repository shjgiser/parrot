# Copyright (C) 2009-2010, Parrot Foundation.

# This file is used from Packfile PMCs tests

.sub 'main'
.annotate "file", "annotations.pir"
.annotate "creator", "Parrot Foundation"
.annotate "line", 1
    say "Hi"
    say "line"
.annotate "line", 2
    .return ()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
