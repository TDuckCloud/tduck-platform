package com.tduck.cloud.form.util;


import cn.hutool.core.util.ObjectUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

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


    /**
     * 排序默认自增因子
     */
    private final Long SORT_DEFAULT_INCR_FACT = 65536L;


    /**
     * * 两个前提:位置的信息记录在任务的模型上(pos字段);一般两个任务的pos值相差很大(默认是65536);现在假设有任务 A, B, C.
     * * 列举几个常见的场景:如果C要移到A的前面, 那么后端会把 C.pos 改为 A.pos/2;若果C要移到A和B之间,
     * * 那么后端会把 C.pos 改为 (A.pos + B.pos)/2;如果B要移到C的后面, 那么后端会把 B.pos 改为 C.pos + 65536;
     * * 当然这里会有个极端情况需要处理(假设pos是整数):如果 A.pos 是 1, B.pos 是 2, C想移到A和B之间, 其实是没有一个整数可以用的,
     * * 针对这种情况, 后端会重新给整个列表的任务重新刷一遍pos值.
     * 排序之后重新计算
     *
     * @param beforePosition
     * @param afterPosition
     */
    public Long calcSortPosition(Long beforePosition, Long afterPosition) {
        //最终位置
        long finalPos = 0;
        //第一个
        if (ObjectUtil.isNull(beforePosition) || 0L == beforePosition) {
            finalPos = afterPosition / 2;
        }
        Boolean isCenter = (ObjectUtil.isNotNull(beforePosition) && 0L != beforePosition)
                && (ObjectUtil.isNotNull(afterPosition) && 0L != afterPosition);
        if (isCenter) {
            finalPos = (beforePosition + afterPosition) / 2;
        }
        //最后一个
        if (ObjectUtil.isNull(afterPosition) || 0L == afterPosition) {
            finalPos = beforePosition + SORT_DEFAULT_INCR_FACT;
        }
        return finalPos;
    }

}
