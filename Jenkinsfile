pipeline {
    agent any

    tools {
        maven 'maven-ci-server'
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

        stage('Docker Build') {
            steps {
                sh 'docker build -t myapp:dev .'
            }
        }

        stage('Deploy to Dev') {
            steps {
                sh '''
                    docker rm -f myapp-dev 2>/dev/null || true

                    docker run -d \
                        --name myapp-dev \
                        -p 8082:8080 \
                        myapp:dev
                '''
            }
        }
    }
}