pipeline {
  agent {
    kubernetes {
      label 'default-java'
      defaultContainer 'jnlp'
    }
  }
  stages {
    stage('build') {
      steps {
        echo 'Building the application'
        sh 'mvn clean install'
      }
    }
    stage('deploy') {
      input {
        message "Should we deploy?"
        ok "Of course!"
        submitter "dcanadillas"
      }
      steps {
        echo 'Deploying the application in Docker container'
        container('docker'){
          // Let's delete some containers that can be using resources
          sh 'docker container prune -f'
          sh 'docker build -t webapp:myapp .'
          sh 'docker run -ti -p 8888:8080 -d webapp:myapp'
        } 
      }
    }
    stage('smoke_test') {
      
      steps {
        container('docker') {
          sh 'curl -I http://localhost:8888/myapp'
        }
      }
    }
  }
  tools {
    maven 'M3'
  }
}