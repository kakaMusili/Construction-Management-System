package com.musili.projectManagement.beans;

import com.musili.common.CrudBean;
import com.musili.hr.model.Client;
import com.musili.projectManagement.model.Project;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;

@Stateless
public class ProjectBean extends CrudBean<Project> implements ProjectI {
    @PostConstruct
    private void setEntityClass() {
        this.entityClass = Project.class;

    }
}
