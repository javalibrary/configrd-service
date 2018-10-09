
FROM openjdk:8-jdk-alpine
MAINTAINER Krzysztof Karski <krzysztof.karski@emergenttech.com>

ENV REPO_DEFS classpath:repo-defaults.yml

COPY ./target/appconfig-service-*-jar-with-dependencies.jar /apps/
WORKDIR /apps
RUN mv ./appconfig-service-*-jar-with-dependencies.jar ./appconfig-service.jar

EXPOSE 9191
ENTRYPOINT java -Djava.security.egd=file:/dev/./urandom -Dconfigrd.config.location=$REPO_DEFS -jar ./appconfig-service.jar 9191