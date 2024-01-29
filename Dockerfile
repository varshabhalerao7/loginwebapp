FROM tomcat:latest   
RUN apt-get update && apt-get install -y unzip
COPY /mnt/vsk/loginwebapp/target/*.war /mnt/vsk/loginwebapp
ENV DB_URL=jdbc:mysql://database-1.clua88iws303.ap-south-1.rds.amazonaws.com:3306/login
ENV DB_USERNAME=kanu
ENV DB_PASSWORD=kanu1234567
RUN mkdir /usr/local/tomcat/webapps/LoginWebApp
RUN unzip -q /usr/local/tomcat/webapps/LoginWebApp.war -d /usr/local/tomcat/webapps/LoginWebApp
RUN sed -i 's|jdbc:mysql://localhost:3306/test|'"$DB_URL"'|' /usr/local/tomcat/webapps/LoginWebApp/userRegistration.jsp
RUN sed -i 's|root|'"$DB_USERNAME"'|' /usr/local/tomcat/webapps/LoginWebApp/userRegistration.jsp
RUN sed -i 's|root|'"$DB_PASSWORD"'|' /usr/local/tomcat/webapps/LoginWebApp/userRegistration.jsp
RUN sed -i 's|jdbc:mysql://localhost:3306/test|'"$DB_URL"'|' /usr/local/tomcat/webapps/LoginWebApp/login.jsp
RUN sed -i 's|root|'"$DB_USERNAME"'|' /usr/local/tomcat/webapps/LoginWebApp/login.jsp
RUN sed -i 's|root|'"$DB_PASSWORD"'|' /usr/local/tomcat/webapps/LoginWebApp/login.jsp
CMD ["catalina.sh", "run"]
