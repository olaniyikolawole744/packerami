pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = credentials ('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials ('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION    = 'us-east-1'
    }

    stages {
        stage('Build AMI') {
            steps {
                sh 'ls && cd packer && ls && packer build linux.json && packer build ubuntu.json && cd ..'
            }
        }
        stage('Create Ubuntu Server') {
            steps {
                sh 'cd server && ls && cd ubuntu-server && ls && terraform init && terraform plan -chdir var-file=../environments/monitoring.tfvars && cd ..'
            }
        }
        stage('Create Linux Server toolbox1') {
            steps {
                sh 'cd linux-server'
                sh 'cd toolbox1-linux-server'
                sh 'terraform init'
                sh 'terraform plan var-file=../../environments/toolbox1.tfvars'
                sh 'terraform apply var-file=../../environments/toolbox1.tfvars --auto-approve'
                sh 'cd ..'
            }
        }
        stage('Create Linux Server toolbox2') {
            steps {
                sh 'cd toolbox2-linux-server'
                sh 'terraform init'
                sh 'terraform plan var-file=../../environments/toolbox2.tfvars'
                sh 'terraform apply var-file=../../environments/toolbox2.tfvars --auto-approve'
                sh 'cd ..'
            }
        }
        stage('Run terraform destroy') {
            steps {
                sh 'terraform destroy --auto-approve'
            }
        }
    }
}


