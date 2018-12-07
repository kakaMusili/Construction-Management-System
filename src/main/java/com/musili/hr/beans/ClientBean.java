package com.musili.hr.beans;

import com.musili.common.CrudBean;
import com.musili.hr.model.*;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.ejb.Stateful;
import javax.ejb.Stateless;
import javax.enterprise.context.ApplicationScoped;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Stateless
public class ClientBean extends CrudBean<Client> implements ClientI{

    @PostConstruct
    private void setEntityClass() {
        this.entityClass = Client.class;

    }

}
