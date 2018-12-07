package com.musili.hr.beans;

import com.musili.hr.model.Client;
import com.musili.hr.model.Employee;
import com.musili.hr.model.User;

import javax.ejb.Stateful;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateful
public class AccessBean<T> implements AccessI<T> {
    @PersistenceContext
    EntityManager em;

    @Override
    public User login( String username,String password) {

        try {
            return (User) em.createNamedQuery("login")
                    .setParameter("username", username)
                    .setParameter("password", password)
                    .getSingleResult();

        }catch (NoResultException e)
        {
            e.printStackTrace();
        }
         return  null;
    }
        @Override
    public boolean logout(T t) {
        return false;
    }
}
