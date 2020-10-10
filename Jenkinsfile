// working example, as configured in the pipeline settings of the project

pipeline {

    agent none

    environment {
        registry = 'ims-19/ims-19'
        dockerImage = ''
        CI = 'true' 
    }
    stages {
        
        stage('Clone') {
            agent any
            steps {
                git 'https://github.com/ims-19/react-sample.git'
            }
        } 
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
            agent any
            steps {
                sh 'echo hallo'
                script {
                    dockerImage = docker.build(registry + ":$BUILD_NUMBER")
                }
            }
        }
    }
}