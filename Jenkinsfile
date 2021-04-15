pipeline {
    agent any
    
    tools{
        maven 'Maven.3.6.3'
    }
     
    stages {

        stage ('Clone the project'){
            steps{ 
                sh "java -version"
                sh "git --version"
                sh "mvn --version"
                git 'https://github.com/eugenp/tutorials.git'
            }
        }
        
        stage("Compilation and Analysis") {
            steps{
                parallel (
                    'Compilation' : {
                        sh "mvn clean install -DskipTests"
                    },
                    'Static Analysis' : {
                        sh "mvn checkstyle:checkstyle"
                        // step([$class: 'CheckStylePublisher',
                        //   canRunOnFailed: true,
                        //   defaultEncoding: '',
                        //   healthy: '100',
                        //   pattern: '**/target/checkstyle-result.xml',
                        //   unHealthy: '90',
                        //   useStableBuildAsReference: true
                        // ])
                    }
                )
            }
        }
    }
}
