# 자바 애플리케이션에 최적화된 openJDK 이미지에서 build라고 명여된 이미지를 생성
# 자바11이 설치된 openjdk:11-slim 이미지 사용
FROM openjdk:11-slim as build

LABEL maintainer="Sungbum Kang <qparanoya@gmail.com">
ARG JAR_FILE
COPY ${JAR_FILE} app.jar
RUN mkdir -p target/dependency && (cd target/dependency; jar -xf /app.jar)
FROM openjdk:11-slim
VOLUME /tmp
ARG DEPENDENCY=/target/dependency
# BOOT-INF/lib 에는 애플리케이션 실행에 필요한 모든 내외부 의존성을 포함한다.
COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java", "-cp", "app:app/lib/*", "com.genug.spring.msa.SpringMsaApplication"]