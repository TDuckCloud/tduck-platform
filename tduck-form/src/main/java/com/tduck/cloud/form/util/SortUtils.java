package com.tduck.cloud.form.util;


import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.tduck.cloud.common.util.CacheUtils;
import com.tduck.cloud.form.constant.FormRedisKeyConstants;
import com.tduck.cloud.form.entity.UserFormItemEntity;
import com.tduck.cloud.form.service.UserFormItemService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Comparator;
import java.util.List;

/**
 * 两个前提:位置的信息记录在任务的模型上(pos字段);一般两个任务的pos值相差很大(默认是65536);现在假设有任务 A, B, C.
 * 列举几个常见的场景:如果C要移到A的前面, 那么后端会把 C.pos 改为 A.pos/2;若果C要移到A和B之间,
 * 那么后端会把 C.pos 改为 (A.pos + B.pos)/2;如果B要移到C的后面, 那么后端会把 B.pos 改为 C.pos + 65536;
 * 当然这里会有个极端情况需要处理(假设pos是整数):如果 A.pos 是 1, B.pos 是 2, C想移到A和B之间, 其实是没有一个整数可以用的,
 * 针对这种情况, 后端会重新给整个列表的任务重新刷一遍pos值.
 * <p>
 * 拖动排序工具类
 * 算法参考 @link https://www.zhihu.com/question/55789722
 *
 * @author smalljop
 */
@RequiredArgsConstructor
@Component
public class SortUtils {

    private final CacheUtils cacheUtils;

    /**
     * 排序默认自增因子
     */
    private final Long SORT_DEFAULT_INCR_FACT = 65536L;

    private final UserFormItemService formItemService;


    /**
     * 获取排序数值
     *
     * @param formKey 表单key
     * @return 初始排序数值
     */
    public Long getInitialSortPosition(String formKey) {
        String redisKey = StrUtil.format(FormRedisKeyConstants.FORM_ITEM_POS_DELTA, formKey);
        // 模板创建时 初始排序数值
        if (StrUtil.isBlank(cacheUtils.get(redisKey))) {
            Long sort = formItemService.getLastItemSort(formKey);
            cacheUtils.save(redisKey, String.valueOf(sort == null ? 1 : sort));
        }
        return cacheUtils.incr(redisKey, SORT_DEFAULT_INCR_FACT.intValue());
    }


    /**
     * * 两个前提:位置的信息记录在任务的模型上(pos字段);一般两个任务的pos值相差很大(默认是65536);现在假设有任务 A, B, C.
     * * 列举几个常见的场景:如果C要移到A的前面, 那么后端会把 C.pos 改为 A.pos/2;若果C要移到A和B之间,
     * * 那么后端会把 C.pos 改为 (A.pos + B.pos)/2;如果B要移到C的后面, 那么后端会把 B.pos 改为 C.pos + 65536;
     * * 当然这里会有个极端情况需要处理(假设pos是整数):如果 A.pos 是 1, B.pos 是 2, C想移到A和B之间, 其实是没有一个整数可以用的,
     * * 针对这种情况, 后端会重新给整个列表的任务重新刷一遍pos值.
     * 排序之后重新计算
     *
     * @param beforePosition 之前的位置
     * @param afterPosition  之后的位置
     * @param formKey        表单key
     * @return 最终位置
     */
    public Long calcSortPosition(Long beforePosition, Long afterPosition, String formKey) {
        String redisKey = StrUtil.format(FormRedisKeyConstants.FORM_ITEM_POS_DELTA, formKey);
        boolean isCenter = (ObjectUtil.isNotNull(beforePosition) && 0L != beforePosition) && (ObjectUtil.isNotNull(afterPosition) && 0L != afterPosition);
        if (isCenter) { // 放到中间
            return (beforePosition + afterPosition) / 2;
        }
        if (ObjectUtil.isNull(beforePosition) || 0L == beforePosition) { // 放到最前面
            return afterPosition / 2;
        } else { // 放到最后面
            return cacheUtils.incr(redisKey, SORT_DEFAULT_INCR_FACT.intValue());
        }
    }


    /**
     * 极端情况刷新整个列表
     *
     * @param beforePosition 之前的位置
     * @param afterPosition  之后的位置
     * @param formKey        表单key
     * @param sort           排序数值
     */
    public Boolean sortAllList(Long beforePosition, Long afterPosition, String formKey, Long sort) {
        // 即将没有整数，刷新全部列表排序值
        if ((ObjectUtil.isNotNull(beforePosition) && 0L != beforePosition && ObjectUtil.equals(sort, beforePosition + 1))
                || (ObjectUtil.isNotNull(afterPosition) && 0L != afterPosition && ObjectUtil.equals(sort, 1L))) {
            List<UserFormItemEntity> itemEntityList = formItemService.list(Wrappers.<UserFormItemEntity>lambdaQuery().eq(UserFormItemEntity::getFormKey, formKey));
            itemEntityList.sort(Comparator.comparing(UserFormItemEntity::getSort));
            for (int i = 0; i < itemEntityList.size(); i++) {
                itemEntityList.get(i).setSort(SORT_DEFAULT_INCR_FACT * (i + 1));
            }
            formItemService.updateBatchById(itemEntityList);
            return true;
        }
        return false;
    }

}
