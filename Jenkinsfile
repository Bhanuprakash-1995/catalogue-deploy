pipeline {
    agent {
        node {
            label 'AGENT-1'
        }
    }
    // environment { 
    //     packageVersion = ''
    //     nexusUrl = '172.31.8.104:8081'
    // }
     options {
        timeout(time: 1, unit: 'HOURS') 
        disableConcurrentBuilds()
    }
     parameters {
        string(name: 'version', defaultValue: '1.0.0', description: 'What is the artifact version?')
        string(name: 'environment', defaultValue: 'dev', description: 'What is the environment?')

    }
    // build
    stages {       
        stage('Print varsion') {
            steps {
                sh """
                    echo "Version: ${parms.version}"
                    echo "Environment: ${parms.environment}"
                """
            }
        }
    }
    // post build
    post { 
        always { 
            echo 'I will always get executed irrespective of the pipeline status!'
            deleteDir()
        }
        failure { 
            echo 'This runs when pipeline is failed, used to send some alerts using slack..etc'
        }
        success { 
            echo 'This runs when pipeline executed successfully!'
        }
        aborted { 
            echo 'This runs when pipeline Timeout has been exceeded!'
        }
    }
}