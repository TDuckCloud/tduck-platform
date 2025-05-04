![输入图片说明](doc/logo-banner.png)
<p align="center">
    <img src='https://gitee.com/TDuckApp/tduck-platform/badge/star.svg?theme=dark' alt='star'></img>
    <img src='https://gitee.com/TDuckApp/tduck-platform/badge/fork.svg?theme=dark' alt='fork'></img>
    <img src='https://img.shields.io/github/stars/tduckcloud/tduck-platform?style=social' alt='star'></img>
    <img src='https://img.shields.io/github/forks/tduckcloud/tduck-platform?style=social' alt='fork'></img>
    <img src='https://img.shields.io/badge/TduckSurvey-V5.0-brightgreen' alt='fork'></img>
    <img src='https://img.shields.io/badge/license-MIT%20-orange' alt='fork'></img>
    <br />
    <br />   
    <a href="https://www.tduckcloud.com/" target="_blank">Official Website</a>&nbsp;
    <a href="https://doc.tduckcloud.com"  target="_blank" >Deployment Document</a>&nbsp;
    <a href="https://gitee.com/TDuckApp/tduck-platform/issues" target="_blank">User Community</a>&nbsp;
    <a href="https://space.bilibili.com/409825300" target="_blank">Bilibili Channel</a>
</p>



**<p align="center">If you find our open-source project helpful, please click :star: Star to support the TDuck open-source team:heart:</p>**

---


Simplified Chinese |  [English](./README_en.md)


## I. About TDuck

TDuck Fill-in-the-Blank Form is one of the first open-source questionnaire/form collection tools in China based on Vue.

The system adopts the concept of no-code design. Users can create questionnaire forms by dragging and dropping, with a what-you-see-is-what-you-get experience. At the same time, it also supports professional technicians to develop custom components on their own to meet the personalized needs of different enterprises and organizations. The system uses the SpringBoot+Vue+ElementUI technology stack, which can be quickly mastered without complex learning. It is powerful, has a fresh UI interface, and can quickly empower business for enterprises and organizations through brief deployment.

### Functional Features

- Supports more than 27 custom components, enabling the quick generation of form questionnaires through drag-and-drop.
- Supports components such as single-line text, multi-line text, date, drop-down, radio button, file upload, sorting, cascading, carousel, one-click positioning, mobile phone number verification, matrix scale, sub-form, etc.
- Supports batch import of form components through text and setting of question visibility logic.
- For form data, it supports data addition, editing, export, printing, preview, and packaged download of attachments.
- The form appearance supports configurations such as header image, background image, background color, button text, etc.
- The report supports real-time statistical analysis of questions and displays and exports them in the form of graphics (bar charts, line charts, pie charts) and png images.
- Customized copy after submission and automatic redirection to a specified website after submission.
- Limits for each WeChat account, IP address, device, and number of responses. It also supports setting the allowed filling time and recording WeChat personal information.
- Supports email sending and WeChat official account template push reminders.
- Supports Data Synchronization API (full data) and Data WebHook push (subscribable events: addition, modification, deletion).
- Supports saving to the template center and creating form questionnaires using templates from the template center.
- User management, including adding users, modifying users, and deleting users.
- Custom configuration for file storage: Supports Alibaba Cloud, Qiniu Cloud, Upyun, local storage, and general S3 protocol upload.
- Supports parameter configuration for email, SMS (Alibaba Cloud, Tencent Cloud, Zhongyu Weixin), and WeChat official account.
- Supports a recycle bin for quickly restoring questionnaires.
- Supports configuring the TReport visual big screen for efficient data display: https://gitee.com/TDuckApp/tduck-report-platform



---

### Other Products

[TDuckPro-Vue2 Version of TDuck Fill-in-the-Blank Form](https://pro.tduckcloud.com);

[TDuckX-Vue3 Version of TDuck Fill-in-the-Blank Form](https://x.tduckcloud.com);

[TReport Visual Big Screen of TDuck Fill-in-the-Blank Form](https://report.tduckcloud.com);


> ps: There are three versions of the form system (Community, Pro, TDuckX). For those who are confused here, you can check out [Function Comparison of TDuck Fill-in-the-Blank Form](https://docs.qq.com/sheet/DSUhoR2pOc2RuZ0Va?tab=BB08J2)

The data of all versions of the TDuck fill-in-the-blank form can be integrated into the big screen through WebHook to achieve data synchronization: [Tutorial on Data Synchronization between Form and TReport](https://www.bilibili.com/video/BV1MH4y1K7Xa/);

---

### II. Community Activities
The form editor of the community version has not been open-sourced for the time being. This module is referenced via npm, which does not affect its use or the secondary development of other functions.

You can obtain the source code of the latest form editor of the community version by contributing to the project! (Limited time)

How to participate in the activity: [Click to view](https://doc.tduckcloud.com/openSource/activity.html)

The development of the project depends on your support. Please light up the star if it helps.

![Login](readmeImages/star.gif)

---

### III. How to Experience and Documentation
- Check out the online experience of different versions at <a href="http://www.tduckcloud.com" target="_blank">Online Experience</a>
- For one-click installation using Baota, please refer to <a href="https://doc.tduckcloud.com/openSource/deploy/deployforbt.html" target="_blank">Project Documentation</a>
- Front-end project address: https://gitee.com/TDuckApp/tduck-front

- Community version experience address: https://demo.tduckapp.com/home
- Official website: https://www.tduckcloud.com
- Mini-program plugin (not applicable to the community version): https://doc.tduckcloud.com/functionDesc/uniappDesc.html

### IV. Project Deployment
> - Deployment administrator account: admin@tduckcloud.com
> - Default deployment password: 123456


#### 【🔥Recommended】One-click Installation Using Baota Panel
Detailed documentation: https://doc.tduckcloud.com/openSource/deploy/deployforbt.html


*There is no technical difficulty. As long as you can install the Baota panel, you can select TDuck Fill-in-the-Blank Form in the software store and click to install it.



#### ①Quick Start Using Docker Command
```shell
docker run -e SPRING_DATASOURCE_URL="jdbc:mysql://127.0.0.1:3310/tduck-v4?useSSL=false&useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai&tinyInt1isBit=false&nullCatalogMeansCurrent=true" -e SPRING_DATASOURCE_USERNAME=root -e SPRING_DATASOURCE_PASSWORD=tduck@tduck -p 8999:8999  -v /upload:/application/BOOT-INF/lib/upload  tduckcloud/tduck-platform
```
#### ②Deploy the Environment and Project Using Docker-compose
```shell
1. Install docker-compose first.
2. Download the tduck source code.
3. Enter the docker directory under the project directory: cd docker, and execute the command: docker-compose up.
4. After running, it will automatically install mysql and the tduck program.
```
#### ③Deploy the Project Using Baota
- Deployment documentation: https://doc.tduckcloud.com/openSource/deploy/openSourceDeploy.html
- Use the specified configuration file: https://doc.tduckcloud.com/openSource/deploy/startByProfile.html

#### ④Separate Deployment of Front-end and Back-end
- Deployment documentation: https://doc.tduckcloud.com/openSource/deploy/fenli.html
- Common problems: https://doc.tduckcloud.com/openSource/deploy/usualQuestion.html

### V. About Problem Consultation
- If you encounter problems during the use of the community version, you can check the common problems in the community or leave a message for help - [Click to enter the TDuck Q&A Community](https://gitee.com/TDuckApp/tduck-platform/issues)
------------------------------

### VI. Preview - Community Version - Preview

![Login](readmeImages/screely-1680875090915.png)
![My Projects](readmeImages/screely-1713235168567.png)
![Form Designer](readmeImages/screely-1680873554938.png)
![Template Center](readmeImages/screely-1680874308945.png)
![Logic Setting](readmeImages/screely-1680873488767.png)
![User Management](readmeImages/screely-1713235303271.png)
![System Configuration](readmeImages/screely-1713235232698.png)
![Recycle Setting](readmeImages/screely-1680873612592.png)
![Data Details](readmeImages/screely-1680873703554.png)
![Save Template](readmeImages/screely-1680873844396.png)
![Publish Form](readmeImages/screely-1680873661475.png)
![Statistical Overview](readmeImages/screely-1680873817576.png)
![Appearance Setting](readmeImages/screely-1680873577743.png)


### VII. Disclaimer

**Recently, we received feedback from relevant units that some users are engaging in illegal activities while using the TDuck fill-in-the-blank form product**.

TDUCK fill-in-the-blank form has always strictly abided by relevant national laws and regulations, committed to ensuring the safety of the platform and users, and providing users with a green, safe, healthy, and convenient tool. To this end, TDUCK hereby issues the following optimized disclaimer:

TDUCK fill-in-the-blank form only displays product information through the official website tduckcloud.com and provides the sales contact information introduced on the official website for direct sales. We have not authorized any distributors, nor do we have any branch offices, agents, representative offices, or dealers selling products under the TDUCK brand.

Any user shall not use TDUCK's products to engage in illegal activities and must use the products legally and compliantly. If we discover that any customer is engaging in illegal activities while using the product, **we will fully cooperate with relevant authorities in investigations or report to government departments**. TDUCK shall not bear any legal liability arising from the illegal acts of customers.

TDUCK fill-in-the-blank form does not provide any form of guarantee. All resources related to the use of this site are at the direct risk of the customer.

TDUCK fill-in-the-blank form has always adhered to the legal and compliant development and sales of software products. We sincerely hope that all users will abide by national laws and regulations and use our products legally.

This is hereby declared. 