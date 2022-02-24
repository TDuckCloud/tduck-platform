## 前言
目前市面上的表单平台虽然功能强大，但是部分业务组件或者额外收取存储等费用，且费用较高，在数据隐私性较强且有特殊表单需求的场景下无法满足业务需求，国内的开源表单系统比较少，tduck表单应运而生。愿景能够让中小公司拥有独立自定义表单问卷，快速赋能业务。


#### 进一步了解
- 更新日志：[好久不见，来看看TDUCK的新面孔](https://mp.weixin.qq.com/s/pLltfRv-KvStMxKefAvD_g)
- 更新日志：[Pro版本更新日志](https://www.yuque.com/mawuhui/kgacqz/qsds2g)

## 部署准备：

部署文件下载方式：关注公众号"TDUCK填鸭"，回复“部署文件”，下载我们提供的简化部署文件

注意事项：部署之前需要先安装JDK8

## 部署步骤：

##### 1. 导入数据库 目前只支持mysql5.7及以上版本
创建数据名为`tduck`
下载`tduck-v3.sql`文件 并且导入创建的数据中

##### 2. 下载项目jar文件
下载项目jar包文件`tduck-api.jar`到本地

##### 3.修改配置并启动项目
下载`application-custom.yml `配置文件
把下载的jar包和配置文件放在同一个目录下
修改为自己的配置，主要修改位置为数据库以及文件存储配置

##### 4.运行项目
运行如下命令启动项目
`java -Dfile.encoding=UTF-8 -jar tduck-api.jar --spring.profiles.active=custom`
出现如下提示代表启动完成

##### 5.访问项目
浏览器地址栏输入http://localhost:8999/
默认账号密码：test@tduck.com/12356789

### 演示地址
- 开源版本：https://www.tduckcloud.com
- 演示账号/密码：扫码注册登录
- 部署默认账号： test@tduckapp.com/12345678

### PRO版本-全新表单引擎/工作流/多权限控制
- 演示地址：https://www.tduckcloud.com
- 账号密码：test/12345678
- pro使用文档/权益说明：https://www.yuque.com/mawuhui/kgacqz


### 加入社群
-  获取  **使用Docker运行Tduck**  教程请加入社群获取
-  获取  **tduck-纯小白部署教程**  请加入社群获取
<img alt="logo" src="https://images.gitee.com/uploads/images/2021/0706/174654_31b12d64_1674451.png" style="margin-bottom: 0px;" width="150px">


### 致谢
- 感谢[Ucloud优刻得](https://www.ucloud.cn/)提供服务器资源
- 感谢公众号：“各种折腾”贡献详细部署文档
- 感谢博主[@daishenghui](https://daishenghui.club/)贡献docker镜像/视频
- 感谢捐赠区支持Tduck的伙伴
- 感谢积极为Tduck版本优化贡献力量的小伙伴
- 开源不易如果喜欢请给作者 Star 鼓励	
