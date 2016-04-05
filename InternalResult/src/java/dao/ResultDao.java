/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.StdMarks;
import dto.StudentDetails;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Kushal
 */
public class ResultDao {

    public String saveResultForStudent(StdMarks std) {
        System.out.println("Marks object in dao : " + std);
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();
        Transaction tx = ses.beginTransaction();
        Serializable sz = ses.save(std);
        tx.commit();
        ses.close();
        if (sz.toString().equals("")) {
            return "error";
        } else {
            return "succes";
        }
    }

    public StdMarks getSingleStudentResult(StdMarks stdM) {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();
        stdM = (StdMarks) ses.get(StdMarks.class, stdM.getStdRoll());
        return stdM;
    }

    public StdMarks getHighestMarks() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void updateSem(StdMarks stdM) {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();
        Transaction tx = ses.beginTransaction();
        Query q = ses.createQuery("from StdMarks");
        tx.commit();
        List<StdMarks> list = q.list();
        int n = list.size();
        for (int i = 0; i < n; i++) {
            //System.out.println("Roll:" + list.get(i).getStdRoll() + " Sem:" + list.get(i).getSemester());
            Transaction tx2 = ses.beginTransaction();
            String query = "update std_marks set semester=" + (list.get(i).getSemester() + 1) + " where std_roll='" + list.get(i).getStdRoll() + "'";
            //System.out.println(query);
            ses.createSQLQuery(query).executeUpdate();
            tx2.commit();
        }
        ses.close();
        updatePassoutTable();
    }

    public String deleteResult(StdMarks stdR) {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();
        Transaction tx = ses.beginTransaction();
        System.out.println("Sem : " + stdR.getBranch());
        System.out.println("Branch : " + stdR.getSemester());
        try {
            Query q = ses.createQuery("delete from StdMarks where semester=? and branch=?");
            q.setInteger(0, stdR.getSemester());
            q.setString(1, stdR.getBranch());
            int a = q.executeUpdate();
            tx.commit();
            ses.close();
            System.out.println("Int : " + a);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }

    }
    public void updatePassoutTable() {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();
        Transaction tx = ses.beginTransaction();

        //Get all students who have semester = 9
        Query q = ses.createQuery("from StdMarks");
        tx.commit();
        List<StdMarks> list = q.list();
        int n = list.size();
        List<String> rollList = new ArrayList<String>();
        for (int i = 0; i < n; i++) {
            if (list.get(i).getSemester() == 9) {
                //System.out.println("To be added to Passout Table : " + list.get(i).getStdRoll());
                rollList.add(list.get(i).getStdRoll());
                //System.out.println("add() works!");
                Transaction tx2 = ses.beginTransaction();
                //System.out.println("To be deleted from Std_Marks Table : " + list.get(i).getStdRoll());
                Query q2 = ses.createSQLQuery("delete from std_marks where std_roll='" + list.get(i).getStdRoll() + "'");
                q2.executeUpdate();
                tx2.commit();
            }
        }

        System.out.println("List rollList: " + rollList);

        //Add those students to Passout Table
        String roll = "", name = "", batch = "", address = "", passoutyear = "";
        long cno = 0;
        int length = rollList.size();
        for (int i = 0; i < length; i++) {
            try {
                Transaction tx2 = ses.beginTransaction();
                Query query = ses.createQuery("from StudentDetails where stdRollnumber=?");
                query.setString(0, rollList.get(i));
                tx2.commit();
                List<StudentDetails> list2 = query.list();
                roll = list2.get(0).getStdRollnumber();
                batch = list2.get(0).getStdBatch();
                StringTokenizer st = new StringTokenizer(batch, "-");
                st.nextToken();
                passoutyear = st.nextToken();
                name = list2.get(0).getStdName();
                address = list2.get(0).getStdAddress();
                cno = list2.get(0).getStdContact();
                Transaction tx3 = ses.beginTransaction();
                String query2 = "insert into passout(stdroll,batch,passoutYear,std_name,stdAddress,stdNumber) values('" + roll + "','" + batch + "','" + passoutyear + "','" + name + "','" + address + "'," + cno + ")";
                // System.out.println("Query fired: " + query2);
                Query q2 = ses.createSQLQuery(query2);
                q2.executeUpdate();
                tx3.commit();
                list2.clear();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        ses.close();
    }
}
