#!/bin/bash

HORARIO=$(date +"%d-%m-%y %H:%M")
LOG="/var/log/teste_aws.log"

if ! [ -f "$LOG" ]
then
	touch $LOG
fi

aws_dns=$(cat terraform/aws_dns.txt)
echo -e "\n######################################" >> $LOG
echo -e  "# Teste | $HORARIO  #" >> $LOG
echo -e  "#####################################\n" >> $LOG

echo "$aws" >> $LOG

SERVICE_PORT=8080

echo "Realizando teste de conectividade..." >> $LOG
ping -qc5 $aws_dns >> $LOG

#Verifica se a instancia AWS está UP
echo

if ! ping -qc2 $aws_dns > /dev/null; then
	echo -e "$aws_dns: Status da instancia EC2 -> \033[0;31mOFFLINE\033[0m" >> $LOG
	echo "O teste de conectividade falhou, verifique sua instancia!" >> $LOG
	exit
else 
	echo -e "$aws_dns: Status da instancia EC2 -> \033[0;32mONLINE\033[0m" >> $LOG
fi

echo "Realizando teste de requisição (HTTP GET)" >> $LOG
sleep 1
#Envia uma requisição HTTP GET para o APP

STATUS_CODE=$(curl --write-out %{http_code} --silent --output /dev/null $aws_dns:$SERVICE_PORT) >> $LOG

echo "$STATUS_CODE" >> $LOG

#Verifica se a resposta do HTTP GET é igual a 200, caso verdadeiro a requisiço foi um sucesso.
if [ $STATUS_CODE -eq 200 ]; then
	echo -e "Teste de requisição....\033[0;32mOK\033[0m :: $(date +%F\ %T)" >> $LOG
	echo "URL da aplicação http://$aws_dns:$SERVICE_PORT" $LOG
else
	echo -e "Teste de requisição... \033[0;31mFAIL\033[0m :: $(date +%F\ %T)" >>$LOG
	echo "Teste de requisição falhou, verifique o log de deploy da aplicação!" >>$LOG
fi
