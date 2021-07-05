### docker compose 一键启动

1. 将mvn package 后的`tduck-api.jar`拷贝到`docker`目录
2. 将前端打包后的`dist`里的文件拷贝到`docker/front`目录下
3. 在当前目录构建你的镜像  `docker build -t "你的镜像名称" .` 
4. 修改docker-compose.yaml 文件中的镜像名
5. `docker-compose up -d` 一键启动