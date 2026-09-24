pipeline {
    agent any

    tools {
        maven 'maven-ci-server'
    }

    parameters {
        choice(
            name: 'ENVIRONMENT',
            choices: ['dev', 'prod'],
            description: 'Select the environment to deploy'
        )
    }

    stages {

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'target/*.war'
            }
        }

        stage('Deploy to Dev') {
            when {
                expression {
                    params.ENVIRONMENT == 'dev'
                }
            }

            steps {
                deploy(
                    adapters: [
                        tomcat9(
                            url: 'http://3.110.185.128:8081/',
                            credentialsId: 'tomcat'
                        )
                    ],
                    war: 'target/*.war',
                    contextPath: 'myapp-dev-env'
                )
            }
        }

        stage('Deploy to Prod') {
            when {
                expression {
                    params.ENVIRONMENT == 'prod'
                }
            }

            steps {
                deploy(
                    adapters: [
                        tomcat9(
                            url: 'http://3.110.185.128:8081/',
                            credentialsId: 'tomcat'
                        )
                    ],
                    war: 'target/*.war',
                    contextPath: 'myapp-prod-env'
                )
            }
        }
    }
}