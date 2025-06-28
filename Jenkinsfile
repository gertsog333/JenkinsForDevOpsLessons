pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/gertsog333/JenkinsForDevOpsLessons.git'
            }
        }
        stage('Deploy  Instalations and log checks Scripts') {
            steps {
                    sshagent(credentials: ['ssh-credentials-jenkins']) {
                    sh 'scp -r *.sh jenkins@192.168.10.105:/scripts/'
                    sh 'ssh jenkins@192.168.10.105 "chmod +x /scripts/*.sh"'
                }
            }
        }
        stage('Execute Instalations and log checks Scripts') {
            steps {
                    sshagent(credentials: ['ssh-credentials-jenkins']) {
                    sh 'ssh jenkins@192.168.10.105 "/scripts/webserverInstall.sh; /scripts/webserverCheckLogs.sh"'
                }
            }
        }
    }
}
