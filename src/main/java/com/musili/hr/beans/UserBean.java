package com.musili.hr.beans;

import com.musili.common.CrudBean;
import com.musili.hr.model.Employee;
import com.musili.hr.model.User;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

@Stateless
public class UserBean extends CrudBean<User>  implements UserI  {
    @PersistenceContext
    EntityManager em;

    @PostConstruct
    private void setEntityClass() {
        this.entityClass = User.class;

    }

    @Override
    public User findU(Employee employee) {

        try {
            return (User) em.createNamedQuery("findUser")
                    .setParameter("employee", employee)
                    .getSingleResult();

        }catch (NoResultException e)
        {
            e.printStackTrace();
        }
        return  null;
    }
}
