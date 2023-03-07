#!/bin/bash
#800616, Beltran Pardos, Miguel, T, 1, A
#806955, Franco , Jan Carlos, T, 1, A

num="[0-9]"
letra="[a-zA-Z]"

echo -n "Introduzca una tecla: "
read -n 1 tecla

echo ""

if [[ $tecla = $num ]]; then
	echo "$tecla es un numero"
elif [[ $tecla = $letra ]]; then
	echo "$tecla es una letra"
else
	echo "$tecla es un caracter especial"
fi