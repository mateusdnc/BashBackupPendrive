#!/bin/bash


#####################################################
#|||||||||||||||||||||||||||||||||||||||||||||||||||#
#|#Script simples para backup feito por MATEUS DIAS|#
#|||||||||||||||||||||||||||||||||||||||||||||||||||#
#####################################################


loop=1

while [ $loop = 1 ] 
do

#variaveis
localbackup="/home/mateus/ETEC/" #local onde os arquivos do pendrive serão sincronizados
uid="184F39D627BEE814" #uuid do dispositivo
comando=$(lsblk --output UUID,MOUNTPOINT | grep "$uid" | awk '{print $1}') 
adicionar_pasta="ETEC" #pasta na raiz do pendrive que sera sincronizado 
tempodeverificacao=150   #(em segundos)


#confirmando
echo "Local do backup: $localbackup"
echo "UUID: $uid"

#verifica se o pendrive esta conectado
if [ $comando = $uid ]
then

echo "Pendrive encontrado"
$(notify-send "Pendrive encontrado")

mount_point_pendrive=$(lsblk --output UUID,MOUNTPOINT | grep "$uid" | awk '{print $2}')
caminho=$mount_point_pendrive/$adicionar_pasta/*

echo "Caminho do pendrive: $caminho"
echo "Começando a sincronização"
$(notify-send "Começando a sincronização")

rsync -uahvP $caminho $localbackup #sincroniza arquivos do pendrive a pasta backup selecionada

$(notify-send "Sincronização finalizada")

sleep $tempodeverificacao

else

echo "Pendrive não encontrado"

sleep $tempodeverificacao
fi

done


