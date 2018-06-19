FROM maven:3.5-jdk-8

# alpine runs into same error as openshift
#FROM maven:3.5-jdk-8-alpine

WORKDIR /app

COPY . /app

RUN chgrp -R 0 /app && chmod -R g=u /app

RUN mvn -PproductionMode package 

EXPOSE 8080

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dvaadin.productionMode","-jar","/app/target/ROOT.war"]