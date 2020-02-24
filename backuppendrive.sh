#!/bin/bash

#####################################################
#|||||||||||||||||||||||||||||||||||||||||||||||||||#
#|#Script simples para backup feito por MATEUS DIAS|#
#|||||||||||||||||||||||||||||||||||||||||||||||||||#
#####################################################

loop=1

while [ $loop = 1 ] 
do

	#variaveis configuráveis 
	localbackup="/home/mateus/Área\ de\ trabalho/ETEC" #caminho destino onde os arquivos do pendrive serão sincronizados
	uid="E6AD-E3CD" #uuid do dispositivo(para encontrar do seu dispositivo use lsblk --output UUID,MOUNTPOINT)
	adicionar_pasta="ETEC" #pasta na raiz do pendrive que sera sincronizado 
	tempodeverificacao=250   #(em segundos)


	#variaveis fixas(não mexer)
	verificapendrive=$(lsblk --output UUID,MOUNTPOINT | grep "$uid" | awk '{print $1}') 
	data=$(date)

	#confirmando
	echo "Local do backup: $localbackup"
	echo "UUID: $uid"
	echo "Data: $data"

	#verifica se o pendrive esta conectado
		if [ $verificapendrive = $uid ]
			then

			echo "Pendrive encontrado"


			log+="Backup $data\n"


			mount_point_pendrive=$(lsblk --output UUID,MOUNTPOINT | grep "$uid" | awk '{print $2}') #localiza onde é o ponto de montagem do dispositivo
			caminho=($mount_point_pendrive/$adicionar_pasta) #monta um caminho de acordo com as variaveis mount_point_drive e adicionar_pasta
			
			log+="Alterações:\n"
			sincroniza=$(rsync -ruati  $caminho $localbackup) #faz as sincronização dos arquivos

			echo "Caminho do pendrive: $caminho"
			echo "Começando a sincronização"
				
			

				###########
			log+=$sincroniza 
				###########


			$(rm -rf $localbackup/log.txt)
			echo -e $log >> $localbackup/log.txt

			else

			echo "Pendrive não encontrado"


		fi 

	sleep $tempodeverificacao


done