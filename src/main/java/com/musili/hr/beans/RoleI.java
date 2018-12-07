package com.musili.hr.beans;

import com.musili.common.CrudI;
import com.musili.hr.model.Role;

import javax.ejb.Local;
import javax.ejb.Remote;

@Local
public interface RoleI extends CrudI<Role> {
}
