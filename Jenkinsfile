pipeline {
    agent none
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v /root/.m2:/root/.m2'
                }
            }
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Containers') {
            agent {
                docker {
                    image 'docker'
                }
            }
            steps {
                sh 'sh jenkins/scripts/database/runDatabase.sh'
                sh 'sh jenkins/scripts/appserver_integration_tests/runAppServer.sh'
            }
        }
        stage('Test') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v /root/.m2:/root/.m2 --net="host"'
                }
            }
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'jee7-class-service/target/surefire-reports/*.xml'
                    junit 'jee7-grade-service/target/surefire-reports/*.xml'
                    junit 'jee7-search-service/target/surefire-reports/*.xml'
                    junit 'jee7-students-service/target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deliver') {
            agent {
                docker {
                    image 'docker'
                    args '-v /:/tmp/server'
                }
            }
            steps {
                sh 'sh jenkins/scripts/appserver/runAppServer.sh'
                sh 'sh jenkins/scripts/deploy.sh'
            }
        }
    }
}
