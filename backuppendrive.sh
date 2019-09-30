#!/bin/bash


##Script simples para backup feito por MATEUS DIAS


#LOG=/var/log/backuppendrive.log
#exec 1>>${LOG}
#exec 2>&1

#echo > /var/log/backuppendrive.log
#date > /var/log/backuppendrive.log

loop=1

while [ $loop = 1 ] 
do

#variaveis
localbackup="/home/mateus/ETEC/"
uid="184F39D627BEE814"
comando=$(lsblk --output UUID,MOUNTPOINT | grep "$uid" | awk '{print $1}')
tempodeverificacao=150   #(em segundos)


#confirmando
echo "Local do backup: $localbackup"
echo "UUID: $uid"

#verifica se o pendrive esta conectado
if [ $comando = $uid ]
then
echo "Pendrive encontrado"

mount_point_pendrive=$(lsblk --output UUID,MOUNTPOINT | grep "$uid" | awk '{print $2}')
caminho=$mount_point_pendrive/ETEC/*
echo "Caminho do pendrive: $caminho"

echo "Começando a sincronização"

rsync -uahvP $caminho $localbackup

sleep $tempodeverificacao
else
echo "Pendrive não encontrado"
sleep $tempodeverificacao
fi

done


