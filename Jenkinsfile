pipeline {
    agent any
    tools {
        maven 'khaled'
    }
    stages {
        stage('Hello') {
            steps {
              withCredentials([usernamePassword(credentialsId: 'gith_token', passwordVariable: 'password', usernameVariable: 'username')]) 
              sh 'docker build -t khaledmohamedatia/app .'
              sh 'docker push khaledmohamedatia/app'
            }
        }
    }
}
