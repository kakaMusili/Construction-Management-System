package com.musili.hr.beans;

import com.musili.common.CrudI;
import com.musili.hr.model.Employee;

import javax.ejb.Local;
import javax.ejb.Remote;

@Local
public interface EmployeeI extends CrudI<Employee> {

}
