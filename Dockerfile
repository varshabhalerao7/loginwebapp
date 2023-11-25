FROM ubuntu as repo
WORKDIR /hemant
RUN git clone https://github.com/HEMANT-111/loginwebapp.git

FROM maven:3.8.4-openjdk-11 as build
WORKDIR /hsk
COPY --from=repo /hemant/LoginWebApp-web-application /hsk
RUN mvn install

FROM tomcat
COPY --from=build /hsk/target/*.war /usr/local/tomcat/webapps
