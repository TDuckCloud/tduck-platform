package com.tduck.cloud.project.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tduck.cloud.project.entity.UserProjectLogicEntity;
import com.tduck.cloud.project.mapper.UserProjectLogicMapper;
import com.tduck.cloud.project.service.UserProjectLogicService;
import org.springframework.stereotype.Service;


@Service("userProjectLogicService")
public class UserProjectLogicServiceImpl extends ServiceImpl<UserProjectLogicMapper, UserProjectLogicEntity> implements UserProjectLogicService {
}
