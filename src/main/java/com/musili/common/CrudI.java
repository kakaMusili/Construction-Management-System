package com.musili.common;

import com.musili.hr.model.Client;

import javax.ejb.Local;
import javax.ejb.Remote;
import java.util.List;

@Local
public interface CrudI<T> {

    T add(T t);
    T edit(T t);
    boolean delete(T t);
    T findById(long id);
    List<T> findAll();
    List fetchAll(Client client);
}
