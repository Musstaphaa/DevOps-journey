pipeline {
    agent any 
    
    stages {
        stage('Checkout') {
            steps {
                echo '📥 Pulling Code from GitHub...'
                checkout scm
            }
        }
        stage('Build Docker Image') { 
            steps {
                echo '🏗️ Building the real Docker Image...'
                // Go to folder contined the Dockerfile
                dir('04-CI-CD-Jenkins') {
                    sh 'docker build -t my-automated-website .'
                }
            }
        }
        stage('Deploy App') { 
            steps {
                echo '🚀 Deploying the App to Port 8081...'
                // remove any other container 
                sh 'docker rm -f running-website || true'
                // start the real website
                sh 'docker run -d -p 8081:80 --name running-website my-automated-website'
            }
        }
    }
}
