FROM centos:7

MAINTAINER wigamu@hotmail.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-9/v9.0.54/bin/apache-tomcat-9.0.54.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-9.0.54/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
ADD ["appviwi.war", "/opt/tomcat/webapps/"]

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
