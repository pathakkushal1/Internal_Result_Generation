/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Subject;
import dto.SubjectId;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Kushal
 */
public class SubjectDao {

    public Subject getAllSubject(SubjectId subId) {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();
        Subject sub = (Subject) ses.get(Subject.class, subId);
        return sub;
    }
}
