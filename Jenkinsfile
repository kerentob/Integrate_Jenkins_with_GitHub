pipeline {
    agent { label 'node1' }
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
        stage('make previouse stages files adding date, time, timezone ') {
            steps {
	            sh "/home/ec2-user/scripts/add_date.sh"
            }
        }
        stage('make previous files on readonly permission') {
            steps {
	            sh "/home/ec2-user/scripts/readonly.sh"  
	        }
        }	   
        stage('build nginx image') {
            steps
            {
              sh """
	            docker build . -t mynginx  
            """
	        }
        }	
        stage('run nginx image') {
            steps
            {
              sh """
	            docker container  run -d --name mynginx -p 80:80 -v /var/lib/jenkins/workspace/pipeline_project/app:/var/www/html -v /var/lib/jenkins/workspace/pipeline_project/default.conf:/etc/nginx/conf.d/default.conf:ro  mynginx 
            """
	        }
        }	
    }
}