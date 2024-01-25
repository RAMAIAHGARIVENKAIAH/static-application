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
                    sh "docker build -t ${DOCKER_IMAGE_NAME} ."
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh "docker run -itd --name system-info -p ${HOST_PORT}:${CONTAINER_PORT} ${DOCKER_IMAGE_NAME}"
                }
            }
        }

        stage('Verify') {
            steps {
                script {
                    // You may add additional verification steps here
                    sh "curl http://localhost:${HOST_PORT}"
                }
            }
        }
    }
}
