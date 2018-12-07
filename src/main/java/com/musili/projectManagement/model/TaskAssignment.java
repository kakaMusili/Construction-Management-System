package com.musili.projectManagement.model;

import com.musili.hr.model.Employee;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class TaskAssignment implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @OneToOne
    private Task task;

    @OneToOne
    private Employee employee;

    public TaskAssignment() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) { this.id = id; }

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
}
