package com.musili.hr.beans;

import com.musili.hr.model.User;

import javax.ejb.Local;
import javax.ejb.Remote;

@Local
public interface AccessI<T> {
    User login(String username, String password);
    boolean logout(T t);
}
