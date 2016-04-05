package dao;

import dto.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class AdminDao {

    public static Admin validateAdmin(Admin adm) {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();
        Admin adm1 = (Admin) ses.get(Admin.class, adm.getUserid());
        if (adm1.getUserid().equals(adm.getUserid()) && adm1.getPassword().equals(adm.getPassword())) {
            return adm1;
        } else {
            return null;
        }
    }

    public static Admin checkUserId(Admin adm) {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();
        Transaction tx = ses.beginTransaction();
        try {
            Admin am = (Admin) ses.get(Admin.class, adm.getUserid());
            return am;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    public static String updateAdmin(Admin adm){
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();
        Transaction tx = ses.beginTransaction();
        try {
            ses.update(adm);
            tx.commit();
           return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
}
