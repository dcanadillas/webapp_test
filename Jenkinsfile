pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        echo 'Building the application'
        sh 'mvn clean install'
      }
    }
    stage('deploy') {
      agent {
        docker {
          image 'docker'
        }

      }
      input {
        message 'Deploy de application?'
      }
      steps {
        echo 'Deploying the application in Docker container'
        sh 'docker build -t webapp:myapp .'
        sh 'docker run -ti -p 8888:8080 -d webapp:myapp'
      }
    }
    stage('smoke_test') {
      steps {
        sh 'curl -I http://localhost:8888/myapp'
      }
    }
  }
  tools {
    maven 'M3'
  }
}