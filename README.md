<p></p>
<p></p>
<p align="left">
  <img alt="logo" src="https://images.gitee.com/uploads/images/2021/0120/114533_b7f16f5b_1674451.png" width="120" style="margin-bottom: 0px;">
</p>
<h2 align="left">Tduck 填鸭 —— 让每个企业都有自己的表单收集系统</h2>
![](https://img.shields.io/:license-apache-blue.svg) ![](https://img.shields.io/badge/JDK-1.8+-green.svg) 


## 平台简介

Tduck,  Form collection system

Tduck 填鸭：是一款基于B/S架构的表单收集系统，为企业构建自己的信息反馈系统的综合解决方案，助力企业提高反馈收集客户服务效率。



## 应用场景

主要应用与泛零售、电商、金融、调研、资料收集等行业用户，提供多种工具、多渠道、多方式收集有效信息，更好的提升客户服务，增加客户满意度。

## 功能特性

三大模块助力企业营销能力升级：

新建表单：自定义可拖拽式表单设计
表单设置：支持多种收集方式设置
反馈统计：多维度统计收集的反馈数据



## 在线体验

演示地址：http://tduck.smileyi.top/ （访问比较慢）

演示账号/密码：可注册登录或使用测试账号  test@tduck.com/12345678

## 技术体系

### 服务端

- SpringBoot  2.3.5
- Mybatis-Plus
- Lombok
- Hutool
- Guava



### 客户端

- Vue2
- ElementUI
- Echarts
- Axios
- nprogress



### 后端项目结构

-  tduck-common 通用模块
-  tduck-account 账号模块
-  tduck-storage 存储模块
-  tduck-project 项目模块
-  tduck-wx-mp  微信公众号模块
-  tduck-api 客户端API



### 快速启动

1. 配置最小开发环境：

   * [MySQL](https://dev.mysql.com/downloads/mysql/)
   * [JDK1.8或以上](http://www.oracle.com/technetwork/java/javase/overview/index.html)
   * [Maven](https://maven.apache.org/download.cgi)
   * [Nodejs](https://nodejs.org/en/download/)
   * [微信开发者工具](https://developers.weixin.qq.com/miniprogram/dev/devtools/download.html)

2. 创建一个tduck的数据库，并执行项目目录下doc/tduck.sql文件

3. 启动后端服务

   打开命令行，输入以下命令

   ```bash
   cd tduck-platform/tduck-api
   mvn clean package -DskipTests
   java -Dfile.encoding=UTF-8 -jar tduck-api.jar
   ```

4. 启动管理后台前端

   打开命令行，输入以下命令

   ```bash
   npm install -g cnpm --registry=https://registry.npm.taobao.org
   cd tduck-front
   cnpm install
   cnpm run serve
   ```

   此时，浏览器打开，输入网址`http://localhost:8888`, 进入页面。


#### 项目源码

|   后端源码  |   前端源码  |
|--- | --- |
|  https://gitee.com/TDuckApp/tduck-platform   |  https://gitee.com/TDuckApp/tduck-front   |

## 项目规划
![tduck登录页](https://images.gitee.com/uploads/images/2021/0112/124009_1573a7c5_1674451.png "屏幕截图.png")
![首页](https://images.gitee.com/uploads/images/2021/0112/124033_27eb486e_1674451.png "屏幕截图.png")
![我的表单](https://images.gitee.com/uploads/images/2021/0112/124102_c1615270_1674451.png "屏幕截图.png")
![自定义编辑](https://images.gitee.com/uploads/images/2021/0112/124136_db03b4ce_1674451.png "屏幕截图.png")
目前完成框架，细节正在不断完善中，欢迎提出更多意见~

## 加入社群
![输入图片说明](https://images.gitee.com/uploads/images/2021/0112/123754_9128ad9b_1674451.png "屏幕截图.png")

**TDuck 使用 Apache License 2.0 协议，源代码完全开源，无商业限制。 
开源不易如果喜欢请给作者 Star 鼓励 👇**