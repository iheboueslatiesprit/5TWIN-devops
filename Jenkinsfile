pipeline {
    agent any
	environment {
		DOCKERHUB_CREDENTIALS=credentials('Dockerhub')
	}
    tools {
        maven 'M2_HOME'
        jdk 'JAVA_HOME'
    }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "M2_HOME =${M2_HOME}"
                '''
            }
        }
        stage('Checkout git') {
            steps {
                echo 'pulling';
                git branch: 'master',
                url: 'https://github.com/iheboueslatiesprit/5TWIN-devops.git'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Package') {
            steps {
                sh 'mvn -DskipTests clean package'
            }
        }
        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'sudo docker login -u $USERNAME -p $PASSWORD'
                }
            }
        }

        stage('Docker build') {
            steps {
                sh 'sudo docker build -t springboot .'
            }
        }
        stage('Docker tag') {
            steps {
                sh 'sudo docker tag 3321747afcd0 iheb120/springboot:springboot'
            }
        }

        stage('Docker push') {
            steps {
                sh 'sudo docker push iheb120/springboot:springboot'
            }
        }



    }
}