pipeline {
  agent any
  
  environment{
    PATH = "/usr/share/maven:$PATH"
  }
  
  stages{
    stage("Git Checkout"){
      steps{
        git branch: 'main', url: 'https://github.com/anurag33/jenkinsknowledge'
      }
    }
    stage("Maven Build"){
      steps{
        sh "mvn clean package"
      }
    }
  }
}
