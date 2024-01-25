pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = "system-info-container"
        CONTAINER_PORT = "80"
        HOST_PORT = "8054"
    }

    // stages {
    //     stage('Build and Run Docker Container') {
    //         steps {
    //             script {
    //                 def dockerImage = docker.build('${DOCKER_IMAGE_NAME}')
    //                 dockerImage.run('-p ${HOST_PORT}:${CONTAINER_PORT} -d ${DOCKER_IMAGE_NAME}')
    //             }
    //         }
    //     }
    // }
    stages {
       stage('Build') {
           steps {
               script {
                   docker build -t ${DOCKER_IMAGE_NAME} .
               }
           }
       }

       stage('Deploy') {
           steps {
               script {
                   docker run -itd --name system-info -p ${HOST_PORT}:${CONTAINER_PORT} ${DOCKER_IMAGE_NAME}
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
//     post {
//         always {
//             stage('Clean Up') {
//                 steps {
//                     script {
//                         docker.image(env.DOCKER_IMAGE_NAME).remove()
//                     }
//                 }
//             }
//         }
//     }
// }
