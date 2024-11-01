pipeline {
    agent any
    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials')
    }
    stages {
        stage('Testing') {
            steps {
                script {
                    //cualquier sh que vean, en windows es bat
                    sh 'docker build -t imagendepruebas -f Dockerfile.test . && docker run imagendepruebas'
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    //cualquier sh que vean, en windows es bat
                    sh 'docker build -t adanbrooks27/imagendesdejenkinsjs -f Dockerfile.build .'
                }
            }
        }
        stage('Dockerhub login') {
            steps {
                script {
                    //cualquier sh que vean, en windows es bat
                    sh 'echo ${DOCKER_HUB_CREDENTIALS_PSW} | docker login -u ${DOCKER_HUB_CREDENTIALS_USR} --password-stdin'
                }
            }
        }
        stage('Dockerhub push') {
            steps {
                script {
                    //cualquier sh que vean, en windows es bat
                    sh 'docker push toony1908/imagendesdejenkinsjs'
                }
            }
        }
    }
}