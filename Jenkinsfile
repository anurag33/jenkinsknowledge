pipeline{
    
    agent any
    
    environment {
        registry = 'anuragkmr328/docker-pipeline-job'
        registryCredential = 'dockerhubpassword'
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
                        dockerImage = docker.build registry
                    }
                }
            }
            
            stage("Push Image to Docker Hub"){
                steps{
                    script{
                        docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                        }
                    }
                }
            }
            
        }
    }
    
