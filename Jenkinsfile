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
                sh 'ls'
                sh 'cd packer'
                sh 'ls'
                sh 'packer build linux.json'
                sh 'packer build ubuntu.json'
                sh 'cd ..'
            }
        }
        stage('Create Ubuntu Server') {
            steps {
                sh 'cd server'
                sh 'ls'
                sh 'cd ubuntu-server'
                sh 'ls'
                sh 'terraform init'
                sh 'terraform plan var-file=../environments/monitoring.tfvars'
                sh 'terraform apply var-file=../environments/monitoring.tfvars --auto-approve'
                sh 'cd ..'
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


