pipeline {
    agent any
    environment {
        DOCKER_COMPOSE_VERSION = '1.29.2'
        DOCKER_IMAGE1 = "xesh-web"
        DOCKER_TAG1 = "latest"
    }
    stages {
        stage('Build') {
            steps {
                script {
                    bat 'docker --version' // Vérifie que Docker est accessible
                    // Lancement de Docker Build
                    bat "docker build -t ${DOCKER_IMAGE1}:${DOCKER_TAG1} -f Web.Dockerfile ."
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Pousse l'image Docker vers le registre
                    bat "docker tag ${DOCKER_IMAGE1}:${DOCKER_TAG1} cheikht/${DOCKER_IMAGE1}:${DOCKER_TAG1}"
                    bat "docker push cheikht/${DOCKER_IMAGE1}:${DOCKER_TAG1}"
                }
            }
        }
        stage('SonarQube Analysis') {
            steps {
                script {
                    // Lancer sonar-scanner avec les paramètres nécessaires
                    bat '''
                        sonar-scanner ^
                        -Dsonar.projectKey=mon-portfolio ^
                        -Dsonar.sources=. ^
                        -Dsonar.host.url=http://localhost:9000 ^
                        -Dsonar.login=sqp_fb58c49e5f4f652e4307ccf28e977a907d2f4282
                    '''
                }
            }
        }
        stage('Terraform') {
            steps {
                dir('terraform') {
                    script {
                        // Lancement de Terraform
                        bat 'terraform destroy --auto-approve'
                        bat 'terraform --version'
                        bat 'terraform init'
                        bat 'terraform plan'
                        bat 'terraform apply --auto-approve'
                    }
                }
            }
        }
    }
    post {
        success {
            slackSend channel: '#projetdevops', message: 'Build réussi'
        }
        failure {
            slackSend channel: '#projetdevops', message: 'Build échoué'
        }
    }
}
