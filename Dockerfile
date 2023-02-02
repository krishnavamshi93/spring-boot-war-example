FROM tomcat:9

COPY target/*.war /home/ec2-user/tomcat/apache-tomcat-9.0.71/webapps/hello-world-SNAPSHOT.war
