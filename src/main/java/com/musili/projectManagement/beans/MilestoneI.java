package com.musili.projectManagement.beans;

import com.musili.common.CrudI;
import com.musili.projectManagement.model.Milestone;
import com.musili.projectManagement.model.Project;

import javax.ejb.Local;
import java.util.List;

@Local
public interface MilestoneI extends CrudI<Milestone> {

    List<Milestone> fetchMilestoneByProject(Project project);
}
