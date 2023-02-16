<br />
<br />
<p align="center">
    <a href="https://www.tduckcloud.com" target="_blank" rel="noopener noreferrer">
        <img style="margin-bottom: 0px;" width="80px" src="https://oss.tduckcloud.com/lading-image/ICO-icon.png" alt="TDUCK logo" />
    </a>
</p>

<p align="center">一款在线数据收集/问卷调查工具</p>

<p align="center">
    <img src='https://gitee.com/TDuckApp/tduck-platform/badge/star.svg?theme=dark' alt='star'></img>
    <img src='https://gitee.com/TDuckApp/tduck-platform/badge/fork.svg?theme=dark' alt='fork'></img>
    <img src='https://img.shields.io/github/stars/tduckcloud/tduck-platform?style=social' alt='star'></img>
    <img src='https://img.shields.io/github/forks/tduckcloud/tduck-platform?style=social' alt='fork'></img>
    <br />
    <br />   
    <a href="https://www.tduckcloud.com/" target="_blank">官方网站</a>&nbsp;
    <a href="https://doc.tduckcloud.com"  target="_blank" >部署文档</a>&nbsp;
    <a href="https://pro.tduckcloud.com/s/QUiDSKq8" target="_blank">微信社区</a>&nbsp;
    <a href="https://space.bilibili.com/409825300" target="_blank">bilibili频道</a>
</p>

<br />
目前市面上的表单平台虽然功能强大，但是部分业务组件或者额外收取存储等费用，且费用较高，在数据隐私性较强且有特殊表单需求的场景下无法满足业务需求，国内的开源表单系统比较少，tduck表单应运而生。愿景能够让企业低成本拥有独立自定义表单问卷，快速赋能业务。

------------------------------


##  🚀 立即体验
- 在线体验：<a href="http://www.tduckcloud.com" target="_blank">演示地址</a>
- 默认账号：test@tduckapp.com
- 默认密码：12345678

##  快速启动 <a href="https://doc.tduckcloud.com" target="_blank">部署文档</a>

#### 配置最小开发环境：

   * [MySQL5.7或以上](https://dev.mysql.com/downloads/mysql/)
   * [JDK1.8或以上](http://www.oracle.com/technetwork/java/javase/overview/index.html)
   * [Maven](https://maven.apache.org/download.cgi)
   * [Nodejs](https://nodejs.org/en/download/)

#### 创建一个tduck的数据库  **版本≥mysql5.7**  ，并执行项目目录下doc/tduck.sql文件

#### 1️⃣ 启动后端

   打开命令行，输入以下命令

   ```bash
   mvn clean install -DskipTests
   cd tduck-platform/tduck-api
   mvn clean package -DskipTests
   java -Dfile.encoding=UTF-8 -jar target/tduck-api.jar
   ```

#### 2️⃣ 启动前端

   打开命令行，输入以下命令

   ```bash
   npm install -g cnpm --registry=https://registry.npm.taobao.org
   cd tduck-front
   cnpm install
   cnpm run serve
   ```
   浏览器打开，输入网址`http://localhost:8888`, 进入页面。


### 项目源码

|   后端源码  |   前端源码  |
|--- | --- |
|  https://gitee.com/TDuckApp/tduck-platform   |  https://gitee.com/TDuckApp/tduck-front   |
|  https://github.com/TDuckCloud/tduck-platform   |  https://github.com/TDuckCloud/tduck-front   |


##  技术体系

### 服务端

```
- SpringBoot 
- Mybatis-Plus
- Lombok
- Hutool
- Guava
```

### 客户端

```
- Vue2
- ElementUI
- Echarts
- Axios
- nprogress
```

### 后端结构

-  tduck-common 通用模块
-  tduck-account 账号模块
-  tduck-storage 存储模块
-  tduck-project 项目模块
-  tduck-wx-mp  微信公众号模块
-  tduck-api 客户端API

