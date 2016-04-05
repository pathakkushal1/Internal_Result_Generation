/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Faculty;
import dto.FacultySubject;
import java.io.Serializable;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Kushal
 */
public class FacultyDao {

    public String facultydatainput(Faculty fac) {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();
        Transaction tx = ses.beginTransaction();
        Serializable sz = ses.save(fac);
        tx.commit();
        ses.close();
        if (sz.toString().equals("")) {
            return "error";
        } else {
            return "succes";
        }
    }

    public Faculty getSingleFaculty(Faculty fact) {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        System.out.println("Object Comes from action : To dao : \n" + fact);
        Session ses = sf.openSession();
        System.out.println("Id in daculty : " + fact.getFactId());
        Faculty fact1 = (Faculty) ses.get(Faculty.class, fact.getFactId());
        System.out.println("Object we get from the dao by Db : \n " + fact1);
        return fact1;

    }

    public String updateSingleFact(Faculty fact) {
        try {
            SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
            Session ses = sf.openSession();
            System.out.println("Update In Dao : " + fact);
            Transaction tx = ses.beginTransaction();
            ses.update(fact);
            tx.commit();
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    public List<Faculty> getAllFaculty() {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();

        Query q = ses.createQuery("from Faculty");
        List<Faculty> list = q.list();
        System.out.println("List in facultydao: " + list);
        return list;
    }

    public List<Faculty> getBWFaculty(String facultyDept) {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();

        Query q = ses.createQuery("from Faculty where facultyDept='" + facultyDept + "'");
        List<Faculty> list = q.list();
        return list;
    }

    public List<FacultySubject> getFacultySubject(FacultySubject fs) {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();
        Query q = ses.createQuery("from FacultySubject where factId='" + fs.getFactId() + "'");
        List<FacultySubject> list = q.list();
        System.out.println("List in dao: " + list.get(0).getFactId() + " " + list.get(0).getFactSubDetail());
        return list;
    }

    public String updateFacultySubject(FacultySubject fs) {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();
        Transaction tx = ses.beginTransaction();
        try {
            ses.update(fs);
            tx.commit();
            ses.close();
            return "success";
        } catch (Exception e) {
            return "error";
        }
    }
}
