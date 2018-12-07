package com.musili.projectManagement.beans;

import com.musili.common.CrudBean;
import com.musili.projectManagement.model.Milestone;
import com.musili.projectManagement.model.Task;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import java.util.List;

@Stateless
public class TaskBean extends CrudBean<Task> implements TaskI {

    @PersistenceContext
    EntityManager em;

    @PostConstruct
    private void setEntityClass() {
        this.entityClass = Task.class;

    }

    @Override
    public List<Task> fetchTaskByMilestone(Milestone milestone) {
        try {
            return (List<Task>) em.createNamedQuery("fetchByMilestone")
                    .setParameter("status", false)
                    .setParameter("milestone", milestone)
                    .getResultList();

        }catch (NoResultException e)
        {
            e.printStackTrace();
        }
        return null;
    }
}
