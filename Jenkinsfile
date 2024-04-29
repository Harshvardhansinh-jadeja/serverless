pipeline{
    agent any
    tools {
       terraform 'terraform'
    }
    environment{
        AWS_ACCESS_KEY_ID = credentials('aws-credentials')
        AWS_SECRET_ACCESS_KEY = credentials('aws-credentials')
        region="us-west-2"
    }
     stages {
        stage("Set Build name") {
            steps {
                // use name of the patchset as the build name
                buildName "${BUILD_NUMBER} - ${GIT_BRANCH.split("/")[1]}"
                buildDescription "Executed @ ${NODE_NAME}"
            }
        }
        stage("Variables"){
            steps{
                script{
                        def BRANCH_NAME = "${GIT_BRANCH.split("/")[1]}"
                        echo "${BRANCH_NAME}"
                        echo "${BUILD_NUMBER}"
                        bat 'echo %region%'
                }
            }
        }
        stage("Run AWS parameter"){
            steps{
                dir('scripts'){
                    script{
                        powershell '.\\ssm.ps1'
                    }
                }
            }
        }
        stage("terraform commands"){
            steps{
                dir("Infrastructure"){
                    bat''' 
                    terraform init
                    terraform plan
                    terraform apply -auto-approve
                    '''
                    }
            }
        }
        stage("Build and S3"){
            steps{
                dir("frontend"){
                    bat 'npm run build'
                    bat 'aws s3 sync build s3://harshvardhan-personal'
                    }
            }
        }
        stage("Delete Terraform tfvars"){
            steps{
                dir("Infrastructure"){
                        powershell 'del terraform.tfvars'
                        powershell 'del lambda_function.zip'
                    }
            }
        }
    }
}