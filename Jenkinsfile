pipeline {

    agent any
    environment {
        DOCKER_IMAGE_NAME = "khaledmohamedatia/app"
    }
    parameters {
        string(name: 'GIT_COMMIT_REV', defaultValue: env.GIT_COMMIT_REV)
    }
    tools {
        maven 'khaled'
    }
    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/khaledeldsoky/app.git'
            }
        }

        stage('push image ') {
            steps {
                script {
                        env.GIT_COMMIT_REV = sh (script: 'git log -n 1 --pretty=format:"%h"', returnStdout: true)
                }
                withCredentials([usernamePassword(credentialsId: 'docker_hub_credentials', passwordVariable: 'password', usernameVariable: 'username')]) {
                    sh 'docker build -t ${DOCKER_IMAGE_NAME}:${GIT_COMMIT_REV} .'
                    sh 'docker login -u  ${username} -p  ${password}'
                    sh 'docker push ${DOCKER_IMAGE_NAME}:${GIT_COMMIT_REV}'
                }
            }
        }

        stage("copy commit")
{
            steps{
                writeFile file: "commit.file", text: "${GIT_COMMIT_REV}"
            }
        }

        stage('Trigger CD job ') {
                steps {
                echo "triggering CD"
                build job: 'cd', parameters: [string(name: 'GIT_COMMIT_REV', value: env.GIT_COMMIT_REV)] }
        }


    }

}
