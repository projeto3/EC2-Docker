# Pojeto Integrador III
# Pipeline de entrega continua de infraestrutura na AWS.
Repositório da disciplina projeto integrador III.

Neste repositorio conterá os arquivos e procedimentos necessários para cria um pipeline de entrega continua de uma ambiente de infraestrutura utilizando as tecnologias Github, Jenkins, Terraform, Ansible, Shell Script, Docker e Amazon Web Services.

Listagem de diretórios e arquivos:
		
	Ansible - Arquivos e procedimentos para a configuração do ambiente.
	Docker - Arquivos e procedimentos para deploy do ambeinte com docker e docker-compose.
	Terraform - Arquivos e procedimentos para deploy da infraestrutura na AWS.
  Jenkinsfile - Arquivo que contém a definição de um pipeline Jenkins.

Procedimeto para configuração do ambiente
	
	Faça download e instalação do vagrant no site oficial https://www.vagrantup.com/downloads.html
	Faça download e instalação do VirtualBox
	Faça download deste projeto (git clone https://github.com/andersonfariiass/projeto_2.git)
	Dentro do diretório projeto_2/ crie a seguinte estrutura de diretórios:
		- docker/
		   - mysql/ - Diretório onde será armazenado a base de dados do mysql
		   - www/html/ - Diretório onde será armazenado os arquivos da aplicação
	Dentro do diretório raiz (projeto_2/) execute o comando - vagrant up
	Para acessar a vm digite o comando: vagrant ssh

Executando os procedimentos acima,será criado no VirtualBox uma VM:
	
	docker_p2: 192.168.50.10

Para acessar a aplicação que foi utilizada para teste:
	
	Acesse o endereço http://192.168.50.10:8080 (este app executa um arquivo index.php que conecta ao banco, insere dados e exibe os dados no browser).
	Usando o MySQL Workbench para acessar o banco:
		IP: 192.168.50.10
		user: docker
		senha: docker
		porta: 3306

