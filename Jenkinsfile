pipeline {
    agent {
       label "aws_slave"
    }
    tools {
        maven 'khaled'
    }
    stages {
        stage('push image ') {
            steps {
              withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'password', usernameVariable: 'username')]){
              sh 'docker build -t khaledmohamedatia/app .'
              sh 'docker login -u  ${username} -p  ${password}'
              sh 'docker push khaledmohamedatia/app'
              }
            }
        }
            stage('Deploy App') {
      steps {
sh 'kubectl get pod '
      }
    }
    }

}
