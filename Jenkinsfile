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
    }
}