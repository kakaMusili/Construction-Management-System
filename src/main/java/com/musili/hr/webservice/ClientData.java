package com.musili.hr.webservice;

import com.musili.common.CrudI;
import com.musili.hr.beans.ClientI;
import com.musili.hr.model.Client;

import javax.ejb.EJB;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.List;

@Path("/clientdata")
public class ClientData {

    @EJB
    ClientI clientI;

    @EJB
    CrudI crudI;

    Client c;

    @Path("/getdata")
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public List<Client> findAll()
    {
        return clientI.findAll();
    }

    @Path("/register")
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public Object register()
    {
        System.out.println(" registered " + c);
        return crudI.add(c);
    }
}
