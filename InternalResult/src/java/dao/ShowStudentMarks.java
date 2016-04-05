package dao;

import dto.Subject;
import dto.SubjectId;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;



public class ShowStudentMarks {

    public List<BranchSemGetSet> showStudentMarksBranchSem(BranchSemGetSet cmarks) {
        SessionFactory sf = FacGen.FactoryGenerator.getSessionFactory();
        Session ses = sf.openSession();
        Query q = ses.createQuery("from StdMarks where semester = ? and branch = ?");
        q.setInteger(0, cmarks.getSemester());
        q.setString(1, cmarks.getBranch());
        List<BranchSemGetSet> list = q.list();
        ses.close();
        try {
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Object[]> showSubjectWisePerformance(BranchSemGetSet cmarks) {
        SessionFactory sf = FacGen.FactoryGenerator.getSessionFactory();
        Session ses = sf.openSession();
        Query q = ses.createQuery("select sub1, sub2, sub3, sub4, sub5 from StdMarks where semester = ? and branch = ?");
        q.setInteger(0, cmarks.getSemester());
        q.setString(1, cmarks.getBranch());
        List<Object[]> list2 = q.list();
        ses.close();
        try {
            return list2;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Subject getAllSubject(SubjectId subId) {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();
        Subject sub = (Subject) ses.get(Subject.class, subId);
        return sub;
    }

}
