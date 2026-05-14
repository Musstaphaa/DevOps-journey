pipeline {
    agent any 
    
    environment {
        // here we're pointing the credentials 
        // jenkins will creat two variables DOCKER_HUB__USR & DOCKER_HUB_PSW
        DOCKER_HUB_CREDS = credentials('dockerhub-creds')
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo '📥 Pulling Code from GitHub...'
                checkout scm
            }
        }

        stage('Build Docker Image') { 
            steps {
                echo '🏗️ Building the Docker Image...'
                dir('04-CI-CD-Jenkins') {
                    // will name the docker hub with the username 
                    sh "docker build -t ${DOCKER_HUB_CREDS_USR}/my-automated-website:latest ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                echo '📤 Logging in and Pushing to Docker Hub...'
                // will recalling the value of the varialbe in this case the username and password to login 
                sh "echo ${DOCKER_HUB_CREDS_PSW} | docker login -u ${DOCKER_HUB_CREDS_USR} --password-stdin"
                sh "docker push ${DOCKER_HUB_CREDS_USR}/my-automated-website:latest"
            }
        }

        stage('Deploy App Locally') { 
            steps {
                echo '🚀 Running the container locally for testing...'
                sh 'docker rm -f running-website || true'
                sh "docker run -d -p 8081:80 --name running-website ${DOCKER_HUB_CREDS_USR}/my-automated-website:latest"
            }
        }
    }
}
