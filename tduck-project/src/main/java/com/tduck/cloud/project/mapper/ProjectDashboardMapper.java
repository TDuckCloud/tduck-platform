package com.tduck.cloud.project.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tduck.cloud.project.entity.UserProjectResultEntity;
import com.tduck.cloud.project.vo.ProjectReportVO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Set;

/**
 * @author : smalljop
 * @description :
 * @create :  2020/12/31 14:51
 **/
public interface ProjectDashboardMapper extends BaseMapper<UserProjectResultEntity> {


    /**
     * 查询当周的每天数量
     *
     * @param projectKey
     * @return
     */
    @Select("SELECT date_format( create_time, '%Y-%m-%d' ) as create_time, COUNT( 1 ) AS count FROM pr_user_project_result" +
            " WHERE YEARWEEK( date_format( create_time, '%Y-%m-%d' )) = YEARWEEK( now()) AND project_key=#{projectKey} GROUP BY date_format( create_time, '%Y-%m-%d' )")
    Set<ProjectReportVO.Situation> selectProjectReportSituation(@Param("projectKey") String projectKey);


    /**
     * 分组查询位置
     *
     * @param projectKey
     * @return
     */
    @Select("SELECT  submit_address,COUNT(1) as count FROM pr_user_project_result WHERE project_key=#{projectKey}" +
            "GROUP BY submit_address")
    List<ProjectReportVO.Position> selectProjectReportPosition(String projectKey);


    /**
     * 设备
     *
     * @param projectKey
     * @return
     */
    @Select("SELECT  submit_os as os_name,COUNT(1) as count FROM pr_user_project_result WHERE project_key=#{projectKey}" +
            " GROUP BY submit_os")
    List<ProjectReportVO.Device> selectProjectReportDevice(String projectKey);


    /**
     * 来源
     *
     * @param projectKey
     * @return
     */
    @Select("SELECT  submit_browser as browser_name,COUNT(1) as count FROM pr_user_project_result WHERE project_key=#{projectKey}" +
            " GROUP BY submit_browser")
    List<ProjectReportVO.Source> selectProjectReportSource(String projectKey);
}
