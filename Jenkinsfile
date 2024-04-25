pipeline {
    // agent {
    //     label 'ec2_slave'
    // }
    agent any
    tools {
        maven 'khaled'
    }
    stages {
        stage('Deploy App ') {
            steps {
                withCredentials([usernamePassword(credentialsId: "github_token", usernameVariable: 'USER', passwordVariable: 'PASSWORD')]) {
                sh """
                sh image_tag.sh deployment.yml
                git config --global user.name khaledeldsoky
                git config --global user.email khlaedmohamedeldsoky@gmail.com
                git add .
                git push https://${USER}:${PASSWORD}@git@github.com:khaledeldsoky/app.git HEAD:CD
                """

                }
            }
        }
    }
}
