package com.tduck.cloud.common.email;

import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import com.tduck.cloud.common.util.SpringContextUtils;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.File;
import java.util.Map;

/**
 * 邮件发送实现
 *
 * @author smalljop
 */
@Slf4j
@UtilityClass
public class MailService {


    /**
     * 发送文本邮件
     *
     * @param toAddr
     * @param title
     * @param content
     */
    public void sendTextMail(String toAddr, String title, String content) {
        // 纯文本邮件对象
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(MailConfiguration.getProp().getUsername());
        message.setTo(toAddr);
        message.setSubject(title);
        message.setText(content);
        MailConfiguration.getMailSender().send(message);
        log.info("Text邮件已经发送。");
    }

    /**
     * 发送html邮件
     *
     * @param toAddr
     * @param title
     * @param content
     */
    public void sendHtmlMail(String toAddr, String title, String content) throws MessagingException {
        // html 邮件对象
        MimeMessage message = MailConfiguration.getMailSender().createMimeMessage();

        //true表示需要创建一个multipart message
        MimeMessageHelper helper = new MimeMessageHelper(message, true);
        helper.setFrom(MailConfiguration.getProp().getUsername());
        helper.setTo(ArrayUtil.toArray(StrUtil.splitTrim(toAddr, ";"), String.class));
        helper.setSubject(title);
        helper.setText(content, true);
        MailConfiguration.getMailSender().send(message);
        log.info("html邮件发送成功");
    }

    public void sendTemplateHtmlMail(String toAddr, String title, String template, Map<String, Object> params) throws MessagingException {
        Context context = new Context();
        context.setVariables(params);
        TemplateEngine templateEngine = SpringContextUtils.getBean(TemplateEngine.class);
        String emailHTMLContent = templateEngine.process(template, context);
        sendHtmlMail(toAddr, title, emailHTMLContent);
    }


    /**
     * 发送带附件的邮件
     *
     * @param toAddr
     * @param title
     * @param content
     * @param filePath
     */
    public void sendAttachmentsMail(String toAddr, String title, String content, String filePath) throws MessagingException {
        MimeMessage message = MailConfiguration.getMailSender().createMimeMessage();

        MimeMessageHelper helper = new MimeMessageHelper(message, true);
        helper.setFrom(MailConfiguration.getProp().getUsername());
        helper.setTo(toAddr);
        helper.setSubject(title);
        helper.setText(content, true);

        FileSystemResource file = new FileSystemResource(new File(filePath));
        String fileName = filePath.substring(filePath.lastIndexOf(File.separator));
        helper.addAttachment(fileName, file);
        //helper.addAttachment("test"+fileName, file);

        MailConfiguration.getMailSender().send(message);
        log.info("带附件的邮件已经发送。");
    }


    /**
     * 发送正文中有静态资源（图片）的邮件
     *
     * @param toAddr
     * @param title
     * @param content
     * @param rscPath
     * @param rscId
     */
    public void sendInlineResourceMail(String toAddr, String title, String content, String rscPath, String rscId) throws MessagingException {
        MimeMessage message = MailConfiguration.getMailSender().createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);
        helper.setFrom(MailConfiguration.getProp().getUsername());
        helper.setTo(toAddr);
        helper.setSubject(title);
        helper.setText(content, true);

        FileSystemResource res = new FileSystemResource(new File(rscPath));
        helper.addInline(rscId, res);

        MailConfiguration.getMailSender().send(message);
        log.info("嵌入静态资源的邮件已经发送。");
    }
}

