#!/bin/bash
#800616, Beltran Pardos, Miguel, T, 1, A
#806955, Franco , Jan Carlos, T, 1, A

echo -n "Introduzca el nombre de un directorio: "
read dir

if test -d "$dir"; then
	d=$(ls "$dir" -l | grep '^d' | wc -l)
	f=$(ls "$dir" | wc -l)
	fich=$(($f - $d))
	echo "El numero de ficheros y directorios en $dir es de $fich y $d, respectivamente"
else
	echo "$dir no es un directorio"
fi
