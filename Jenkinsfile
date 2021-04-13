pipeline {
  agent any
  stages {
    stage('error') {
      parallel {
        stage('Log Tool Version') {
          steps {
            sh '''mvn --version
git --version
java -version'''
          }
        }

        stage('Check for Pom ') {
          steps {
            fileExists 'pom.xml'
          }
        }

      }
    }

  }
  triggers {
    pollSCM('* * * * *')
  }
}