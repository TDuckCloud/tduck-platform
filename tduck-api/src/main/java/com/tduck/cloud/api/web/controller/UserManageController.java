package com.tduck.cloud.api.web.controller;
import java.util.List;

import cn.hutool.core.util.ObjUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.tduck.cloud.account.constant.AccountConstants;
import com.tduck.cloud.account.util.PasswordUtils;
import com.tduck.cloud.common.util.QueryWrapperUtils;
import com.tduck.cloud.common.util.Result;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.tduck.cloud.common.validator.group.AddGroup;
import com.tduck.cloud.account.entity.UserEntity;
import com.tduck.cloud.account.service.UserService;


/**
 * 用户
 *
 * @author tduck
 * @since 2023-04-03 22:48:02
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/mange/user")
public class UserManageController {

    private final UserService userService;

    /**
     * 查询用户列表
     */
    @GetMapping("/page")
    public Result queryPage(Page page, UserEntity user) {
        QueryWrapper<UserEntity> simpleQuery = QueryWrapperUtils.toSimpleQuery(user);
        simpleQuery.orderByDesc("create_time");
        return Result.success(userService.page(page, simpleQuery));
    }


    /**
     * 获取用户详细信息
     *
     * @param id 主键
     */
    @GetMapping(value = "/{id}")
    public Result<UserEntity> getInfo(@PathVariable("id") String id) {
        return Result.success(userService.getById(id));
    }

    /**
     * 新增用户
     */
    @PostMapping("/add")
    public Result<Boolean> add(@Validated(AddGroup.class) @RequestBody UserEntity user) {
        checkUnique(user);
        user.setPasswordType(1);
        user.setAvatar(AccountConstants.DEFAULT_AVATAR);
        user.setPassword(PasswordUtils.encode(user.getPassword()));
        return Result.success(userService.save(user));
    }

    /**
     * 修改用户
     */
    @PostMapping("/update")
    public Result<Boolean> update(@RequestBody UserEntity user) {
        checkUnique(user);
        return Result.success(userService.updateById(user));
    }

    private void checkUnique(UserEntity user) {
        // 检查邮箱是否重复
        UserEntity oldUser = userService.getUserByEmail(user.getEmail());
        if (ObjUtil.isNotNull(oldUser) && ObjUtil.notEqual(oldUser.getId(), user.getId())) {
            throw new RuntimeException("邮箱已存在");
        }
        // 检查手机号是否重复
        oldUser = userService.getUserByPhoneNumber(user.getPhoneNumber());
        if (ObjUtil.isNotNull(oldUser) && ObjUtil.notEqual(oldUser.getId(), user.getId())) {
            throw new RuntimeException("手机号已存在");
        }
    }

    /**
     * 删除用户
     *
     * @param ids 主键串
     */
    @PostMapping("/delete/{ids}")
    public Result<Boolean> delete(@PathVariable List<String> ids) {
        return Result.success(userService.removeByIds(ids));
    }
}
