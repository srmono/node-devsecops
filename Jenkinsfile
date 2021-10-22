pipeline{

	agent {label 'ubuntu-app-agent'}

	environment {
		DOCKERHUB_CREDENTIALS=credentials('training_creds')
	}

	stages {
	    
	    stage('gitclone') {

			steps {
				git 'https://github.com/srmono/node-devsecops.git'
			}
		}

		stage('Build') {

			steps {
				sh 'docker build -t ustapi/snake:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push ustapi/snake:latest'
			}
		}

        state('tooling versions') {
            steps {
                sh '''
                    docker --version
                    docker compose version
                '''
            }
        }
        stage('Deploy') {

			steps {
				sh 'docker-compose down'
                sh 'docker-compose up -d'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}