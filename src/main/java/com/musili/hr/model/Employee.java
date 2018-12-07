package com.musili.hr.model;

import com.musili.projectManagement.model.Project;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class Employee implements Serializable {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
  private  boolean deleted;
    private String name;
    private String phoneNumber;

    @ManyToOne
    private Client client;

    @ManyToOne
    private Project project;

    public Employee() {
    }

    public Employee(String name, String phoneNumber) {

        this.name = name;
        this.phoneNumber = phoneNumber;
    }

    public Employee( String name, String phoneNumber, Client client) {

        this.name = name;
        this.phoneNumber = phoneNumber;
        this.client = client;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
