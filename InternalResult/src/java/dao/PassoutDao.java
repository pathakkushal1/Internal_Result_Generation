/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Passout;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Aditya Kasbekar
 */
public class PassoutDao {

    public List<Passout> getPassouts() {
        SessionFactory sf = FactoryGenerator.SessionGenerator.getSessionFactory();
        Session ses = sf.openSession();

        Query q = ses.createQuery("from Passout");
        List<Passout> list = q.list();
        return list;
    }

}
