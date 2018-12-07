package com.musili.projectManagement.beans;

import com.musili.common.CrudI;
import com.musili.projectManagement.model.Project;

import javax.ejb.Remote;

@Remote
public interface ProjectI extends CrudI<Project> {
}
