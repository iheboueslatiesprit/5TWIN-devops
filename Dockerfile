FROM openjdk:11
MAINTAINER esprit.tn
COPY target/tpAchatProject-1.0.jar tpAchatProject-1.0.jar
ENTRYPOINT ["java","-jar","/tpAchatProject.jar"]

