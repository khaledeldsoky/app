pipeline {
    agent {
        label 'ec2_slave'
    }
    // agent any
    tools {
        maven 'khaled'
    }
    environment {
        USER_NAME  =  "khaledeldsoky"
        EMAIL =  "khlaedmohamedeldsoky@gmail.com"
    }
    stages {
        stage('Clean workspace'){
            steps{
                cleanWs()
            }
        }
        stage('Checkout') {
            steps {
                // Check out the source code from Git
                git branch: 'CD', url: 'https://github.com/khaledeldsoky/app.git'
            }
        }
        stage('Deploy App ') {

            steps {
                withCredentials([usernamePassword(credentialsId: "github_token", usernameVariable: 'USER', passwordVariable: 'PASSWORD')]) {
                sh """
                sh image_tag.sh deployment.yml ${params.GIT_COMMIT_REV}
                git config --global user.name ${USER_NAME}
                git config --global user.email ${EMAIL}
                git add deployment.yml
                git commit -m "from git commit ${params.GIT_COMMIT_REV}"
                git push https://${PASSWORD}@github.com/khaledeldsoky/app.git HEAD:CD
                """
                }
            }
        }
    }
}
