//Declarative Pipeline

pipeline {

    agent any

    stages {
       
        stage('Build') {

            steps {
   
                git url: 'https://github.com/projeto3/EC2-Docker.git'
                
                echo 'Building. .'

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
                    sh 'export aws_dns=$("terraform output aws_dns")'
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
           // Elvis ira analisar condição     def userInput = false
            timeout(60) {                // timeout waiting for input after 60 minutes
                    script {
                        // capture the approval details in approvalMap.
                        approvalMap = input id: 'test', message: 'Hello', ok: 'Proceed?',
                        parameters: [choice(choices: 'Dev\nProd', description: 'Select Ambiente', name: 'Build'), string(defaultValue: '', description: '', name: 'Descrição')],  submitterParameter: 'APPROVER'
                    }
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
