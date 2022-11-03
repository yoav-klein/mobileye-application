
String registryUrl = "https://654328202400.dkr.ecr.us-east-1.amazonaws.com"
String clusterName = "myCluster"
String serviceName = "service"
String region = "us-east-1"

pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    
                    /*withCredentials([[$class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws_account',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                        def awsImage = docker.image('amazon/aws-cli')
                        awsImage.pull()
                        def runArgs = "-e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} -e AWS_REGION=${region}"
                        def runCmd = "ecs update-service --cluster=${clusterName} --service=${serviceName} --force-new-deployment"
                        awsImage.run(runArgs, runCmd)
                    }
                    
                    def my_image = docker.build("my-app:latest")
                    docker.withRegistry(registryUrl,  "ecr_login") {
                        my_image.push('latest')
                     }
                     */
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws_account',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                        sh returnStdout: true, script: """
                        docker build -t "${registryUrl}/my-app:latest" .
                        docker run -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -e AWS_REGION=${region} \
                        ecr get-login-password | docker login ${registryUrl}
                        docker push "${registryUrl}/my-app:latest"
                        """
                    }
                }
            }
        }
        stage('Update Service') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding',
                credentialsId: 'aws_account',
                accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    script {
                        def awsImage = docker.image('amazon/aws-cli')
                        awsImage.pull()
                        def runArgs = "-e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} -e AWS_REGION=${region}"
                        def runCmd = "ecs update-service --cluster=${clusterName} --service=${serviceName} --force-new-deployment"
                        awsImage.run(runArgs, runCmd) 
                    }                          
                }
            }
        }
    }

}
