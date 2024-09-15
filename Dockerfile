# builder image
FROM eclipse-temurin:17-jdk-alpine AS builder

RUN mkdir /cicdk8s
WORKDIR /cicdk8s

COPY . .

RUN chmod +x gradlew
RUN ./gradlew clean bootJar -x test

# runtime image
FROM eclipse-temurin:17-jre-alpine

ENV TZ=Asia/Seoul
ENV PROFILE=${PROFILE}

RUN mkdir /cicdk8s
WORKDIR /cicdk8s

COPY --from=builder /cicdk8s/build/libs/cicdk8s-* /cicdk8s/app.jar

CMD ["sh", "-c", " \
    java -Dspring.profiles.active=${PROFILE} \
         -jar /cicdk8s/app.jar"]
## CMD ["java", "-Dspring.profiles.active=${PROFILE}", "-jar", "/app/app.jar"]
