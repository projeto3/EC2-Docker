//Declarative Pipeline

pipeline {

    agent any

    stages {
       
        stage('Build') {

            steps {
   
                git url: 'https://github.com/projeto3/EC2-Docker.git'
                
                echo 'Building..'

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
                    }
                    echo 'Criando Instancia..'

            }
        
        }

        stage('Test') {

            steps {

                echo 'Testing..'

            }

        }

        stage('Deploy') {

            steps {

                echo 'Deploying....'

            }

        }
                stage('Destroy') {

            steps {
                dir('terraform/') {
                sh "pwd"
                }
                echo 'apagando repo....'

            }

        }

    }

}
