/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.StudentDetails;
import dto.Studentexdetails;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projection;

/**
 *
 * @author Kushal
 */
public class StudentDetailsdao {

    public String updateStudent(StudentDetails sd) {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();
        Transaction tra = ses.beginTransaction();
        try {
            ses.update(sd);
            tra.commit();
            ses.close();
            return "success";
        } catch (Exception e) {
            return "error";
        }

    }

    public String saveStudent(StudentDetails sd) {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();

        Transaction tx = ses.beginTransaction();
        Serializable sz = ses.save(sd);
        tx.commit();
        ses.close();
        return sz.toString();
    }

    public StudentDetails getSingleSudentData(StudentDetails std1) {

        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();
        try {
            StudentDetails obj = (StudentDetails) ses.get(StudentDetails.class, std1.getStdRollnumber());
            System.out.println(obj);
            return obj;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    public List<StudentDetails> getStudents(String stdBranch, Integer stdSemester) {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();
        Query q = ses.createQuery("from StudentDetails where stdBranch='" + stdBranch + "' and stdSemester='" + stdSemester + "'");
        List<StudentDetails> list = q.list();
        return list;
    }

    /*
    public List<Studentexdetails> getStudentEx(Studentexdetails se) {
        System.out.println("IN dao:" + se);
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();
        System.out.println("running");
        Query q = ses.createQuery("from Studentexdetails where stdRollEx='" + se.getStdRollEx() + "'");
        List<Studentexdetails> list = q.list();
        System.out.println("List in dao:" + list);
        return list;
    }*/
    
    public List<Studentexdetails> getStudentEx(Studentexdetails se) {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();

        Query q = ses.createQuery("from Studentexdetails where stdRollEx='" + se.getStdRollEx() + "'");
        List<Studentexdetails> list = q.list();
        if (list.isEmpty()) {
            return null;
        } else {
            return list;
        }
    }

    public String updateStudentEx(Studentexdetails se) {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();
        Transaction tx = ses.beginTransaction();
        try {
            ses.saveOrUpdate(se);
            tx.commit();
            ses.close();
            return "success";
        } catch (Exception e) {
            return "error";
        }
    }

    public List<String> getStudentExSubject(Studentexdetails std) {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();
        System.out.println("running");
        //  Query q = ses.createQuery("select studentExDetailscol from Studentexdetails where stdRollEx='" + std.getStdRollEx() + "'");
        SQLQuery q = ses.createSQLQuery("select StudentExDetailscol from studentexdetails where stdRollEx='" + std.getStdRollEx() + "'");
        List<String> list = q.list();
        System.out.println("List in dao:" + list);
        return list;
    }

    public String saveSingleStudentEx(Studentexdetails stdEx) {

        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();

        Transaction tx = ses.beginTransaction();
        Serializable sz = ses.save(stdEx);
        tx.commit();
        ses.close();
        return sz.toString();
    }

}
