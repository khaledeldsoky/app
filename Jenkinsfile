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
                sh image_tag.sh deployment.yml ${params.GIT_COMMIT_REV}
                git add .
                git commit -am "from git commit ${params.GIT_COMMIT_REV}"
                git push https://${USER}:${PASSWORD}@github.com/${USER}:khaledeldsoky/app.git HEAD:CD
                """

                }
            }
        }
    }
}
