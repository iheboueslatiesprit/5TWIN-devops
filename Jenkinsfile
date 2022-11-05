pipeline {
    agent any
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

    }
        post {
            failure {
                mail body: 'Pipeline fail', to: "oueslatiiheb0@gmail.com", subject: 'Pipeline fail'
            }
        }
}