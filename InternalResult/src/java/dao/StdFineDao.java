/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Stdfine;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Kushal
 */
public class StdFineDao {

    public Stdfine checkFine(Stdfine stdF) {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();
        Transaction tx = ses.beginTransaction();
        try {
            Stdfine am = (Stdfine) ses.get(Stdfine.class, stdF.getStdRollN());
            return am;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public String removeFine(Stdfine stdF) {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();
        Transaction tx = ses.beginTransaction();
        try {
            ses.delete(stdF);
            tx.commit();
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }

    }

    public String addFine(Stdfine stdF) {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();
        Transaction tx = ses.beginTransaction();
        try {
            ses.save(stdF);
            tx.commit();
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }

    }

}
