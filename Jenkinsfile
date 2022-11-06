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
                    sh 'docker login -u $USERNAME -p $PASSWORD'
                }
            }
        }
        stage('Docker build') {
            steps {
                sh 'docker build -t iheb120/tpAchatProject:1.0 .'
            }
        }
        stage('Docker push') {
            steps {
                sh 'docker push iheboueslati/tpAchatProject:1.0'
            }
        }



    }
}