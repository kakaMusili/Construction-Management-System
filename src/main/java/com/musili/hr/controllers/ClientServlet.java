package com.musili.hr.controllers;

import com.musili.africasTalking.AfricasTalkingGateway;
import com.musili.hr.Notification.Sms;
import com.musili.hr.beans.ClientBean;
import com.musili.hr.beans.ClientI;
import com.musili.hr.beans.UserI;
import com.musili.hr.model.*;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.enterprise.event.Event;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("register")
public class ClientServlet extends HttpServlet {

    @EJB
    UserI userI;

    @EJB ClientI clientI;

    @Inject
    @Sms
    private Event<Client> clientEvent;



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        Role role=new Role();

        PrintWriter out=resp.getWriter();

        String name=req.getParameter("name");
        String contacts=req.getParameter("contacts");
        String email=req.getParameter("email");
        String phyisicalAddress=req.getParameter("address");

        //String clientRole= req.getParameter("role");
        long clientRole=Long.valueOf(req.getParameter("role"));
        String uname=req.getParameter("username");
        String password=req.getParameter("password");
        String confirmPassword=req.getParameter("confirm_password");
        String code="CI/"+(int)(Math.random()*1000)+"/2018" ;

        String checkPassword=null;
        if(password.equals(confirmPassword))
        {
            Address address=new Address(phyisicalAddress,email,contacts);

            role.setId(clientRole);
            User user=new User(role, uname,password);

            Client client=new Client(name, code , address);

            user.setClient(client);

            clientI.add(client);
            userI.add(user);


            //Sending Notification
            //clientEvent.fire(client);

            resp.sendRedirect("client_login.jsp");
        }else
        {
            HttpSession session = req.getSession();
            session.setAttribute("password", password);

            resp.sendRedirect("registration.jsp");
        }


    }
}
