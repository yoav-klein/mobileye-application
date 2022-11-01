
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    my_image = docker.build("yoavklein3/mobileye_test:0.1")
                    echo "Built successfully"
                     withRegistry("027483264577.dkr.ecr.us-east-1.amazonaws.com", credentialsId: "ecr-login") {
                        my_image.push()
                     }
                }
            }
        }
    }

}
