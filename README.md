
<p align="center">
    <a href="https://www.tduckcloud.com" target="_blank" rel="noopener noreferrer">
        <img style="margin-bottom: 0px;" width="10px" src="https://oss.tduckcloud.com/lading-image/ICO-icon.png" alt="TDUCK logo" />
    </a>
</p>

<p align="center"><b>TDUCK</b> 数据收集，如此简单。</p>


<a href='https://gitee.com/TDuckApp/tduck-platform/stargazers'><img src='https://gitee.com/TDuckApp/tduck-platform/badge/star.svg?theme=dark' alt='star'></img></a>
<a href='https://gitee.com/TDuckApp/tduck-platform/members'><img src='https://gitee.com/TDuckApp/tduck-platform/badge/fork.svg?theme=dark' alt='fork'></img></a>
![GitHub Repo stars](https://img.shields.io/github/stars/tduckcloud/tduck-platform?style=social)
![GitHub forks](https://img.shields.io/github/forks/tduckcloud/tduck-platform?style=social)


> 目前市面上的表单平台虽然功能强大，但是部分业务组件或者额外收取存储等费用，且费用较高，在数据隐私性较强且有特殊表单需求的场景下无法满足业务需求，国内的开源表单系统比较少，tduck表单应运而生。愿景能够让企业低成本拥有独立自定义表单问卷，快速赋能业务。




###  开源版演示地址
- 演示地址：<a href="http://www.tduckcloud.com" target="_blank">开源演示地址</a>
- 登录方法：扫码登录即可
- 部署文档：<a href="https://www.yuque.com/tduck/home/vl7y79" target="_blank">点击查看部署文档</a>
- 部署默认账号： test@tduckapp.com/12345678



###  PRO版演示地址
- 演示地址：<a href="http://www.tduckcloud.com" target="_blank">PRO演示地址</a>
- 演示账号密码：test/12345678
![输入图片说明](https://s1.ax1x.com/2022/07/13/jWNO7n.png)
![输入图片说明](https://s1.ax1x.com/2022/07/13/jWUSpT.png)
![输入图片说明](https://s1.ax1x.com/2022/04/08/LptAVP.png)
![输入图片说明](https://s1.ax1x.com/2022/04/08/LptV58.png)
![输入图片说明](https://s1.ax1x.com/2022/04/08/Lpt6PO.png)
![输入图片说明](https://s1.ax1x.com/2022/04/08/LptUxJ.png)


##  快速启动


#### 配置最小开发环境：

   * [MySQL5.7或以上](https://dev.mysql.com/downloads/mysql/)
   * [JDK1.8或以上](http://www.oracle.com/technetwork/java/javase/overview/index.html)
   * [Maven](https://maven.apache.org/download.cgi)
   * [Nodejs](https://nodejs.org/en/download/)

#### 创建一个tduck的数据库  **版本选择mysql5.7**  ，并执行项目目录下doc/tduck.sql文件

#### 启动后端服务

   打开命令行，输入以下命令

   ```bash
   mvn clean install -DskipTests
   cd tduck-platform/tduck-api
   mvn clean package -DskipTests
   java -Dfile.encoding=UTF-8 -jar target/tduck-api.jar
   ```

#### 启动管理后台前端

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

### 后端项目结构

-  tduck-common 通用模块
-  tduck-account 账号模块
-  tduck-storage 存储模块
-  tduck-project 项目模块
-  tduck-wx-mp  微信公众号模块
-  tduck-api 客户端API

### TDUCK社区
<img alt="logo" src="https://images.gitee.com/uploads/images/2021/0706/174654_31b12d64_1674451.png" style="margin-bottom: 0px;" width="150px">


### 了解更多
- [来看看TDUCK的新面孔](https://mp.weixin.qq.com/s/pLltfRv-KvStMxKefAvD_g)
- [参与TDUCK项目，贡献一份力量！](https://gitee.com/TDuckApp/tduck-platform/issues/I4ZC6R)
- [JAR包部署修改前端内容](https://www.yuque.com/mawuhui/kgacqz/zpubyn)
- [宝塔Jar包部署如何指定配置文件](https://www.yuque.com/mawuhui/kgacqz/paqc6g)

