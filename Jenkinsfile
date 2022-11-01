
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    my_image = docker.build("test:0.1")
                    echo "Built successfully"
                    docker.withRegistry("027483264577.dkr.ecr.us-east-1.amazonaws.com",  "ecr-login") {
                        my_image.push()
                     }
                }
            }
        }
    }

}
