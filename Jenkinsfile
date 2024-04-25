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
                sh 'sh image_tag.sh image_tag.sh'
            }
        }
    }
}
