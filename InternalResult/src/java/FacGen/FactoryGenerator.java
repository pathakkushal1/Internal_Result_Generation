package FacGen;

import dao.BranchSemGetSet;
import dao.CheckFacultyLoginGetDetails;
import dao.LoginDetailsGetSet;
import dao.ShowStudentMarks;
import dto.Admin;
import dto.Faculty;
import dto.FacultySubject;
import dto.MyMail;
import dto.Passout;
import dto.StdMarks;
import dto.Stdfine;
import dto.StudentDetails;
import dto.StudentWorking;
import dto.Studentexdetails;
import dto.Subject;
//import dto.SubjectId;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class FactoryGenerator 
{
 public static SessionFactory getSessionFactory()
 {
  AnnotationConfiguration cfg = new  AnnotationConfiguration();

  cfg = cfg.addAnnotatedClass(Admin.class);
  cfg = cfg.addAnnotatedClass(Faculty.class);
  cfg = cfg.addAnnotatedClass(FacultySubject.class);
  cfg = cfg.addAnnotatedClass(Passout.class);
  cfg = cfg.addAnnotatedClass(StdMarks.class);
  cfg = cfg.addAnnotatedClass(StudentDetails.class);
  cfg = cfg.addAnnotatedClass(StudentWorking.class);
  cfg = cfg.addAnnotatedClass(Studentexdetails.class);
  cfg = cfg.addAnnotatedClass(Subject.class);
  cfg = cfg.addAnnotatedClass(MyMail.class);
  cfg = cfg.addAnnotatedClass(Stdfine.class);
  //cfg = cfg.addAnnotatedClass(SubjectId.class);
  
  cfg = cfg.addAnnotatedClass(BranchSemGetSet.class);
  cfg = cfg.addAnnotatedClass(LoginDetailsGetSet.class);
  cfg = cfg.addAnnotatedClass(CheckFacultyLoginGetDetails.class);
  cfg = cfg.addAnnotatedClass(ShowStudentMarks.class);
  
  cfg = cfg.configure();
  
  SessionFactory sf = cfg.buildSessionFactory();
  
  return sf;
 }
}