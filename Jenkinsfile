pipeline {
    agent { label 'node1' }
    stages {
		stage('Prepare') {
			steps
			{
				print 'Cleanup Workspace'
				step([$class: 'WsCleanup'])
                sh "docker ps -q --filter "mynginx" | grep -q . && docker mynginx && docker rm -fv mynginx"
                sh "[ "$(docker ps -a | grep rm mynginx)" ] && docker stop rabbitmq && docker container rm -fv mynginx" 
			}
		}	
        stage('create_files_with_content in adirectory') {
            steps {
                sh "create_files_with_content.sh" 
            }
        }
        stage('make previouse stages files adding date, time, timezone ') {
            steps {
	            sh "add_date.sh"
            }
        }
        stage('make previous files on readonly permission') {
            steps {
	            sh "readonly.sh"  
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
	            docker container  run -d --name mynginx -p 80:80 -v /app:/var/www/html -v default.conf:/etc/nginx/conf.d/default.conf:ro  mynginx 
            """
	        }
        }	
    }
}
