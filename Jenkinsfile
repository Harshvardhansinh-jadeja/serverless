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
                script{
                    def params = ["region", "invoke_url"]
                    def region = "us-west-2"
                    def prefix = "/harshvardhan/personal/account/"
                    def tfvarsFile = "../Infrastructure/terraform.tfvars"

                    // Getting SSM Parameter and passing it into the tfvars file.
                    params.each { param ->
                        def value = "aws --region $region ssm get-parameter --name \"$prefix$param\" --with-decryption --output text --query Parameter.Value".execute().text.trim()
                        "$param = \"$value\"".withWriterAppend { out ->
                            out.writeLine(tfvarsFile)
                            }
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
                    }
            }
        }
    }
}