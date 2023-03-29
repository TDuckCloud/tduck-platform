package com.tduck.cloud.envconfig.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tduck.cloud.common.constant.ConfigConstants;
import com.tduck.cloud.common.constant.RedisKeyConstants;
import com.tduck.cloud.common.util.JsonUtils;
import com.tduck.cloud.common.util.SpringContextUtils;
import com.tduck.cloud.envconfig.entity.SysEnvConfigEntity;
import com.tduck.cloud.envconfig.entity.event.EnvConfigRefreshEvent;
import com.tduck.cloud.envconfig.mapper.SysEnvConfigMapper;
import com.tduck.cloud.envconfig.service.SysEnvConfigService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 系统环境配置Service业务层处理
 *
 * @author tduck-gen
 * @date 2021-12-28 15:06:17
 */
@Service
@RequiredArgsConstructor
public class SysEnvConfigServiceImpl extends ServiceImpl<SysEnvConfigMapper, SysEnvConfigEntity> implements SysEnvConfigService {

    /**
     * 本地缓存
     */
    private final Map<String, String> cacheMap = new ConcurrentHashMap<>();



    @PostConstruct
    public void initCache() {
        List<SysEnvConfigEntity> list = this.list();
        list.forEach(config -> {
            cacheMap.put(config.getEnvKey(), JsonUtils.objToJson(config.getEnvValue()));
        });

    }

    @Override
    public SysEnvConfigEntity getByKey(String key) {
        return baseMapper.selectOne(Wrappers.<SysEnvConfigEntity>lambdaQuery().eq(SysEnvConfigEntity::getEnvKey, key));
    }

//    @Override
//    public SystemEnvConfig getSystemEnvConfig() {
//        return JsonUtils.jsonToObj(getValueByKey(ConfigConstants.SYSTEM_INFO_CONFIG), SystemEnvConfig.class);
//    }


    @Override
    public String getValueByKey(String key) {
        String cacheValue = cacheMap.get(key);
        if (StringUtils.isNotEmpty(cacheValue)) {
            return cacheValue;
        }
        SysEnvConfigEntity config = getByKey(key);
        if (ObjectUtil.isNotNull(config)) {
            return JsonUtils.objToJson(config.getEnvValue());
        }
        return StringUtils.EMPTY;
    }


    @Override
    public void saveConfig(SysEnvConfigEntity config) {
        SysEnvConfigEntity envConfig = getByKey(config.getEnvKey());
        if (ObjectUtil.isNull(envConfig)) {
            envConfig = new SysEnvConfigEntity();
        }
        envConfig.setEnvKey(config.getEnvKey());
        envConfig.setEnvValue(config.getEnvValue());
        this.saveOrUpdate(envConfig);
        cacheMap.put(config.getEnvKey(), JsonUtils.objToJson(config.getEnvValue()));
        SpringContextUtils.publishEvent(new EnvConfigRefreshEvent(this, config));
    }
}
