//Declarative Pipeline

pipeline {
    agent any
    stages {
                    stage('Codigo') {
                        steps {
                             parallel(
                                   Informacoes_da_build: {
                                           sh 'echo "BUILD_DISPLAY_NAME" :: $BUILD_DISPLAY_NAME'
                                           sh 'echo "NODE_LABELS" :: $NODE_LABELS'
                                           sh 'echo "GIT_COMMIT" :: $GIT_COMMIT'
                                           sh 'echo "BUILD_TAG" :: $BUILD_TAG'
                                           sh 'echo "GIT_BRANCH" :: $GIT_BRANCH'
                                           sh 'echo "GIT_AUTHOR_NAME" :: $GIT_AUTHOR_NAME'
                                    },
                                    
                                    Copiando_git:{
                       // sh "sudo terraform apply -auto-approve"
                                     git url: 'https://github.com/projeto3/EC2-Docker.git'

                                            }
                                   
                                     )
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
                        sh 'terraform output aws_dns > aws_dns.txt'
                    }
                    echo 'Criando Instancia...'
            }
        
        }
        
    stage('Deploy') {

            steps {
                ansible-playbook -i /terraform/aws_dns.txt -u ec2-user --private-key=   /~/projeto3/ansible/compose.yml
                echo 'Deploying....'
            }
        }
        
         stage('Test') {

            steps {
                 sh 'sudo chmod +x teste.sh'
                 sh './teste.sh'
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
