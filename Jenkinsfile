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
                        sh 'terraform output aws_dns > aws_dns.txt'
                        sh 'cat aws_dns.txt'
                    }
                    echo 'Criando Instancia..'
            }
        
        }
    stage('Deploy') {

            steps {

                echo 'Deploying....'

            }

        }
        
         stage('Test') {

            steps {
               
                 echo 'Testing..'

             }

         }
         stage('Confirm Deploy Prod?') {

            steps {
                    script {
                        // capture the approval details in approvalMap.
                        approvalMap = input id: 'test', message: 'Hello', ok: 'Proceed?',
                        parameters: [choice(choices: 'Dev\nProd', description: 'Select Ambiente', name: 'Build'), string(defaultValue: '', description: '', name: 'Descrição')],  submitterParameter: 'APPROVER'
                    
                }

            }

        }
             stage('Destroy') {

            steps {
                dir('terraform/') {
                sh "sudo terraform destroy -force"
                }
                echo 'apagando repo....'

            }

        }

    

    }

}
