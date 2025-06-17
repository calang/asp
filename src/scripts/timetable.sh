#!/usr/bin/env bash

# run sap-prim.lp for a first solution
# and show the resulting timetable for each Nivel

# Run from the top level directory:
# $ src/scripts/this_file


# exit on any command failure
# or usage of undefined variable 
# or failure of any command within a pipaline
set -euo pipefail

# ensure this runs under root/sudo
#if [ "$EUID" -ne 0 ]
#	then echo "Please run as root"
#	exit 1
#fi

#set -x

cd src/scripts

clingo ../sap-prim.lp 1 2>/dev/null \
  | grep -E 'SATISFIABLE|asignado' \
  | sed -e '/ /s//\n'/g \
  | sed -e "/SATISFIABLE/s/^/'/" -e "/SATISFIABLE/s/$/'/" \
  | sed -e 's/$/./' \
  >tmp.pl


