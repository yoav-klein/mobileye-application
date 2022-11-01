
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    my_image = docker.build("yoavklein3/mobileye_test:0.1")
                    echo "Built successfully"
                    my_image.push()
                }
            }
        }
    }

}
