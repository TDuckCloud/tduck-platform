package com.tduck.cloud.form.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tduck.cloud.form.entity.UserFormLogicEntity;
import com.tduck.cloud.form.mapper.UserFormLogicMapper;
import com.tduck.cloud.form.service.UserFormLogicService;
import org.springframework.stereotype.Service;

/**
 * 表单逻辑
 */
@Service
public class UserFormLogicServiceImpl extends ServiceImpl<UserFormLogicMapper, UserFormLogicEntity> implements UserFormLogicService {
}
