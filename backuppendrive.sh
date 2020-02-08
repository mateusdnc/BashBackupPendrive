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
localbackup="/home/mateus/ETEC/" #caminho destino onde os arquivos do pendrive serão sincronizados
uid="6BF22295348BDB4B" #uuid do dispositivo(para encontrar do seu dispositivo use lsblk --output UUID,MOUNTPOINT)
adicionar_pasta="ETEC" #pasta na raiz do pendrive que sera sincronizado 
tempodeverificacao=250   #(em segundos)
notificacoes= false #true = com notificações,false = o script não enviara notificações.
repetirnotificacao = false #verifica se é pra repetir notificações ou avisar apenas um vez
repetir= 0


#variaveis fixas(não mexer)
verificapendrive=$(lsblk --output UUID,MOUNTPOINT | grep "$uid" | awk '{print $1}') 

#confirmando
echo "Local do backup: $localbackup"
echo "UUID: $uid"

#verifica se o pendrive esta conectado
if [ $verificapendrive = $uid ]
then

	echo "Pendrive encontrado"


	if [ $notificacoes = true ] #verifica se as notificações estão ativadas,se estiver,envia notificações
	then
	
	$(notify-send "Pendrive encontrado")

	if [ $repetirnotificacao = true ]
	then
	$repetir = 1
	fi

	fi 


	mount_point_pendrive=$(lsblk --output UUID,MOUNTPOINT | grep "$uid" |  	mount_point_pendrive=$(lsblk --output UUID,MOUNTPOINT | grep "$uid" | awk '{print $2}') #localiza onde é o ponto de montagem do dispositivo 	) #localiza onde é o ponto de montagem do dispositivo
	caminho=$mount_point_pendrive/$adicionar_pasta/* #monta um caminho de acordo com as variaveis mount_point_drive e adicionar_pasta
	sincroniza=$(rsync -uahivP --delete $caminho $localbackup) #faz as sincronização dos arquivos

	echo "Caminho do pendrive: $caminho"
	echo "Começando a sincronização"
		
	if [ $notificacoes = true ] #verifica se as notificações estão ativadas,se estiver,envia notificações
	then

	if [ $repetir = 1 ]
	then
	$(notify-send "Começando a sincronização")
	fi

	fi

		###########
		$sincroniza 
		###########


	if [ $notificacoes = true ]
	then

	if [ $repetir = 1 ]
	then
	$(notify-send "Backup Sincronizado")
	fi 
	fi

	if [ $notificacoes = true ] #verifica se as notificações estão ativadas,se estiver,envia notificações
	then
	if [ $repetir = 1 ]
	then
	$(notify-send "Sincronização finalizada")
	fi 
	fi

sleep $tempodeverificacao

else

echo "Pendrive não encontrado"

sleep $tempodeverificacao

fi 

done