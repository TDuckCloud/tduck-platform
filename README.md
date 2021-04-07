# 前言
### 各位老铁，感谢您的关注。
- Tduck项目上线时间不足一年，还有许多地方需要打磨；
- 由于不是专职做开源，更新速度相对缓慢，但是一直都在不停的迭代（加班打码...）
- 遇到问题可以进群咨询一下已经完成部署的大佬，并且在部署时参照部署文档进行部署；
- 由于涉及到微信、QQ登录需要准备相应账号；
- 详情请见：部署文档 https://gitee.com/TDuckApp/tduck-platform/wikis/%E6%9C%AC%E5%9C%B0%E8%BF%90%E8%A1%8C?sort_id=3681729


<p></p>
<p></p>
<p align="left">
  <img alt="logo" src="https://images.gitee.com/uploads/images/2021/0120/114533_b7f16f5b_1674451.png" width="130" style="margin-bottom: 0px;">
</p>
<h2 align="left">Tduck 填鸭 —— 表单收集器</h2>


![ ](https://img.shields.io/:license-apache-blue.svg)
![ ](https://img.shields.io/badge/JDK-1.8+-red.svg)
![ ](https://img.shields.io/badge/BY-SpringBoot-green)
![ ](https://img.shields.io/badge/front-vue%2Belement--ui-blue)
[![star](https://gitee.com/TDuckApp/tduck-platform/badge/star.svg?theme=white)](https://gitee.com/TDuckApp/tduck-platform/stargazers)
### 联系作者/加入社群
![输入图片说明](https://images.gitee.com/uploads/images/2021/0407/100054_10b7177d_1674451.png "微信截图_20210407095930.png")

## 群聊人数已经满200，需要手动拉入


## V2版本正在规划开发中，全新UI，更多功能；同时欢迎各位伙伴进群提出你的想法和需求
<p></p>

### 平台简介

Tduck,  Form collection system

Tduck 填鸭：是基于B/S架构的一款开源的表单问卷在线收集系统，为企业构建自己的信息反馈系统的综合解决方案，助力企业提高反馈收集客户服务效率。


### 应用场景

主要应用与泛零售、电商、金融、调研、资料收集等行业用户，提供多种工具、多渠道、多方式收集有效信息，更好的提升客户服务，增加客户满意度。


### 功能特性
##### 界面美观，全新element-ui支持，使用流畅
- 以一种全新的设计体验，告别繁琐的设计流程
- 通过简单有趣的方式，轻轻松松完成问卷设计
- 支持问卷样式模板选择，只为显现更精美的表单问卷

##### 三大模块助力企业能力升级：
- 新建表单：自定义可拖拽式表单设计
- 表单设置：支持多种收集方式设置
- 反馈统计：多维度统计收集的反馈数据


## 在线体验
![首页](https://images.gitee.com/uploads/images/2021/0120/121740_1fcdc627_1674451.png "屏幕截图.png")

演示地址：
 https://tduck.smileyi.top

演示账号/密码：可注册登录或使用测试账号  test@tduck.com/12345678

## 技术体系

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



### 快速启动


1. 配置最小开发环境：

   * [MySQL5.7或以上](https://dev.mysql.com/downloads/mysql/)
   * [JDK1.8或以上](http://www.oracle.com/technetwork/java/javase/overview/index.html)
   * [Maven](https://maven.apache.org/download.cgi)
   * [Nodejs](https://nodejs.org/en/download/)

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
![个人中心](https://images.gitee.com/uploads/images/2021/0308/141425_b5cf7846_1674451.png "微信截图_20210308141340.png")
目前完成框架，细节正在不断完善中，欢迎提出更多意见~


**TDuck 使用 Apache License 2.0 协议，源代码完全开源，无商业限制。 
开源不易如果喜欢请给作者 Star 鼓励 👇**
