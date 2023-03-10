#
# fstrcmp - fuzzy string compare library
# Copyright (C) 2012 Peter Miller
# Written by Peter Miller <pmiller@opensource.org.au>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or (at
# your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
BEGIN {
    prev_was_license = ""
}
/^Upstream-Name: / {
    print "Upstream-Name: fstrcmp"
    next
}
/^Upstream-Contact: / {
    print "Upstream-Contact: Peter Miller <pmiller@opensource.org.au>"
    next
}
/^Source: / {
    print "Source: http://fstrcmp.sourceforge.net/"
    next
}
/^License: / {
    prev_was_license = $2;
    print
    next
}
/^Disclaimer: Autogenerated/ {
    next
}
/^ FIXME$/ {
    if (prev_was_license == "GPL-3+")
    {
        print " On Debian systems, the complete text of the GNU"
        print " General Public License, version 3, can be found in"
        print " /usr/share/common-licenses/GPL-3."
    }
    else if (prev_was_license != "")
    {
        print " The licenses covering these files are unknown."
    }
    else
    {
        print $0
    }
    prev_was_license = ""
    next
}
{
    print
    prev_was_license = ""
}

# vim: set ts=8 sw=4 et :
