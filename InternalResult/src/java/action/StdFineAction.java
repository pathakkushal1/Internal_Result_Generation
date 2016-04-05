/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.StdFineDao;
import dao.StudentDetailsdao;
import dto.Stdfine;
import dto.StudentDetails;

/**
 *
 * @author Kushal
 */
public class StdFineAction extends ActionSupport implements Preparable, ModelDriven<Stdfine> {
    
    Stdfine stdF;
    StdFineDao stdFDao;
    StudentDetails stdD;
    StudentDetailsdao stdDao;

    @Override
    public void prepare() throws Exception {
        stdF = new Stdfine();
        stdFDao = new StdFineDao();
        stdD = new StudentDetails();
        stdDao = new StudentDetailsdao();
    }
    
    @Override
    public Stdfine getModel() {
        return stdF;
    }
    
    public String callRemoveFine() {
        System.out.println("Here we get started");
        System.out.println("Object : " + stdF);
        String ans = stdFDao.removeFine(stdF);
        return ans;
    }

    public String callAddFine() {
        
        System.out.println("Here we get started");
        System.out.println("Object : " + stdF);
        stdD.setStdRollnumber(stdF.getStdRollN());
        stdD = stdDao.getSingleSudentData(stdD);
        stdD.setStdfine(stdF);
        stdF.setStudentDetails(stdD);
        System.out.println("Here we get started");
        System.out.println("Object : " + stdF);
        String ans = stdFDao.addFine(stdF);
        return ans;
    }
    
}
