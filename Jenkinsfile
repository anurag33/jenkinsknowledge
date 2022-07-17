pipeline {
  agent any
  stages{
    
    stage("Git Checkout"){
      steps{
        git branch: 'main', url: 'https://github.com/anurag33/jenkinsknowledge'
      }
    }
    
    stage("Pull Source Code from Github"){
      steps{
        git branch: 'main', url: 'https://github.com/anurag33/jenkinsknowledge.git'
      }
    }
    
    stage("Build Docker File"){
      steps{
        sh 'docker image build -t $JOB_NAME:v1.$BUILD_ID .'
        sh 'docker image tag $JOB_NAME:v1.$BUILD_ID anuragkmr328/$JOB_NAME:v1.$BUILD_ID'
        sh 'docker image tag $JOB_NAME:v1.$BUILD_ID anuragkmr328/$JOB_NAME:latest'
      }
    }
    
  }
}
