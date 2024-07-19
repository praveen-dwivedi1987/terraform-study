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
        stage('terraform init'){
            steps{
                sh '''terraform init'''
            }
            
        }
        stage('terraform plan'){
            when {
                branch comparator: 'REGEXP', pattern: 'feture*'
            }
            steps{
                sh '''terraform plan'''
            }

        }
    }
}