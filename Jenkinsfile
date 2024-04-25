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
                unstash 'github_commit'
                echo "The value of myVariable is ${image_tag}"
            }
        }
    }
}
