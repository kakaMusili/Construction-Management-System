package com.musili.projectManagement.beans;

import com.musili.common.CrudI;
import com.musili.projectManagement.model.Milestone;
import com.musili.projectManagement.model.Task;

import javax.ejb.Local;
import java.util.List;

@Local
public interface TaskI extends CrudI<Task> {
    List<Task> fetchTaskByMilestone(Milestone milestone);
}
