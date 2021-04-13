pipeline {
  agent any
  stages {
    stage('error') {
      parallel {
        stage('Log Tool Version') {
          steps {
            sh '''sudo apt update -p Alfred110
java -version

git --version

mvn --version
'''
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