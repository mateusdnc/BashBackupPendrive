#!/bin/bash


#####################################################
#|||||||||||||||||||||||||||||||||||||||||||||||||||#
#|#Script simples para backup feito por MATEUS DIAS|#
#|||||||||||||||||||||||||||||||||||||||||||||||||||#
#####################################################


loop=1

while [ $loop = 1 ] 
do

<<<<<<< HEAD

=======
<<<<<<< HEAD
>>>>>>> notificações otimizadas
#variaveis configuráveis 
localbackup="/home/mateus/ETEC/" #local onde os arquivos do pendrive serão sincronizados
uid="184F39D627BEE814" #uuid do dispositivo
adicionar_pasta="ETEC" #pasta na raiz do pendrive que sera sincronizado 
<<<<<<< HEAD
tempoicacao=250   #(em segundos)
notificacoes= true #deveriftrue = com notificações,false = o script não enviara notificações.
=======
tempodeverificacao=250   #(em segundos)
notificacoes= true #true = com notificações,false = o script não enviara notificações.
>>>>>>> notificações otimizadas


#variaveis fixas(não mexer)
verificapendrive=$(lsblk --output UUID,MOUNTPOINT | grep "$uid" | awk '{print $1}') 
<<<<<<< HEAD
=======
=======
#variaveis
localbackup="/home/mateus/ETEC/" #local onde os arquivos do pendrive serão sincronizados
uid="184F39D627BEE814" #uuid do dispositivo
comando=$(lsblk --output UUID,MOUNTPOINT | grep "$uid" | awk '{print $1}') 
adicionar_pasta="ETEC" #pasta na raiz do pendrive que sera sincronizado 
tempodeverificacao=150   #(em segundos)
>>>>>>> 30ccf38a1e65fd1a9e9cfcd57ea6a0c7173c489d
>>>>>>> notificações otimizadas


#confirmando
echo "Local do backup: $localbackup"
echo "UUID: $uid"

#verifica se o pendrive esta conectado
if [ $verificapendrive = $uid ]
then

echo "Pendrive encontrado"
$(notify-send "Pendrive encontrado")

<<<<<<< HEAD
=======
<<<<<<< HEAD

>>>>>>> notificações otimizadas

#verifica se as notificações estão ativadas
	if [ $notificacoes = true ]
	then
	$(notify-send "Pendrive encontrado")
	fi 


mount_point_pendrive=$(lsblk --output UUID,MOUNTPOINT | grep "$uid" | awk '{print $2}') #localiza onde é o ponto de montagem do dispositivo
caminho=$mount_point_pendrive/$adicionar_pasta/* #monta um caminho de acordo com as variaveis mount_point_drive e adicionar_pasta
sincroniza=$(rsync -uahivP --delete $caminho $localbackup)


<<<<<<< HEAD



=======
#informa o caminho do pendrive
=======
mount_point_pendrive=$(lsblk --output UUID,MOUNTPOINT | grep "$uid" | awk '{print $2}')
caminho=$mount_point_pendrive/$adicionar_pasta/*

>>>>>>> 30ccf38a1e65fd1a9e9cfcd57ea6a0c7173c489d
echo "Caminho do pendrive: $caminho"
echo "Começando a sincronização"
$(notify-send "Começando a sincronização")

<<<<<<< HEAD
>>>>>>> notificações otimizadas
		if [ $notificacoes = true ]
		then
		$(notify-send "Backup Sincronizado")
		fi 
<<<<<<< HEAD

=======
=======
rsync -uahvP $caminho $localbackup #sincroniza arquivos do pendrive a pasta backup selecionada

$(notify-send "Sincronização finalizada")
>>>>>>> 30ccf38a1e65fd1a9e9cfcd57ea6a0c7173c489d
>>>>>>> notificações otimizadas

sleep $tempodeverificacao

else

echo "Pendrive não encontrado"

sleep $tempodeverificacao

fi 

done


