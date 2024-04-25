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
                sh 'sh image_tag.sh deployment.yml'
            }
        }
    }
}
