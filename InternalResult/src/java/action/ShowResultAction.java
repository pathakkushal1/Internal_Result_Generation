/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.ResultDao;
import dao.StdFineDao;
import dao.StudentDetailsdao;
import dao.SubjectDao;
import dto.StdMarks;
import dto.Stdfine;
import dto.StudentDetails;
import dto.Subject;
import dto.SubjectId;
import java.util.Map;
import javax.persistence.PrePersist;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Kushal
 */
public class ShowResultAction extends ActionSupport implements Preparable, ModelDriven<StdMarks>,SessionAware {

    StdMarks stdM;
    StudentDetails stdDetails;
    Subject sub;
    StudentDetailsdao stdDao;
    SubjectDao subDao;
    SubjectId subId;
    ResultDao reDao;
    Stdfine stdF;
    StdFineDao stdFDao;
    Map<String,Object> map;

    public StdMarks getStdM() {
        return stdM;
    }

    public void setStdM(StdMarks stdM) {
        this.stdM = stdM;
    }

    public StudentDetails getStdDetails() {
        return stdDetails;
    }

    public void setStdDetails(StudentDetails stdDetails) {
        this.stdDetails = stdDetails;
    }

    public Subject getSub() {
        return sub;
    }

    public void setSub(Subject sub) {
        this.sub = sub;
    }

    public String showResult() {
        loadObject();
        stdM = reDao.getSingleStudentResult(stdM);

        //  stdTop = reDao.getHighestMarks();
        if (stdM != null) {
            return "success";
        } else {
            return "error";
        }
    }

    @Override
    public void prepare() throws Exception {
        stdM = new StdMarks();
        stdDetails = new StudentDetails();
        sub = new Subject();
        stdDao = new StudentDetailsdao();
        subDao = new SubjectDao();
        reDao = new ResultDao();
        stdF = new Stdfine();
        stdFDao = new StdFineDao();
    }

    @Override
    public StdMarks getModel() {
        return stdM;
    }

    public void loadObject() {
        stdDetails.setStdRollnumber(stdM.getStdRoll());
        stdDetails = stdDao.getSingleSudentData(stdDetails);
        System.out.println("Sem :" + stdM.getSemester());
        System.out.println("Branch : " + stdDetails.getStdBranch());
        subId = new SubjectId(stdM.getSemester(), stdDetails.getStdBranch());
        sub = subDao.getAllSubject(subId);
        System.out.println(sub);
    }

    public String callUpdateSem() {
        reDao.updateSem(stdM);
        return SUCCESS;
    }

    public String callCheckFine() {
        stdF.setStdRollN(stdM.getStdRoll());
        stdF = stdFDao.checkFine(stdF);
        System.out.println(stdF);
        if (stdF != null) {
            if (stdF.getAmount() == 0) {
                showResult();
                return SUCCESS;
            } else {
                map.put("fine", stdF);
                return ERROR;
            }
        } else {

            showResult();
            return SUCCESS;
        }
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.map = map;
    }
    
  
}
