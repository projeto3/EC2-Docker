//Declarative Pipeline

pipeline {

    agent any

    stages {
       
        stage('Base de Código') {

            steps {

               sh 'echo "BUILD_DISPLAY_NAME" :: $BUILD_DISPLAY_NAME'
               sh 'echo "NODE_LABELS" :: $NODE_LABELS'
               sh 'echo "GIT_COMMIT" :: $GIT_COMMIT'
               sh 'echo "BUILD_TAG" :: $BUILD_TAG'
               sh 'echo "GIT_BRANCH" :: $GIT_BRANCH'
               sh 'echo "GIT_AUTHOR_NAME" :: $GIT_AUTHOR_NAME'
                
                git url: 'https://github.com/projeto3/EC2-Docker.git'
                
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
}
