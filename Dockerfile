FROM tomcat:latest

#RUN mkdir /usr/local/tomcat/webapps/myapp

COPY /target/test-webapp.war /usr/local/tomcat/webapps/myapp.war

CMD ["catalina.sh","run"]