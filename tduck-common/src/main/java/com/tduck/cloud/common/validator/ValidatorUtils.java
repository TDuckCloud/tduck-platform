package com.tduck.cloud.common.validator;


import com.tduck.cloud.common.exception.BaseException;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import java.util.Set;

/**
 * @description: hibernate 校验工具类
 * 不通过注解使用 通过工具类返回自定义结果
 * @author: smalljop
 * @create: 2018-10-12 10:20
 **/
public class ValidatorUtils {

    private static Validator validator;

    static {
        validator = Validation.buildDefaultValidatorFactory().getValidator();
    }

    /**
     * 校验对象
     *
     * @param object 待校验对象
     * @param groups 待校验的组
     * @throws BaseException 校验不通过，BaseException
     */
    public static void validateEntity(Object object, Class<?>... groups)
            throws BaseException {
        Set<ConstraintViolation<Object>> constraintViolations = validator.validate(object, groups);
        if (!constraintViolations.isEmpty()) {
            StringBuilder msg = new StringBuilder();
            for (ConstraintViolation<Object> constraint : constraintViolations) {
                msg.append(constraint.getMessage());
            }
            throw new BaseException(msg.toString());
        }
    }

    public static void validateEntity(Object object)
            throws BaseException {
        Set<ConstraintViolation<Object>> constraintViolations = validator.validate(object);
        if (!constraintViolations.isEmpty()) {
            StringBuilder msg = new StringBuilder();
            for (ConstraintViolation<Object> constraint : constraintViolations) {
                msg.append(constraint.getMessage()).append("<br>");
            }
            throw new BaseException(msg.toString());
        }
    }
}
