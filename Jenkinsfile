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
              withCredentials([usernamePassword(credentialsId: 'khaledmohamedatia', passwordVariable: 'password', usernameVariable: 'username')]){
              sh 'docker build -t khaledmohamedatia/app .'
              sh 'docker login -u  ${username} -p  ${password}'
              sh 'docker push khaledmohamedatia/app'
              }
            }
        }
    }
}
