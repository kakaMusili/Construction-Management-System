package com.musili.hr.model;

import javax.persistence.*;
import java.io.Serializable;


@Entity
@NamedQueries(
        {
                @NamedQuery(name = "login",
                        query = "SELECT u from User u where u.username = :username and u.password = :password")

        }
)


public class User implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @OneToOne
    private Role role;
    private String username;
    private String password;

    @OneToOne
    private Client client;

    @OneToOne
    private Employee employee;

    private boolean deleted;

    public User() {
    }

    public User(Role role, String username, String password) {
        this.role = role;
        this.username = username;
        this.password = password;
    }

    //used in creating client,
    //thats why we are not setting employee object
    public User(Role role, String username, String password, Client client) {
        this.role = role;
        this.username = username;
        this.password = password;
        this.client = client;
        this.employee = employee;
    }

    //used in creating employee
    //employee has client object
    public User(Role role, String username, String password, Client client, Employee employee) {
        this.role = role;
        this.username = username;
        this.password = password;
        this.client = client;
        this.employee = employee;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }


    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", role=" + role +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
