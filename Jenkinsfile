pipeline{
    agent any
    
    environment {
        registry = 'anuragkmr328/docker-pipeline-job'
        registryCredential = 'dockerhub_id'
        dockerImage =''
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
            
            stage("Docker stop container"){
                steps{
                    sh 'docker ps -f name=jenkinsknowledges -q | xargs --no-run-if-empty docker container stop'
                    sh 'docker container ls -a -fname=jenkinsknowledges -q | xargs -r docker container rm'
                }
            }
            
            
        }
    }
    
