package com.tduck.cloud.form.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tduck.cloud.form.entity.UserFormDataEntity;
import com.tduck.cloud.form.vo.FormReportVO;
import com.tduck.cloud.form.vo.SituationVO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Set;

/**
 * 表单报表
 *
 * @author : smalljop
 * @description :
 * @create :  2020/12/31 14:51
 **/
public interface FormDashboardMapper extends BaseMapper<UserFormDataEntity> {


    /**
     * 查询当周的每天数量
     *
     * @param formKey
     * @return
     */
    @Select(" SELECT date_format(create_time, '%Y-%m-%d') as create_time, COUNT(1) AS count\n" +
            "        FROM fm_user_form_data\n" +
            "        WHERE create_time >= YEARWEEK(now())\n" +
            "          AND form_key = #{formKey}\n" +
            "        GROUP BY date_format(create_time, '%Y-%m-%d')")
    Set<SituationVO> selectFormReportSituation(@Param("formKey") String formKey);


    /**
     * 分组查询位置
     *
     * @param formKey
     * @return
     */
    @Select("SELECT  submit_address,COUNT(1) as count FROM fm_user_form_data WHERE form_key=#{formKey}" +
            "GROUP BY submit_address")
    List<FormReportVO.Position> selectFormReportPosition(String formKey);


    /**
     * 设备
     *
     * @param formKey
     * @return
     */
    @Select("SELECT  submit_os as os_name,COUNT(1) as count FROM fm_user_form_data WHERE form_key=#{formKey}" +
            " GROUP BY submit_os")
    List<FormReportVO.Device> selectFormReportDevice(String formKey);


    /**
     * 来源
     *
     * @param formKey
     * @return
     */
    @Select("SELECT  submit_browser as browser_name,COUNT(1) as count FROM fm_user_form_data WHERE form_key=#{formKey}" +
            " GROUP BY submit_browser")
    List<FormReportVO.Source> selectFormReportSource(String formKey);
}
