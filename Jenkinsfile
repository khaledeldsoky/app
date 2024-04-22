pipeline {
        agent {
       label "aws_slave"
    }
    tools {
        maven 'khaled'
    }
    stages {
        stage('Hello') {
            steps {
              withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'password', usernameVariable: 'username')]) 
              sh 'docker build -t khaledmohamedatia/app .'
              sh 'docker push khaledmohamedatia/app'
            }
        }
    }
}
