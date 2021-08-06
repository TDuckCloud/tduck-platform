package com.tduck.cloud.common.sms;

import cn.hutool.core.util.StrUtil;
import com.tencentcloudapi.common.Credential;
import com.tencentcloudapi.common.exception.TencentCloudSDKException;
import com.tencentcloudapi.sms.v20190711.SmsClient;
import com.tencentcloudapi.sms.v20190711.models.SendSmsRequest;
import com.tencentcloudapi.sms.v20190711.models.SendSmsResponse;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;


/**
 * @author : smalljop
 * @description : 腾讯云短信
 * @create : 2020-12-15 10:33
 **/

@Slf4j
@Data
public class TencentSmsServiceImpl extends SmsService {

    private SmsClient client;

    public TencentSmsServiceImpl(SmsPlatformProperties properties) {
        /* 必要步骤：
         * 实例化一个认证对象，入参需要传入腾讯云账户密钥对 secretId 和 secretKey
         * 本示例采用从环境变量读取的方式，需要预先在环境变量中设置这两个值
         * 您也可以直接在代码中写入密钥对，但需谨防泄露，不要将代码复制、上传或者分享给他人
         * CAM 密钥查询：https://console.cloud.tencent.com/cam/capi
         */
        Credential cred = new Credential(properties.getSecretId(), properties.getSecretKey());
        /* 实例化 SMS 的 client 对象
         * 第二个参数是地域信息，可以直接填写字符串 ap-guangzhou，或者引用预设的常量 */
        client = new SmsClient(cred, "ap-guangzhou");
        this.properties = properties;
    }


    @Override
    public boolean sendSms(String phoneNumber, String templateId, String... templateParams) {
        /* 填充请求参数，这里 request 对象的成员变量即对应接口的入参
         * 您可以通过官网接口文档或跳转到 request 对象的定义处查看请求参数的定义
         * 基本类型的设置:
         * 帮助链接：
         * 短信控制台：https://console.cloud.tencent.com/smsv2
         * sms helper：https://cloud.tencent.com/document/product/382/3773 */
        SendSmsRequest req = new SendSmsRequest();
        /* 短信应用 ID: 在 [短信控制台] 添加应用后生成的实际 SDKAppID，例如1400006666 */
        req.setSmsSdkAppid(properties.getAppId());

        /* 短信签名内容: 使用 UTF-8 编码，必须填写已审核通过的签名，可登录 [短信控制台] 查看签名信息 */
        req.setSign(properties.getSign());

        /* 模板 ID: 必须填写已审核通过的模板 ID，可登录 [短信控制台] 查看模板 ID */
        req.setTemplateID(templateId);

        /* 下发手机号码，采用 e.164 标准，+[国家或地区码][手机号]
         * 例如+8613711112222， 其中前面有一个+号 ，86为国家码，13711112222为手机号，最多不要超过200个手机号*/
//        String[] phoneNumbers = {"+8621212313123", "+8612345678902", "+8612345678903"};
        req.setPhoneNumberSet(new String[]{StrUtil.format("+86{}", phoneNumber)});

        /* 模板参数: 若无模板参数，则设置为空*/
        req.setTemplateParamSet(templateParams);

        /* 通过 client 对象调用 SendSms 方法发起请求。注意请求方法名与请求对象是对应的
         * 返回的 res 是一个 SendSmsResponse 类的实例，与请求对象对应 */
        SendSmsResponse res = null;
        try {
            res = client.SendSms(req);
        } catch (TencentCloudSDKException e) {
            e.printStackTrace();
        }
        // 输出 JSON 格式的字符串回包
        log.debug(SendSmsResponse.toJsonString(res));
        // 可以取出单个值，您可以通过官网接口文档或跳转到 response 对象的定义处查看返回字段的定义
        return true;
    }

    @Override
    public boolean sendValidateSms(String phoneNumber, String... templateParams) {
        this.sendSms(phoneNumber, properties.getValidateCodeTemplateId(), templateParams);
        return true;
    }

    @Override
    public boolean sendRetrievePwdValidateSms(String phoneNumber, String... templateParams) {
        this.sendSms(phoneNumber, properties.getRetrievePwdValidateCodeTemplateId(), templateParams);
        return false;
    }
}
