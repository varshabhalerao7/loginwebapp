FROM tomcat:latest   
RUN apt-get update && apt-get install -y unzip
COPY LoginWebApp.war /usr/local/tomcat/webapps/LoginWebApp.war
ENV DB_URL=jdbc:mysql://database-1.cpak8eaoksrp.ap-south-1.rds.amazonaws.com:3306/login
ENV DB_USERNAME=hemant
ENV DB_PASSWORD=hemant123456
RUN mkdir /usr/local/tomcat/webapps/LoginWebApp
RUN unzip -q /usr/local/tomcat/webapps/LoginWebApp.war -d /usr/local/tomcat/webapps/LoginWebApp
RUN sed -i 's|jdbc:mysql://localhost:3306/test|'"$DB_URL"'|' /usr/local/tomcat/webapps/LoginWebApp/userRegistration.jsp
RUN sed -i 's|root|'"$DB_USERNAME"'|' /usr/local/tomcat/webapps/LoginWebApp/userRegistration.jsp
RUN sed -i 's|root|'"$DB_PASSWORD"'|' /usr/local/tomcat/webapps/LoginWebApp/userRegistration.jsp
RUN sed -i 's|jdbc:mysql://localhost:3306/test|'"$DB_URL"'|' /usr/local/tomcat/webapps/LoginWebApp/login.jsp
RUN sed -i 's|root|'"$DB_USERNAME"'|' /usr/local/tomcat/webapps/LoginWebApp/login.jsp
RUN sed -i 's|root|'"$DB_PASSWORD"'|' /usr/local/tomcat/webapps/LoginWebApp/login.jsp
CMD ["catalina.sh", "run"]
