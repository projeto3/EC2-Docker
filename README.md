# Pojeto Integrador III
# Pipeline de entrega continua de infraestrutura na AWS.
Repositório da disciplina projeto integrador III.

Neste repositorio conterá os arquivos e procedimentos necessários para cria um pipeline de entrega continua de uma infraestrutura utilizando as tecnologias Github, Jenkins, Terraform, Ansible, Shell Script, Docker,Docker-compose e Amazon Web Services.

Listagem de diretórios e arquivos:
		
	Ansible - Arquivos e procedimentos para a gestão de configuração do ambiente.
	Docker - Arquivos e procedimentos para deploy da aplicação com docker e docker-compose.
	Terraform - Arquivos e procedimentos para deploy da infraestrutura na AWS.
  	Jenkinsfile - Arquivo que contém a definição do pipeline Jenkins.
	teste.sh - Arquivo em Shell Script reponsável por realizar testes no ambiente.

Procedimeto para configuração do ambiente
	
	Instale um servidor jenkins - mais informação sobre a instalação (https://jenkins.io/doc/).
	Tenha uma conta na AWS - mais informações de como criar uma conta (https://aws.amazon.com/).
	--Faça download deste projeto (git clone https://github.com/andersonfariiass/projeto_2.git)
	--Dentro do diretório projeto_2/ crie a seguinte estrutura de diretórios:
	--	- docker/
	--	   - mysql/ - Diretório onde será armazenado a base de dados do mysql
	--	   - www/html/ - Diretório onde será armazenado os arquivos da aplicação
	--Dentro do diretório raiz (projeto_2/) execute o comando - vagrant up
	--Para acessar a vm digite o comando: vagrant ssh

Executando os procedimentos acima,será criado uma instancia EC2 na AWS.

Para acessar a aplicação que foi utilizada para teste:
	
	Acesse o endereço http://endereço_publico_da_instancia_ec2:8080 (este app executa um arquivo index.php que conecta ao banco, insere dados e exibe os dados no browser).
	Usando o MySQL Workbench para acessar o banco:
		IP: IP_PUBLICO_DA_EC2
		user: docker
		senha: docker
		porta: 3306

