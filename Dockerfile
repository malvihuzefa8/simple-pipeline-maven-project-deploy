FROM tomcat:10.1-jdk21
WORKDIR /app
COPY target/*.war /opt/tomcat/webapps/myfirstproject.war
EXPOSE 8080