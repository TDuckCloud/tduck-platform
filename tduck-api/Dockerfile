# 使用 openjdk:8-jdk-alpine 作为基础镜像
FROM openjdk:8-jdk-alpine

# 安装字体和 fontconfig
RUN apk add --no-cache ttf-dejavu fontconfig

# 设置工作目录
WORKDIR /application

# 将构建好的 JAR 文件拷贝到容器中，假设你已经在本地生成了 JAR 文件
ARG JAR_FILE=target/tduck-api.jar
COPY ${JAR_FILE} application.jar

# 暴露 Spring Boot 默认的端口 8999
EXPOSE 8999

# 运行 Spring Boot 应用
ENTRYPOINT ["java", "-jar", "application.jar"]
