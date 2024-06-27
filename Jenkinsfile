pipeline {
    agent any
    environment {
        DOCKER_COMPOSE_VERSION = '1.29.2'
        // PATH = "/usr/local/bin:$PATH" // Assurez-vous que cela inclut le chemin vers Docker
        DOCKER_IMAGE1 = "xesh-web"
        DOCKER_TAG1 = "latest"
        // DOCKER_IMAGE2 = "xesh-mysql"
        // DOCKER_TAG2 = "latest"
    }
    stages {
        stage('Build') {
            steps {
                script {
                    bat 'docker --version' // Vérifier que Docker est accessible
                    // Lancement de Docker Compose
                    bat "docker build -t ${DOCKER_IMAGE1}:${DOCKER_TAG1} -f Web.Dockerfile ."
                    // bat 'docker build -t ${DOCKER_IMAGE2}:${DOCKER_TAG2} -f Web.Dockerfile .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Mettez ici vos commandes pour pousser
                    bat "docker tag ${DOCKER_IMAGE1}:${DOCKER_TAG1} cheikht/${DOCKER_IMAGE1}:${DOCKER_TAG1}"
                    bat "docker push cheikht/${DOCKER_IMAGE1}:${DOCKER_TAG1}"
                    // bat 'docker tag ${DOCKER_IMAGE2}:${DOCKER_TAG2} cheikht/${DOCKER_IMAGE2}:${DOCKER_TAG2}'                                                                                                         NH}:${DOCKER_TAG2} ngeuya/${DOCKER_IMAGE2}:${DOCKER_TAG2}'
                    // bat 'docker push ngeuya/${DOCKER_IMAGE2}:${DOCKER_TAG2}'
                }
            }
        }
        stage('Terraform') {
            steps {
                dir('terraform') {
                    script {
                        // Lancement de Terraform
                        bat 'terraform --version'
                        bat 'terraform init'
                        bat 'terraform plan'
                        bat 'terraform apply --auto-approve'
                        // bat 'terraform destroy --auto-approve'
                    }
                }
            }
        }
    }
    post {
        success {
           // bat 'docker-compose down -v'
            slackSend channel: '#projetdevops', message: 'Build réussi'
        }
        failure {
            slackSend channel: '#projetdevops', message: 'Build échoué'
        }
    }
}
