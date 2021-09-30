pipeline {
    agent {label 'node1'}
    stages {
        stage('create_files_with_content in adirectory') {
            steps {
                sh "/home/ec2-user/scripts/create_files_with_content.sh" 
            }
        }
    }
}
