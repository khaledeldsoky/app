pipeline {
    agent {
        label 'ec2_slave'
    }
    environment {
        DOCKER_IMAGE_NAME = "khaledmohamedatia/app"
    }
    tools {
        maven 'khaled'
    }
    stages {
        stage('push image ') {
            steps {
                script {
                        env.GIT_COMMIT_REV = sh (script: 'git log -n 1 --pretty=format:"%h"', returnStdout: true)
                }
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'password', usernameVariable: 'username')]) {
                    sh 'docker build -t ${DOCKER_IMAGE_NAME}:${GIT_COMMIT_REV} .'
                    sh 'docker login -u  ${username} -p  ${password}'
                    sh 'docker push ${DOCKER_IMAGE_NAME}:${GIT_COMMIT_REV}'
                }
            }
        }
    }
}
