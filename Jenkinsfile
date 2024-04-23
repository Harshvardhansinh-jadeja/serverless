pipeline{
    agent any
    stages {
        stage("Clean up"){
            steps{
                deleteDir()
            }
        }
        stage("Clone repo"){
            steps{
                sh "git clone git@github.com:Harshvardhansinh-jadeja/serverless.git"
            }
        }
        stage("Build"){
            steps{
                dir("Serverless"){
                    sh "npm run build"
                }
            }
        }
        stage("Test"){
            steps{
                dir("serverless"){
                    sh "npm start"
                }
            }
        }
    }
}