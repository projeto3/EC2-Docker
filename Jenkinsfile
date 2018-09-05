//Declarative Pipeline

pipeline {

    agent any

    stages {
       
        stage('Base de Código') {

            steps {

                
                echo 'Origem e Versão do codigo..'

            }

        }
         stage('Config') {

            steps {
                dir('terraform/') {
                    sh 'cp /var/lib/jenkins/workspace/provider.tf .'
                sh "sudo terraform init"
                }
                echo 'Configuring..'

            }


        }
        stage('Criando Instancia') {
                        steps {
                    dir('terraform/') {
                    sh "sudo terraform apply -auto-approve"
                        //sh "pwd"
                        sh 'aws_dns=$(terraform output aws_dns)'
                        sh 'echo "$aws_dns"'
                    }
                    echo 'Criando Instancia..'
            }
        
        }

    

    }

}
