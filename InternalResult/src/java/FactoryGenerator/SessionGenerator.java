package FactoryGenerator;

import dto.*;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

/**
 *
 * @author Aditya Kasbekar
 */
public class SessionGenerator {

    public static SessionFactory getSessionFactory() {
        AnnotationConfiguration cfg = new AnnotationConfiguration();
        cfg = cfg.addAnnotatedClass(StudentDetails.class);
        cfg = cfg.addAnnotatedClass(Faculty.class);
        cfg = cfg.configure();
        SessionFactory sf = cfg.buildSessionFactory();
        return sf;
    }
}
