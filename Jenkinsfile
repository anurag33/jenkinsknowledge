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
    
    stage("Push Image to Docker Hub"){
      steps{
        withCredentials([string(credentialsId: 'dockerhubpassword', variable: 'dockerhubpassword')]) {
          sh 'docker login -u anuragkmr328 -p ${dockerhubpassword}'
          sh 'docker image push anuragkmr328/$JOB_NAME:v1.$BUILD_ID'
          sh 'docker image push anuragkmr328/$JOB_NAME:latest'
          sh 'docker image rmi $JOB_NAME:v1.$BUILD_ID anuragkmr328/$JOB_NAME:v1.$BUILD_ID anuragkmr328/$JOB_NAME:latest'

      }
    }
   }
    
    stage("Deployment of Docker Container"){
      steps{
        def dockerrun = 'docker run -p 8000:80 -d --name jenkinsknowledges anuragkmr328/scripted-pipeline-demo:latest'
		    def dockerrm = 'docker container rm -f jenkinsknowledges scripted-pipeline-demo:latest'
		    def dockerimagerm = 'docker image rmi anuragkmr328/scripted-pipeline-demo:latest'
        sshagent(['dockerhostpassword']){
          sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.33.159 ${dockerrm}"
          sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.33.159 ${dockerimagerm}"
          sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.33.159 ${dockerrun}"
        }
      }
    }
    
  }
}
