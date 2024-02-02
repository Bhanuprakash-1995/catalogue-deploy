pipeline {
    agent {
        node {
            label 'AGENT-1'
        }
    }
     options {
        timeout(time: 1, unit: 'HOURS') 
        disableConcurrentBuilds()
        ansiColor('xterm')
    }
    parameters {
        string(name: 'version', defaultValue: '', description: 'What is the artifact version?')
        string(name: 'environment', defaultValue: 'dev', description: 'What is environment?')
    }

    // build
    stages {       
        stage('Print version') {
            steps {
                sh """
                    echo "version: ${params.version}"
                    echo "environment: ${params.environment}"
                """
            }
        }
        stage('Terraform Initialization') {
            steps {
                sh """
                    cd terraform
                    terraform init --backend-config=${params.environment}/backend.tf -reconfigure 
                """
            }
        }
        stage('Terraform Plan') {
            steps {
                sh """
                    cd terraform
                    terraform plan -var-file=${params.environment}/${params.environment}.tfvars -var="app_version=${params.version}"
                """
            }
        }
       stage('Terraform Apply') {
            steps {
                sh """
                    cd terraform
                    terraform apply -var-file=${params.environment}/${params.environment}.tfvars -var="app_version=${params.version}" -auto-approve
                """
            }
        }
        stage('Terraform destroy') {
            steps {
                sh """
                    cd terraform
                    terraform destroy -var-file=${params.environment}/${params.environment}.tfvars -var="app_version=${params.version}" -auto-approve
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