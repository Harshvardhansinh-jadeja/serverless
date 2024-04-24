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
        stage("Get Parameter"){
            steps{
                dir("scripts"){
                    bat''' 
                    ./ssm.ps1
                    '''
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
        // stage("Clean up")
        // {
        //     steps
        //     {
        //         deleteDir()
        //     }
        // }
    }
}