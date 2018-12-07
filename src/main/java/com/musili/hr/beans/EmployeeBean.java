package com.musili.hr.beans;

import com.musili.common.CrudBean;
import com.musili.hr.model.Client;
import com.musili.hr.model.Employee;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;

@Stateless
public class EmployeeBean extends CrudBean<Employee> implements EmployeeI {
    @PostConstruct
    private void setEntityClass() {
        this.entityClass = Employee.class;

    }

}
