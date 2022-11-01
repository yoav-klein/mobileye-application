
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    image_name = docker.image("yoavklein3/mobileye_test:0.1")
                    my_image = docker.build(image_name)
                    my_image.push()
                }
            }
        }
    }

}
