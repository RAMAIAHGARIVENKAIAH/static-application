pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = "system-info-container"
        CONTAINER_PORT = "80"
        HOST_PORT = "8054"
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Use 'sh' step to run shell commands
                    sh "docker build -t system-info-container ."
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh "start docker run -itd --name system-info -p 9091:80 system-info-container"
                }
            }
        }

        stage('Verify') {
            steps {
                script {
                    // You may add additional verification steps here
                    sh "curl http://localhost:9091"
                }
            }
        }
    }
}
