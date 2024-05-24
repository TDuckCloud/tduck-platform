package com.tduck.cloud.common.email;

import cn.hutool.core.util.ObjectUtil;
import com.tduck.cloud.common.util.JsonUtils;
import com.tduck.cloud.common.util.SpringContextUtils;
import com.tduck.cloud.envconfig.constant.ConfigConstants;
import com.tduck.cloud.envconfig.service.SysEnvConfigService;
import lombok.Data;
import lombok.Getter;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;

/**
 * @author : tduck
 * @description : 邮箱配置类
 * @create :  2021/12/28 17:13
 **/
public class MailConfiguration {

    @Getter
    private static JavaMailSender mailSender;
    @Getter
    private static Prop prop;

    static {
        buildMailSender();
    }


    public static synchronized void buildMailSender() {
        Prop properties = JsonUtils.jsonToObj(SpringContextUtils.getBean(SysEnvConfigService.class)
                .getValueByKey(ConfigConstants.EMAIL_ENV_CONFIG), Prop.class);
        if (ObjectUtil.isNull(properties)) {
            return;
        }
        JavaMailSenderImpl jms = new JavaMailSenderImpl();
        jms.setHost(properties.getHost().trim());
        jms.setPort(properties.getPort());
        jms.setUsername(properties.getUsername());
        jms.setPassword(properties.getPassword());
        jms.setProtocol("smtps");
        jms.setDefaultEncoding("Utf-8");
        Properties p = new Properties();
        p.setProperty("mail.smtp.auth", "true");
        jms.setJavaMailProperties(p);
        mailSender = jms;
        prop = properties;
    }


    @Data
    static class Prop {
        private String host;
        private Integer port;
        private String username;
        private String password;
    }


}
