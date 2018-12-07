package com.musili.projectManagement.model;

import com.musili.hr.model.Employee;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;

@Entity
public class WorkDone implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ManyToOne
    private Employee employee;

    @OneToOne
    private Task task;
    private BigDecimal work;

    public WorkDone() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) { this.id = id; }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }

    public BigDecimal getWork() {
        return work;
    }

    public void setWork(BigDecimal work) {
        this.work = work;
    }
}
