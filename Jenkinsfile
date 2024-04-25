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
                sh 'sed -i -E "s/khaledmohamedatia/app:\\\\1/g" deployment.yml'
                sh 'kubectl apply -f deployment.yml'
            }
        }
    }
}
