pipeline {
    agent {label 'terraform-agent'}

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage('terraform check') {
            steps {
                sh '''terraform version'''
            }
        }

        stage('change directory'){
            steps{
                sh ''' cd my-network 
                ls -lhrt '''
            }
        }
        stage('terraform init'){
            steps{
                dir('my-network'){
                    sh '''
                    pwd
                    terraform init
                    '''
                }
                
            }
            
        }
        stage('terraform plan'){
            when {
                anyOf{
                    branch 'PR-*'
                    branch 'feture-*'
                }
            }
            steps{
                dir('my-network'){
                    sh '''                             
                    terraform plan
                    '''
                }
            }

        }

        stage('terraform apply'){
            when{
                branch 'main'
            }
            steps{
                dir('my-network'){
                    sh '''
                    terraform apply -auto-approve
                    '''
                }
            }
        }
    }
    post { 
        always { 
            cleanWs()
        }
    }
}