FROM adoptopenjdk/openjdk11

WORKDIR /usr/app

COPY target/*.jar /usr/app/

ARG value

ENV envValue=$value

#RUN ls -lrt calculator-api-${envValue}.jar

#ENTRYPOINT ["java","-jar","calculator-api-${envValue}.jar"]
CMD java -jar -Dserver.port=$PORT java-maven-quickstart-actions-${envValue}.jar
HEALTHCHECK CMD curl -s --fail http://localhost:8080/addition/1/2/3 || exit 1
