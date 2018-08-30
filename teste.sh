#!/bin/bash
URL="http://www.google.com"
SERVICE_PORT=8080

echo "Realizando teste de conectividade..."

#Verifica se a instancia AWS está UP
#Falta - Verificar como pega a URL da instancia via terraform e salvar em variavel...
#ping -qc5 $URL > /dev/null

echo

if ! ping -qc2 $URL > /dev/null; then
	echo -e "$URL: Status -> \033[0;31mOFFLINE\033[0m"
	echo "O teste de conectividade falhou, verifique sua instancia AWS!"
	exit
else 
	echo -e "$URL: Status -> \033[0;32ONLINE\033[0m"
fi

echo "Realizando teste de requisição (HTTP GET)"
sleep 1
#Envia uma requisição HTTP GET para o APP

STATUS_CODE=$(curl --write-out %{http_code} --silent --output /dev/null $URL:$SERVICE_PORT)

#Verifica se a resposta do HTTP GET é igual a 200, caso verdadeiro a requisiço foi um sucesso.
if [ $STATUS_CODE -eq 200 ]; then
	echo -e "Teste de requisição....\033[0;32mOK\033[0m :: $(date +%F\ %T)"
	echo "URL da aplicação http://$URL:$SERVICE_PORT"
else
	echo -e "Teste de requisição... \033[0;31mFAIL\033[0m :: $(date +%F\ %T)"
	echo "Teste de requisição falhou, verifique o log de deploy da aplicação!"
fi
