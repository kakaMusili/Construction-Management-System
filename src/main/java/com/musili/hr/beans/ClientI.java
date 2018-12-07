package com.musili.hr.beans;

import com.musili.common.CrudI;
import com.musili.hr.model.Client;

import javax.ejb.Local;
import javax.ejb.Remote;
import java.util.List;

@Local
public interface ClientI extends CrudI<Client> {

    //List<Client> findAll();

}
