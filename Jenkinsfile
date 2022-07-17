pipeline{
    agent any
    
    environment {
        registry = 'anuragkmr328/docker-pipeline-job'
        registryCredential = 'dockerhub_id'
        dockerImage =''
        dockerrun = 'docker run -p 8000:80 -d --name jenkinsknowledges anuragkmr328/docker-pipeline-job:latest'
        dockerimagerm = 'docker image rmi anuragkmr328/docker-pipeline-job:latest'
        dockercostop = 'docker ps -f name=jenkinsknowledges -q | xargs --no-run-if-empty docker container stop'
        dockercorm = 'docker container ls -a -fname=jenkinsknowledges -q | xargs -r docker container rm'
    }
        
        stages {
            stage('Git Checkout'){
                steps {
                    git branch: 'main', url: 'https://github.com/anurag33/jenkinsknowledge'
                }
            }   
            
            stage("Pull Source Code from Github"){
                steps{
                    git branch: 'main', url: 'https://github.com/anurag33/jenkinsknowledge.git'
                }
            }
            
            stage("Building Docker Images"){
                steps{
                    script{
                        sh 'docker image build -t $JOB_NAME:v1.$BUILD_ID .'
                        sh 'docker image tag $JOB_NAME:v1.$BUILD_ID anuragkmr328/$JOB_NAME:v1.$BUILD_ID'
                        sh 'docker image tag $JOB_NAME:v1.$BUILD_ID anuragkmr328/$JOB_NAME:latest'
                    }
                }
            }
            
            stage("Push Image to Docker Hub"){
                steps{
                    script{
                        withCredentials([string(credentialsId: 'dockerhub_id', variable: 'dockerhub_id')]) {
                            sh 'docker login -u anuragkmr328 -p ${dockerhub_id}'
                            sh 'docker image push anuragkmr328/$JOB_NAME:v1.$BUILD_ID'
                            sh 'docker image push anuragkmr328/$JOB_NAME:latest'
                            sh 'docker image rmi $JOB_NAME:v1.$BUILD_ID anuragkmr328/$JOB_NAME:v1.$BUILD_ID anuragkmr328/$JOB_NAME:latest'
                        }
                    }
                }
            }
            
            stage("Stop and remove existing Docker Container"){
                steps{
                    script{
                        sshagent(['dockerhostpassword']){
                            sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.33.159 ${dockercostop}"
                            sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.33.159 ${dockercorm}"
                        }
                    }
                }
            }
            
            stage("Deployment of Docker Container"){
                steps{
                    script{
                        sshagent(['dockerhostpassword']){
                            sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.33.159 ${dockerrun}"
                        }
                    }
                }
            }
            
            
        }
    }
    
