pipeline {
    agent none
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v /root/.m2:/root/.m2 -v /var/run/docker.sock:/var/run/docker.sock'
                }
            }
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Database') {
            agent {
                docker {
                    image 'docker'
                    args '-v /root/.m2:/root/.m2 -v /var/run/docker.sock:/var/run/docker.sock'
                }
            }
            steps {
                sh './var/jenkins_home/workspace/JEE7-Demo/docker-config/database/runDatabase.sh'
            }
        }
        stage('Test') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v /root/.m2:/root/.m2 -v /var/run/docker.sock:/var/run/docker.sock'
                }
            }
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
    }
}
