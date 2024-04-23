pipeline{
    agent any
     stages {

        stage("Build"){
            dir("frontend"){
                steps{
                    bat'''
                    // npm install
                    npm run build
                    '''
                    }
            }
        }
        stage("Test"){
            steps{
                    dir("frontend"){
                        sh "npm start"
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