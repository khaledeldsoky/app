pipeline {
    agent {
        label 'ec2_slave'
    }
    tools {
        maven 'khaled'
    }
    stages {
        stage('Deploy App ') {
            steps {
                sh 'sed -E -i "s/khaledmohamedatia/app:.*/khaledmohamedatia/app:${GIT_COMMIT_REV}/g" deployment.yml'
                sh 'kubectl apply -f deployment.yml'
            }
        }
    }
}
