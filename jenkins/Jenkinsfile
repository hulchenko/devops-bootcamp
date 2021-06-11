pipeline {
    agent any
    
    
    environment {
        PROJECT_NAME = "Test Project"
        OWNER_NAME = "Vadym Hulchenko"
    }
    
    
    stages {
        stage('1-Build'){
                steps {
                    echo 'Start Stage Build'
                    echo 'Building....'
                    echo 'End Stage Build'
                }
        }
        stage('2-Test'){
            steps {
                echo 'Start Stage Test'
                echo 'Testing....'
                sh "ls -la"
                echo 'End Stage Test'
            }
        }
        stage('3-Deploy'){
            steps {
                echo 'Start Stage Deploy'
                echo 'Deploying....'
                sh '''
                    echo "Project name: ${PROJECT_NAME}"
                    echo "Deployed by ${OWNER_NAME}"
                '''
                echo 'End Stage Deploy'
            }
        }
        stage('4-Final'){
            steps {
                echo 'Congratulations!'
            }
        }
        
    }
}