pipeline{
    agent any
    tools {
       terraform 'terraform'
    }
    environment{
        AWS_ACCESS_KEY_ID = credentials('aws-credentials')
        AWS_SECRET_ACCESS_KEY = credentials('aws-credentials')
    }
    // parameters{
    //     booleanParam(defaultValue: false, description: "Enable Service?", name: "myBoolean")
    //     string(defaultValue: "PROD", description: "Which Environment?", name: "environment")
    //     choice(choices: ["TEST","PROD","DEV","QA"], description: "Drop down of envs", name: "dropEnv")
    // }
     stages {
        stage("terraform commands"){
            steps{
                dir("Infrastructure"){
                    bat''' 
                    terraform init
                    terraform plan
                    '''
                    }
            }
        }
        stage("Build and S3"){
            steps{
                    dir("frontend"){
                    bat'''
                    npm run build
                    aws s3 sync build s3://harshvardhan-personal
                    '''
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