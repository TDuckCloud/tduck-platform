package com.tduck.cloud.envconfig.entity.event;

import com.tduck.cloud.envconfig.entity.SysEnvConfigEntity;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

/**
 * 系统配置更新之后 更新对应的类
 *
 * @author tduck
 */
public class EnvConfigRefreshEvent extends ApplicationEvent {

    @Getter
    private final SysEnvConfigEntity config;


    public EnvConfigRefreshEvent(Object source, SysEnvConfigEntity config) {
        super(source);
        this.config = config;
    }
}
