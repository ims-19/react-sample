pipeline {
    agent {
        docker {
            image 'node:13.12.0-alpine'
        }
    }
    environment {
        CI = 'true' 
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') { 
            steps {
                sh 'npm test' 
            }
        }
    }
}