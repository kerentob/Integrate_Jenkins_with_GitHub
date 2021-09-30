pipeline {
    agent {label 'node1'}
    stages {
		stage('Prepare') {
			steps
			{
				print 'Cleanup Workspace'
				step([$class: 'WsCleanup'])
				sh "docker stop mynginx && docker container rm -f mynginx"
			    sh "docker image rm -f mynginx"
			    
			}
		}	
        stage('create_files_with_content in adirectory') {
            steps {
                sh "/home/ec2-user/scripts/create_files_with_content.sh" 
            }
        }
    }
}
