#!/bin/sh

inp_file=$1

echo -e "Remove HTML tags (src $inp_file)\n"

sed -e '
s/<[^>]*>//g
/^[^.]/d
s/^\.[A-Z]*/&:/g
s/country-code/&:/g
s/sponsored/&:/g
s/infrastructure/&:/g
s/generic-restricted\|generic/&:/g
/^.:/d
s/^.//g
/^$/d
' $inp_file > top-level.domains
