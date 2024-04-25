pipeline {
    // agent {
    //     label 'ec2_slave'
    // }
    agent any
    tools {
        maven 'khaled'
    }
    environment {
        USER_NAME  =  "khaledeldsoky"
        EMAIL =  "khlaedmohamedeldsoky@gmail.com"
    }
    stages {

        stage('Deploy App ') {

            steps {
                withCredentials([usernamePassword(credentialsId: "github_token", usernameVariable: 'USER', passwordVariable: 'PASSWORD')]) {
                sh """
                sh image_tag.sh deployment.yml ${params.GIT_COMMIT_REV}
                git config --global user.name ${USER_NAME}
                git config --global user.email ${EMAIL}
                git add deployment.yml
                git commit -am "from git commit ${params.GIT_COMMIT_REV}"
                git push https://${PASSWORD}@github.com/khaledeldsoky/app.git HEAD:CD
                """
                }
            }
        }
    }
}
