package com.musili.hr.beans;

import com.musili.common.CrudBean;
import com.musili.hr.model.Client;
import com.musili.hr.model.Role;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;

@Stateless
public class RoleBean extends CrudBean<Role> implements RoleI {
    @PostConstruct
    private void setEntityClass() {
        this.entityClass = Role.class;

    }

}
