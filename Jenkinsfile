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
                sh 'cd server && ls && cd ubuntu-server && ls && terraform init && terraform plan -var-file=../environments/monitoring.tfvars && terraform apply -var-file=../environments/monitoring.tfvars --auto-approve'
            }
        }
        stage('Create Linux Server toolbox1') {
            steps {
                sh 'cd server && cd linux-server && ls && cd toolbox1-linux-server && terraform init && terraform plan -var-file=../../environments/toolbox1.tfvars && terraform plan -var-file=../../environments/toolbox1.tfvars --auto-approve'
            }
        }
        stage('Create Linux Server toolbox2') {
            steps {
                sh 'cd server && cd linux-server && cd toolbox2-linux-server && ls && terraform init && terraform plan -var-file=../../environments/toolbox2.tfvars && terraform plan -var-file=../../environments/toolbox2.tfvars --auto-approve'
            }
        }
        stage('Destroy Infrastructure') {
            steps {
                sh 'terraform destroy --auot-approve' 
            }
        }
    }
}


