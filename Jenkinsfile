pipeline {

    environment {
        registry = 'ims-19/ims-19'
        dockerImage = ''
    }

    agent none
    environment {
        CI = 'true' 
    }
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'node:13.12.0-alpine'
                }
            }
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            agent {
                docker {
                    image 'node:13.12.0-alpine'
                }
            }
            steps {
                sh 'npm test' 
            }
        }
        stage('Build image') {
            dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
    }
}