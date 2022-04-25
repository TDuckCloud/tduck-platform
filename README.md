
##  _TDUCK_  填鸭表单收集器


目前市面上的表单平台虽然功能强大，但是部分业务组件或者额外收取存储等费用，且费用较高，在数据隐私性较强且有特殊表单需求的场景下无法满足业务需求，国内的开源表单系统比较少，tduck表单应运而生。愿景能够让中小企业低成本拥有独立自定义表单问卷，快速赋能业务。




###  :fire:   开源版演示地址
- 演示地址：https://www.tduckcloud.com
- 演示账号/密码：扫码登录即可
- 文档地址：https://www.yuque.com/tduck/home
- 部署默认账号： test@tduckapp.com/12345678
![输入图片说明](https://oss.tduckcloud.com/%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_20220224113836.png)



###  :fire:   PRO版演示地址
- 演示地址：https://www.tduckcloud.com
- 演示账号/密码：test/12345678
![输入图片说明](https://s1.ax1x.com/2022/04/08/LptAVP.png)
![输入图片说明](https://s1.ax1x.com/2022/04/08/LptV58.png)
![输入图片说明](https://s1.ax1x.com/2022/04/08/Lpt6PO.png)
![输入图片说明](https://s1.ax1x.com/2022/04/08/LptUxJ.png)


##  :star:  快速启动


1. 配置最小开发环境：

   * [MySQL5.7或以上](https://dev.mysql.com/downloads/mysql/)
   * [JDK1.8或以上](http://www.oracle.com/technetwork/java/javase/overview/index.html)
   * [Maven](https://maven.apache.org/download.cgi)
   * [Nodejs](https://nodejs.org/en/download/)

2. 创建一个tduck的数据库  **版本选择mysql5.7**  ，并执行项目目录下doc/tduck.sql文件

3. 启动后端服务

   打开命令行，输入以下命令

   ```bash
   mvn clean install -DskipTests
   cd tduck-platform/tduck-api
   mvn clean package -DskipTests
   java -Dfile.encoding=UTF-8 -jar target/tduck-api.jar
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


##  :star:  一键部署：

部署文件下载方式：关注公众号  **"TDUCK填鸭"**  ，回复“部署文件”，下载我们提供的简化部署文件

注意事项：部署之前需要先安装JDK8

## 部署步骤：

##### 1. 导入数据库 目前只支持mysql5.7及以上版本
创建数据名为  **`tduck`**
下载`tduck-v3.sql`文件 并且导入创建的数据中

##### 2. 下载项目jar文件
下载项目jar包文件`tduck-api.jar`到本地

##### 3.修改配置并启动项目
下载`application-custom.yml `配置文件
把下载的jar包和配置文件放在同一个目录下
修改为自己的配置，主要修改位置为数据库以及文件存储配置

##### 4.运行项目
运行如下命令启动项目
```bash
java -Dfile.encoding=UTF-8 -jar tduck-api.jar --spring.profiles.active=custom
```
出现如下提示代表启动完成

##### 5.访问项目
浏览器地址栏输入http://localhost:8999/
默认账号密码：test@tduck.com/12345678


### 宝塔部署教程

视频教程：https://www.bilibili.com/video/BV1gS4y1Y7bw/


宝塔配置参数：
``` bash
/usr/local/btjdk/jdk8/bin/java -jar -Xmx1024M -Xms256M  /www/wwwroot/xxxx.jar --server.port=5097  --spring.datasource.url=jdbc:mysql://localhost:3306/tduck --spring.datasource.username=root --spring.datasource.password=root
```


 :warning: 注意事项：上述参数需要改成自己的路径，且mysql版本需要选择  **5.7**



##  :star:  技术体系

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

### 项目源码

|   后端源码  |   前端源码  |
|--- | --- |
|  https://gitee.com/TDuckApp/tduck-platform   |  https://gitee.com/TDuckApp/tduck-front   |
|  https://github.com/TDuckCloud/tduck-platform   |  https://github.com/TDuckCloud/tduck-platform   |


### 开源版特性
- 【公开反馈结果】 公开反馈结果设置，开启后填写完成将看到他人填写结果
- 【表单逻辑】支持对单选，多选框，下拉框等组件进行逻辑设置，目前仅支持选中 未选中等逻辑关系
- 【表单分页】支持对问卷问题较多时，进行分页
- 【手写签名】支持手写签名保存上传
- 【位置选择】支持高德地图进行地理位置选择
- 【手机验证】支持对输入手机号进行短信验证 验证通过则能保存
- 【省市联动】支持省市县联动选择输入
- 【图形选择】图片选择组件，支持单选多选
- 【图片展示】图片展示组件，展示二维码引流等
- 【图片轮播】图片轮播组件，图片和文字轮播显示
- 【文字描述】文件描述组件，支持颜色，位置设置
- 【微信功能】 微信功能增加开关配置，可配置关闭微信功能
- 【代码优化】对前后端代码进行部分优化，结构调整
- 【附件导出】填写完成后可对收集的附件进行导出zip下载
- 【统计筛选】可对填写完的结果进行筛选查询 支持模糊等
- 【表单预览】添加预览按钮，实时预览内容，预览二维码
- 【另存为模板】添加另存为模板按钮，保存项目为模板
- 【UI重构】项目整体UI全面重构，更美观，更简洁
- 【验证码】验证逻辑重构，支持验证码开关
- 【分割线】 内容分割线
- 【联系人】 手机号，邮箱，身份证输入 格式校验
- 【修改数据】支持修改已经提交的数据

### TDUCK社区
<img alt="logo" src="https://images.gitee.com/uploads/images/2021/0706/174654_31b12d64_1674451.png" style="margin-bottom: 0px;" width="150px">


### 致谢
- 感谢[Ucloud优刻得](https://www.ucloud.cn/)提供服务器资源
- 感谢公众号：“各种折腾”贡献详细部署文档
- 感谢博主[@daishenghui](https://daishenghui.club/)贡献docker镜像/视频
- 感谢捐赠区支持Tduck的伙伴
- 感谢积极为Tduck版本优化贡献力量的小伙伴
- 开源不易如果喜欢请给作者 Star 鼓励

### 了解更多
- [来看看TDUCK的新面孔](https://mp.weixin.qq.com/s/pLltfRv-KvStMxKefAvD_g)
- [参与TDUCK项目，贡献一份力量！](https://gitee.com/TDuckApp/tduck-platform/issues/I4ZC6R)
- [JAR包部署修改前端内容](https://www.yuque.com/mawuhui/kgacqz/zpubyn)
- [宝塔Jar包部署如何指定配置文件](https://www.yuque.com/mawuhui/kgacqz/paqc6g)

