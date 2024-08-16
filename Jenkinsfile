pipeline {
    agent any
    environment {
        IMAGE_NAME = 'giangnht19/backend'
        IMAGE_TAG = 'latest'
        APP_NAME = 'backend'
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building the app'

                bat 'npm install'
                bat 'docker build -t %IMAGE_NAME%:%IMAGE_TAG% .'
            }
        }
        stage ('Deploy') {
            steps {
                echo 'Deploying to Docker Hub'

                withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                    bat 'docker login -u giangnht19 -p %dockerhubpwd%'
                    // bat 'docker stop backend'
                    // bat 'docker rm backend'
                    bat 'docker run -d --name backend -p 4000:4000 %IMAGE_NAME%:%IMAGE_TAG%'
                }
            }
        }
    }
    post {
        always {
            echo 'Cleaning up'
            bat 'docker system prune -f'
            bat 'docker logout'
            echo 'Build completed'
        }
    }
}