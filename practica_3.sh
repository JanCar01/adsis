#!/bin/bash
#800616, Beltran Pardos, Miguel, T, 1, A
#806955, Franco , Jan Carlos, T, 1, A

if [ $EUID -eq 0 ]
then
    if test "$#" -eq 2
    then
        if test "$1" = "-a" #crear usuarios
        then
            while IFS=, read -r nom con nomC
            do
                if id -u "$nom" &>/dev/null
                then
                    echo "El usuario $nom ya existe"
                else
                    if [ -n "$nom" -a -n  "$con" -a -n "$nomC" ]
                    then
                        useradd -U -m -k /etc/skel -K UID_MIN=1815 -K PASS_MAX_DAYS=30 -c "$nomC" "$nom"
                        echo  "$nom":"$con" | chpasswd
                        usermod -c "$nom" "$nomC"
                        echo "$nomC ha sido creado"
                    else
                        echo "Campo invalido"
                    fi
                fi
            done < "$2"
        elif test "$1" = "-s" #borrar usuarios
        then
            if ! test -d "/extra"
            then
                mkdir /extra
                mkdir /extra/backup
            elif ! test -d "/extra/backup"
            then
                mkdir /extra/backup
            fi
            while IFS=, read -r nom con nomC
            do
                if id -u "$nom" &>/dev/null
                then
					HOME_=$( cat /etc/passwd | grep "^$nom:" | cut -d ":" -f 6 )
                    if tar -czf /extra/backup/"$nom".tar -P "$HOME_"
                    then
						userdel -r -f "$nom" &>/dev/null
                    fi
                fi
            done < "$2"
        else
            echo "Opcion invalida" 1>&2
        fi
    else
        echo "Numero incorrecto de parametros"
    fi
    exit 0
else   
    echo "Este script necesita privilegios de administracion"
    exit 1
fi