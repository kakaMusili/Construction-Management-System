package com.musili.common;

import com.musili.hr.model.Client;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.sql.SQLException;
import java.util.List;

@Stateless
public class CrudBean<T> implements CrudI<T> {

    @PersistenceContext
    EntityManager em;

    protected Class<T> entityClass;


    @Override
    public T add(T t) {

        try {

            em.persist(t);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
        return null;
    }

    @Override
    public T edit(T t) {
        try {

            return em.merge(t);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
        return null;
    }

    @Override
    public boolean delete(T t) {
        try {
            t=em.merge(t);
              em.remove(t);
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
        return false;
    }

    @Override
    public T findById(long id) {
        try {

            return em.find(entityClass, id);


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
        return null;
    }

    @Override
    public List<T> findAll() {

        try {
            return em.createQuery("select t from " + entityClass.getSimpleName() + " t where t.deleted = 'false'").getResultList();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List fetchAll(Client client) {

        try {
            return em.createQuery("select e from " + entityClass.getSimpleName() + " e where e.deleted = 'false'and e.client like :name")
                    .setParameter("name", client)
                    .getResultList();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

}

