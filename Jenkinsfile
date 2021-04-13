pipeline {
  agent any
  stages {
    stage('') {
      steps {
        sh '''mvn --version
git --version
java -version'''
      }
    }

  }
  triggers {
    pollSCM('* * * * *')
  }
}