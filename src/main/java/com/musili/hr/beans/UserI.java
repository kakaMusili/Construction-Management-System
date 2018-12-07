package com.musili.hr.beans;

import com.musili.common.CrudI;
import com.musili.hr.model.Employee;
import com.musili.hr.model.User;

import javax.ejb.Local;

@Local
public interface UserI extends CrudI<User> {
    User findU(Employee employee);
}
