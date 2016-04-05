package dao;

import dto.Faculty;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class CheckFacultyLoginGetDetails {

    /*public static LoginDetailsGetSet checkUserId(LoginDetailsGetSet loginDetailsGetSet) {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();
        String factId = loginDetailsGetSet.getName();
        try {
            LoginDetailsGetSet am = (LoginDetailsGetSet) ses.get(Faculty.class, factId);
            ses.close();
            return am;
        } catch (Exception e) {
            e.printStackTrace();
            ses.close();
            return null;
        }        
    }*/
    public static Faculty checkUserId(LoginDetailsGetSet loginDetailsGetSet) {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();
        String factId = loginDetailsGetSet.getName();
        try {
            Faculty am = (Faculty) ses.get(Faculty.class, factId);
            ses.close();
            return am;
        } catch (Exception e) {
            e.printStackTrace();
            ses.close();
            return null;
        }        
    }


    public Faculty showFacultyLoginCheck(LoginDetailsGetSet other) {
        System.out.println("In dao");
        SessionFactory sf = FacGen.FactoryGenerator.getSessionFactory();
        Session ses = sf.openSession();
        Query q = ses.createQuery("from Faculty where factId = ? and facultyPass = ?");
        q.setString(0, other.getName());
        q.setString(1, other.getPassword());
        List<Faculty> list3 = q.list();
        ses.close();
        try {
            if(!list3.isEmpty())
        {
            return list3.get(0);
        }
        else
        {
           return null;
        }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}