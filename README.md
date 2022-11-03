# Demo Application
---

This is the demo application for the assignment. It's a simple web application
which prints "Hello Mobileye!" to the screen

The application is packaged to a Docker image using the Dockerfile.

## CI pipeline
We have a Jenkinsfile in the repository, which:
1. Builds the Docker image
2. Pushes it to ECR repository
3. Updates the ECS service so that the new image will be pulled

### Usage
1. Make sure you have the `aws_account` credentials configured in the credentials store of Jenkins
2. You need to make sure that the `registryUrl` value is correct.
