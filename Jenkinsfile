pipeline {
    agent any
    
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
        IMAGE_NAME = 'musstapha1/nanobanana-app'
        IMAGE_TAG = 'v2.0'
    }
    
    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                dir('08-Final-Project') {
                    sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
                }
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh 'docker push $IMAGE_NAME:$IMAGE_TAG'
            }
        }
        
        stage('Deploy to EKS (CD)') {
            steps {
                // 1. Connect to the new servers
                sh 'aws eks update-kubeconfig --region us-east-1 --name nanobanana-cluster'
                
                dir('08-Final-Project/kubernetes-manifests') {
                    // 2. update the Yaml file automatic
                    sh "sed -i 's|image: .*|image: ${IMAGE_NAME}:${IMAGE_TAG}|g' app-deploy.yaml"
                    
                    // 3. upload the update on kubernetes
                    sh 'kubectl apply -f db-deploy.yaml'
                    sh 'kubectl apply -f app-deploy.yaml'
                }
            }
        }
    }
}
