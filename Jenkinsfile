pipeline {
    // agent {
    //     label 'ec2_slave'
    // }
    agent any
    tools {
        maven 'khaled'
    }
    stages {
        stage('Checkout') {
            steps {
                // Check out the source code from Git
                git branch: 'cd', url: 'https://github.com/khaledeldsoky/app.git'
            }
        }
        stage('Deploy App ') {

            steps {
                withCredentials([usernamePassword(credentialsId: "github_token", usernameVariable: 'USER', passwordVariable: 'PASSWORD')]) {
                sh """
                sed -i "s/khaledmohamedatia\/app:.*/khaledmohamedatia\/app:${GIT_COMMIT_REV}/g" $1
                sh image_tag.sh deployment.yml
                cat deployment.yml
                """

                }
            }
        }
    }
}
