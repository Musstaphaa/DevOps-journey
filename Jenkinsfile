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
                echo '🏗️ Building the Docker Image...'
                // 
                sh 'echo "Simulating: docker build -t my-app ."'
            }
        }
        stage('Test Image') { 
            steps {
                echo '✅ Testing the newly built Image...'
                sh 'echo "Simulating: docker run my-app test"'
            }
        }
    }
}
