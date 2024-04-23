pipeline{
    agent any
     stages {
    //     stage("Clean up"){
    //         steps{ck
    //             deleteDir()
    //         }
    //     }
        // stage("Clone repo"){
        //     steps{
        //         sh "git clone git@github.com:Harshvardhansinh-jadeja/serverless.git"
        //     }
        // }
        stage("Build"){
            steps{
                bat'''
                cd serverless\\frontend
                npm run build
                '''
            }
        }
        // stage("Test"){
        //     steps{
        //         dir("serverless"){
        //             dir("frontend"){
        //                 sh "npm start"
        //             }
        //         }
        //     }
        // }
    }
}