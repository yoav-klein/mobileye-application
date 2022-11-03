
String registryUrl = "https://654328202400.dkr.ecr.us-east-1.amazonaws.com"
String clusterName = "myCluster"
String serviceName = "service"

pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    def my_image = docker.build("my-app:0.1")
                    
                    docker.withRegistry(registryUrl,  "ecr_login") {
                        my_image.push('latest')
                     }
                }
            }
        }
        stage('Update Service') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsProvider',
                credentialsId: 'aws_account',
                accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    script {
                        def aws_image = docker.image('amazon/aws-cli')
                        aws_image.pull()
                        aws_image.inside("-e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} -e AWS_REGION=us-east-1") {
                                    sh: "aws ecs update-service --cluster=${clusterName} --service=${serviceName} --force-new-deployment"
                        }
                    }    
                        
                }
            }
        }
    }

}
