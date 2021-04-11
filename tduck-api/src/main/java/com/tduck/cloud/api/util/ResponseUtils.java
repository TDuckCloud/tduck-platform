package com.tduck.cloud.api.util;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;

/**
 * @author smalljop
 */
@Slf4j
public class ResponseUtils {

    /**
     * 使用response输出JSON
     *
     * @param response
     * @param result
     */
    public static void outJson(ServletResponse response, Object result) {

        PrintWriter out = null;
        try {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json");
            out = response.getWriter();
            out.println(new ObjectMapper().writeValueAsString(result));
        } catch (Exception e) {
            log.error(e + "输出JSON出错");
        } finally {
            if (out != null) {
                out.flush();
                out.close();
            }
        }
    }

    /**
     * 使用response输出文件
     *
     * @param response
     * @param is       文件流
     * @param fileName 文件名
     */
    public static void outFile(HttpServletResponse response, InputStream is, String fileName) {
        // 设置强制下载不打开
        response.setContentType("application/force-download");
        // 设置文件名
        response.addHeader("Content-Disposition", "attachment;fileName=" + fileName);
        BufferedInputStream bis = null;
        try {
            //中文乱码
            fileName = URLEncoder.encode(fileName, "UTF-8");
            OutputStream outputStream = response.getOutputStream();
            //把输入流copy到输出流
            IOUtils.copy(is, outputStream);
            outputStream.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
