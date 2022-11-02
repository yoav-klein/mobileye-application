
String registry_url = "428924725037.dkr.ecr.us-east-1.amazonaws.com"
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    my_image = docker.build("my-app:0.1")
                    echo "Built successfully"
                    
                    docker.withRegistry(registry_url,  "ecr_login") {
                        my_image.push('latest')
                     }
                }
            }
        }
    }

}
