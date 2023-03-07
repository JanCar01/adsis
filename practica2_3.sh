#!/bin/bash
#800616, Beltran Pardos, Miguel, T, 1, A
#806955, Franco , Jan Carlos, T, 1, A

if test "$#" -eq 1; then
	if test -f "$1"; then
		chmod ug+x "$1"
		stat --format='%A' "$1"
	else
		echo "$1 no existe"
	fi
else
	echo "Sintaxis: practica2_3.sh <nombre_archivo>"
fi