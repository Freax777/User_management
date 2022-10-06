#!/bin/bash
###########################################
# Script by Freax777 v1			  #
# Le 05/07/2022			          #
###########################################

##Variable##
nom=""
##fin##
######Début##########
while [ -z $nom ] ; do
echo "Identifiant utilisateur souhaité :"
read nom
done
echo -e "\n"
while true ; do
echo -e          " _____ ____  _____    _    __  _______ _____ _____ "
echo 		 "|  ___|  _ \| ____|  / \   \ \/ /___  |___  |___  |"
echo 		 "| |_  | |_) |  _|   / _ \   \  /   / /   / /   / / "
echo 		 "|  _| |  _ <| |___ / ___ \  /  \  / /   / /   / /  "
echo 		 "|_|   |_| \_\_____/_/   \_\/_/\_\/_/   /_/   /_user-script"
echo -e "\n"
echo -e "\n"
echo "Gestion de l'utilisateur : $nom "
echo "----------------------------------------------------------------"
echo " C - Créer le compte utilisateur"
echo " M - Modifier le mot de passe de l'utilisateur"
echo " S - Supprimer le compte de l'utilisateur"
echo " V - Verifier si le compte de l'utilisateur existe"
echo " G - Changer d'utilisateur"
echo -e "\n"
echo " Q - quitter"
echo -e "\n"
echo "Votre choix"
read choix
case $choix in
		C|c)
		echo "Création de l'utilisateur $nom"
		useradd -m  $nom 2>/dev/null
			if [[ $? -eq 0 ]] ; then
			echo "Utilisateur $nom créer"
			else
			echo "Utilisateur $nom existe déjà"
			fi
		echo "Appuyer sur entrer pour continuer"
		;;
	M | m)
		echo "changement de mot de passe de l'utilisateur $nom"
		passwd $nom
		if [[ $? -eq 0 ]] ; then
			echo "Mot de passe de $nom changer"
			fi
		echo "Appuyer sur entrer pour continuer"
		;;
	S | s)
		echo "Supression de l'utilisateur $nom"
		userdel -r $nom  2>/dev/null
			if [[ $? -eq 0 ]] ; then
			echo "Supression de l'utilisateur $nom réussis"
			else
			echo "Supression de l'utilisateur $nom échoué"
			fi
		echo "Appuyer sur entrer pour continuer"
		;;
	V | v)
		echo "L'utilsateur $nom existe t'il ?"
		grep ^$nom: /etc/passwd 1>/dev/null
			if [[ $? -eq 0 ]] ; then
			echo "L'utilisateur $nom existe"
			else
			echo "L'utilisateur $nom existe pas"
			fi
		echo "Appuyer sur entrer pour continuer"
		;;
	Q | q)
		echo "BYE"
		exit
		;;

	G | g)	nom=""
		while [ -z $nom ] ; do
		echo "Changer l'utilisateur :"
		read nom
		echo "Appuyer sur entrer pour continuer"
		done
		;;
	   *)
		echo "Choix incorrect"
		echo "Appuyer sur entrer pour continuer"
		;;
	esac
read
echo "Appuyer sur entrer pour continuer"
clear
done
