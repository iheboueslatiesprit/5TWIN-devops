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
                sh 'sudo docker tag springboot iheb120/springboot:latest'
            }
        }

        stage('Docker push') {
            steps {
                sh 'sudo docker push springboot:latest'
            }
        }



    }
}