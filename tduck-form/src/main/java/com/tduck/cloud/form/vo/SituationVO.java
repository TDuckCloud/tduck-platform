package com.tduck.cloud.form.vo;

import com.google.common.base.Objects;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 填写统计
 * @author hasee
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SituationVO {
    private String createTime;

    private Integer count;


    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        SituationVO situation = (SituationVO) o;
        return Objects.equal(createTime, situation.createTime);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(createTime);
    }
}