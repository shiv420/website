pipeline {
    agent any
    stages {
       stage('Git-Checkout') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'master', url: 'https://github.com/shiv420/website.git'

               
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
               }
            }
        }
        stage("Docker-Push") {
            steps {
                withCredentials([string(credentialsId: 'docker_cred', variable: 'dockerpwd')]) {
                    sh 'docker login -u phillip420 -p ${dockerpwd}'
                    // some block
                }
                sh 'docker push  phillip420/web:v1.0'
            }
        }
    }
}
