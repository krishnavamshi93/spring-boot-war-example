pipeline{
    agent any
     tools {
        maven "maven"
    }
     
    stages{
        stage("Git Checkout"){
            steps{
                git credentialsId: 'shankar', url: 'git@github.com:Shankargoud1/spring-boot-war-example.git'
            }
        }
        stage("Maven Build"){
            steps{
                sh "mvn clean package"
                sh "mv target/*.war target/hello-world-SNAPSHOT.war"
            }
        }
        stage("deploy-dev"){
            steps{
                sshagent(['tomcat-new']) {
                sh """
                    scp -o StrictHostKeyChecking=no target/hello-world-SNAPSHOT.war  ec2-user@172.31.10.135:/home/ec2-user/tomcat/apache-tomcat-9.0.71/webapps/
                    
                    ssh ec2-user@172.31.10.135 /home/ec2-user/tomcat/apache-tomcat-9.0.71/bin/shutdown.sh
                    
                    ssh ec2-user@172.31.10.135 /home/ec2-user/tomcat/apache-tomcat-9.0.71/bin/startup.sh
                
                """
            }
            
            }
        }
    }
}
