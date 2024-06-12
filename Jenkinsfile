pipeline {
    agent {
        label 'node'
    }
    options {
        // Timeout counter starts AFTER agent is allocated
        timeout(time: 30, unit: 'MINUTES')
        disableConcurrentBuilds()
    }
   
    environment{
       def appVersion = ''
       def nexusUrl= 'nexus.naveencloud.online:8081'
    }
     parameters {
        string(name: 'appVersion', defaultValue: '1.0.0', description: 'What is the application version')
    }
    stages {
        stage('print the version'){
            steps{
              script { 
                echo "application version:${params.appVersion}"               
                }
            }
        }
            stage('init'){
                steps{
                sh """
                    cd terraform
                    terraform init
                """
                }
            }
             stage('plan'){
                steps{
                sh """
                    cd terraform
                    terraform plan -var="app_version=${params.appVersion}"
                """
                }
             } 

              stage('apply'){
                steps{
                sh """
                    cd terraform
                    terraform apply -auto-approve -var="app_version=${params.appVersion}"
                """
                }
             } 
    }
        post {
            always{
                echo ' i will always say hello again'
                deleteDir()
            }
            success{
                echo ' i will run the pipeline success'
            }
            failure{
                echo ' i will run the pipeline failure'
            }
        }
}