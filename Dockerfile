FROM tomcat:latest

#RUN mkdir /usr/local/tomcat/webapps/myapp
RUN apk add --no-cache curl
COPY /target/test-webapp.war /usr/local/tomcat/webapps/myapp.war

CMD ["catalina.sh","run"]