FROM tomcat:10.1-jdk21
WORKDIR /usr/local/tomcat/webapps
COPY target/*.war /usr/local/tomcat/webapps/myfirstproject.war
EXPOSE 8080