// working example, as configured in the pipeline settings of the project

pipeline {

    agent none

    environment {
        registry = 'ims19/secure_devops'
        dockerImage = ''
        registryCredentials = 'docker-hub'
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
            steps {
                script {
                    dockerImage = docker.build(registry + ":$BUILD_NUMBER")
                }
            }
        }
        stage('Publish image') {
            steps {
                script {
                    docker.withRegistry('', registryCredentials) {
                        dockerImage.push()
                        dockerImage.push("latest")
                    }
                }
            }
        }
    }
}