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
                   sh 'docker rmi $(docker images -f "dangling=true" -q)'
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
        stage ("Docker Publish"){
            steps {
                script {
                    try {
                        sh 'docker stop apache-web'
                        
                    }
                    catch(err) {
                         echo err.getMessage()
                    }
                }
               
                sh 'docker run --name apache-web --rm -d --publish 82:80 phillip420/web:v1.0'
            }
        }
    }
}
