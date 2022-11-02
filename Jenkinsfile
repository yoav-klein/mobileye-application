
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    my_image = docker.build("my-app:0.1")
                    echo "Built successfully"
                    
                    docker.withRegistry("https://309548668818.dkr.ecr.us-east-1.amazonaws.com",  "ecr_login") {
                        my_image.push('latest')
                     }
                }
            }
        }
    }

}
