pipeline {
    agent any
    stages {
       stage('Git-Checkout') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'develop', url: 'https://github.com/shiv420/website.git'

               
            }
            post {
               success {
                   echo 'Checkout successfull.'
               }
            }
        }
        stage('Docker-Build') {
            steps {
                // Get some code from a GitHub repository
                sh 'docker build --tag phillip420/web:v1.0 --file Dockerfile .'

               
            }
            post {
               success {
                   echo 'Docker image created'
                   sh 'docker image ls'
                   sh 'docker rmi $(docker images -f "dangling=true" -q)'
               }
            }
        }
        
    }
}
