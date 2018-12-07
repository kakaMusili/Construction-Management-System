package com.musili.projectManagement.beans;

import com.musili.common.CrudBean;
import com.musili.hr.model.User;
import com.musili.projectManagement.model.Milestone;
import com.musili.projectManagement.model.Project;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import java.util.List;

@Stateless
public class MilestoneBean extends CrudBean<Milestone>  implements  MilestoneI{
    @PersistenceContext
    EntityManager em;

    @PostConstruct
    private void setEntityClass() {
        this.entityClass = Milestone.class;

    }

    @Override
    public List<Milestone> fetchMilestoneByProject(Project project) {

        try {
            return (List<Milestone>) em.createNamedQuery("fetchByProject")
                    .setParameter("status", false)
                    .setParameter("project", project)
                    .getResultList();

        }catch (NoResultException e)
        {
            e.printStackTrace();
        }
        return  null;
    }
}
