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
                sh ''' cd my-network'''
            }
        }
        stage('terraform init'){
            steps{
                sh '''terraform init'''
            }
            
        }
        stage('terraform plan'){
            when {
                branch 'feture-*'
            }
            steps{
                sh '''                
                terraform plan
                '''
            }

        }
    }
    post { 
        always { 
            cleanWs()
        }
    }
}