package com.tduck.cloud.project.vo;

import com.tduck.cloud.project.entity.ProjectTemplateEntity;
import com.tduck.cloud.project.entity.ProjectTemplateItemEntity;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

/**
 * @author smalljop
 */
@Data
@AllArgsConstructor
public class ProjectTemplateDetailVO {
    private ProjectTemplateEntity project;


    private List<ProjectTemplateItemEntity> projectItems;

}
