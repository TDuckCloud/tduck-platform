package com.tduck.cloud.project.vo;

import com.tduck.cloud.project.entity.UserProjectEntity;
import com.tduck.cloud.project.entity.UserProjectItemEntity;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

/**
 * @author smalljop
 */
@Data
@AllArgsConstructor
public class UserProjectDetailVO {
    private UserProjectEntity project;


    private List<UserProjectItemEntity> projectItems;

    private UserProjectThemeVo userProjectTheme;
}
