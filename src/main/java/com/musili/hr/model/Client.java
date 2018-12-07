package com.musili.hr.model;

import org.hibernate.engine.internal.Cascade;

import javax.persistence.*;
import java.io.Serializable;

@NamedQueries(
        {
                @NamedQuery(name = "myquery", query = "SELECT c from Client c")
        }
)

@Entity
public class Client implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    private String code;
    private boolean deleted;

    @OneToOne(cascade = CascadeType.ALL)
    private Address address;

    public Client() {
    }

    public boolean isDeleted() {
        return deleted;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Client(String name, String code, Address address) {
        this.name = name;
        this.code = code;
        this.address = address;
    }

    @Override
    public String toString() {
        return "Client{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", code='" + code + '\'' +
                ", address=" + address +
                '}';
    }
}
