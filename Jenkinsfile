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
      steps {
        echo 'Deploying the application in Docker container'
        container('docker'){
          sh 'docker build -t webapp:myapp .'
          input {
            message "Should we deploy?"
            ok "Of course!"
            submitter "dcanadillas"
          }
          sh 'docker run -ti -p 8888:8080 -d webapp:myapp'
        } 
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