pipeline{
    
    agent any
    
    environment {
        registry = 'anuragkmr328/myDockerPipelineJob'
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
                        dockerImage = docker.build registery
                    }
                }
            }
            
            
        }
    }
    
