package com.tduck.cloud.envconfig.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.tduck.cloud.common.entity.BaseEntity;
import com.tduck.cloud.common.mybatis.handler.JacksonTypeHandler;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.util.Map;

/**
 * 系统环境配置对象 sys_env_config
 *
 * @author tduck-gen
 * @date 2021-12-28 15:06:17
 */
@Data
@TableName(value = "sys_env_config", autoResultMap = true)
public class SysEnvConfigEntity extends BaseEntity {


    /**
     * 配置key
     */
    @NotBlank
    private String envKey;

    /**
     * 参数键值
     */
    @TableField(typeHandler = JacksonTypeHandler.class)
    private Map<String, Object> envValue;


}
