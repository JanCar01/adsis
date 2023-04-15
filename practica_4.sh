#!/bin/bash
#800616, Beltran Pardos, Miguel, T, 1, A
#806955, Franco, Jan Carlos, T, 1, A

users="$2"
ips="$3"

if [ "$#" -ne 3 ]
then
	exit 1
fi

while IFS='' read -r h || [[ -n "$h" ]]
do
	if ping -c 1 -W 2 "$h"
	then	      
		scp -q -i $HOME/.ssh/id_as_ed25519 "../practica_3/practica_3.sh" as@$h:
		scp -q -i $HOME/.ssh/id_as_ed25519 $users as@$h:
		scp -q -i $HOME/.ssh/id_as_ed25519 $ips as@$h:
		ssh -n -i $HOME/.ssh/id_as_ed25519 as@"$h" chmod u+x '$HOME'/practica_3.sh 
		ssh -n -i $HOME/.ssh/id_as_ed25519 as@"$h" sudo '$HOME'/practica_3.sh $1 '$HOME'/$users
		ssh -n -i $HOME/.ssh/id_as_ed25519 as@"$h" rm -r '$HOME'/practica_3.sh '$HOME'/$users '$HOME'/$ips
		
	else
		echo "$h no es accesible"
	fi
done < "$ips"
