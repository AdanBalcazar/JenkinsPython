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
                    sh 'docker build -t imagentestpython -f Dockerfile.test . && docker run imagentestpython'
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    //cualquier sh que vean, en windows es bat
                    sh 'docker build -t adanbrooks27/imagenbuildpython -f Dockerfile.build .'
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
                    sh 'docker push adanbrooks27/imagenbuildpython'
                }
            }
        }
    }
}