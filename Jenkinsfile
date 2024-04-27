pipeline {
    // agent {
    //     label 'ec2'
    // }
    agent any 

    tools {
        maven 'khaled'
    }

    environment {
        USER_NAME  =  "khaledeldsoky"
        EMAIL =  "khlaedmohamedeldsoky@gmail.com"
    }

    parameters {
        string(name: 'GIT_COMMIT_REV', defaultValue: commit_hash)
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
        
        stage('get commit hash from '){
            steps{
                def commit_hash = readFile(file: '"../ci/commit.txt"')
            }
        }

        stage('push change to git hub ') {
            steps {
                withCredentials([usernamePassword(credentialsId: "github_token", usernameVariable: 'USER', passwordVariable: 'PASSWORD')]) {
                sh """
                sh image_tag.sh deployment.yml ${params.GIT_COMMIT_REV}
                git config --global user.name ${USER_NAME}
                git config --global user.email ${EMAIL}
                cat deployment.yml 
                git add .
                git commit -m "from git commit ${params.GIT_COMMIT_REV}"
                git push https://${PASSWORD}@github.com/khaledeldsoky/app.git HEAD:CD
                """
                }
            }
        }


    }
}
