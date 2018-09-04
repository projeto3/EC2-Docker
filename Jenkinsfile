//Declarative Pipeline

pipeline {

    agent any

    stages {
       
        stage('Build') {

            steps {
                echo "BUILD_NUMBER" :: $BUILD_NUMBER
                echo "BUILD_ID" :: $BUILD_ID
                echo "BUILD_DISPLAY_NAME" :: $BUILD_DISPLAY_NAME
                echo "JOB_NAME" :: $JOB_NAME
                echo "JOB_BASE_NAME" :: $JOB_BASE_NAME
                echo "BUILD_TAG" :: $BUILD_TAG
                echo "EXECUTOR_NUMBER" :: $EXECUTOR_NUMBER
                echo "NODE_NAME" :: $NODE_NAME
                echo "NODE_LABELS" :: $NODE_LABELS
                echo "WORKSPACE" :: $WORKSPACE
                echo "JENKINS_HOME" :: $JENKINS_HOME
                echo "JENKINS_URL" :: $JENKINS_URL
                echo "BUILD_URL" ::$BUILD_URL
                echo "JOB_URL" :: $JOB_URL
   
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
