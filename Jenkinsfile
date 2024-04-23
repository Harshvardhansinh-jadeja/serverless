pipeline{
    agent any

    parameters{
        booleanParam(defaultValue: false, description: "Enable Service?", name: "myBoolean")
        string(defaultValue: "PROD", description: "Which Environment?", name: "environment")
        choice(choices: ["TEST","PROD","DEV","QA"], description: "Drop down of envs", name: "dropEnv")
    }
     stages {

        stage("Build"){
            steps{
                dir("frontend"){
                    bat'''
                    // npm install
                    npm run build
                    
                    '''
                    }
            }
        }
        stage("Parameter"){
            steps{
                    dir("frontend"){
                    echo "Parameter is : ${params.myBoolean}"
                    echo "Parameter is : ${params.environment}"
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