package action;

import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.BranchSemGetSet;
import dao.ShowStudentMarks;
import dto.Subject;
import dto.SubjectId;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

public class BranchSemAction implements Preparable , ModelDriven<BranchSemGetSet>, SessionAware
{
    BranchSemGetSet branchSemGetSet;
    ShowStudentMarks showStudentMarks;
    Map<String, Object> map;
    List<BranchSemGetSet> list;
    List<Object[]> listetc;
    SubjectId subId;
    Subject sub;

public double persub1;
public double persub2;
public double persub3;
public double persub4;
public double persub5;

public int pass1;
public int pass2;
public int pass3;
public int pass4;
public int pass5;
//public double percentagec;
public int count;

    /*public double getPercentagec() {
        return percentagec;
    }

    public void setPercentagec(double percentagec) {
        this.percentagec = percentagec;
    }*/

    public Subject getSub() {
        return sub;
    }

    public void setSub(Subject sub) {
        this.sub = sub;
    }

    public BranchSemGetSet getBranchSemGetSet() {
        return branchSemGetSet;
    }

    public void setBranchSemGetSet(BranchSemGetSet branchSemGetSet) {
        this.branchSemGetSet = branchSemGetSet;
    }

    public int getPass1() {
        return pass1;
    }

    public void setPass1(int pass1) {
        this.pass1 = pass1;
    }

    public int getPass2() {
        return pass2;
    }

    public void setPass2(int pass2) {
        this.pass2 = pass2;
    }

    public int getPass3() {
        return pass3;
    }

    public void setPass3(int pass3) {
        this.pass3 = pass3;
    }

    public int getPass4() {
        return pass4;
    }

    public void setPass4(int pass4) {
        this.pass4 = pass4;
    }

    public int getPass5() {
        return pass5;
    }

    public void setPass5(int pass5) {
        this.pass5 = pass5;
    }


    public double getPersub1() {
        return persub1;
    }

    public void setPersub1(double persub1) {
        this.persub1 = persub1;
    }

    public double getPersub2() {
        return persub2;
    }

    public void setPersub2(double persub2) {
        this.persub2 = persub2;
    }

    public double getPersub3() {
        return persub3;
    }

    public void setPersub3(double persub3) {
        this.persub3 = persub3;
    }

    public double getPersub4() {
        return persub4;
    }

    public void setPersub4(double persub4) {
        this.persub4 = persub4;
    }

    public double getPersub5() {
        return persub5;
    }

    public void setPersub5(double persub5) {
        this.persub5 = persub5;
    }

    public List<BranchSemGetSet> getList() {
        return list;
    }

    public void setList(List<BranchSemGetSet> list) {
        this.list = list;
    }

    public List<Object[]> getListetc() {
        return listetc;
    }

    public void setListetc(List<Object[]> listetc) {
        this.listetc = listetc;
    }

 
    public String callCheckBranchSem()
    {
        loadObject();
        
        list = showStudentMarks.showStudentMarksBranchSem(branchSemGetSet);

        listetc = showStudentMarks.showSubjectWisePerformance(branchSemGetSet);

        //percentagec;
        //System.out.println("This is the calculated % = "+percentagec);
        //percentagec = percentagec/5;
        for(Object[] list1 : listetc) {
 
            count++;
            if((int) list1[0] >= 33)
            {            
                pass1++;
            }
            if((int) list1[1] >= 33)
            {
                pass2++;
            }
            if((int) list1[2] >= 33)
            {
                pass3++;
            }
            if((int) list1[3] >= 33)
            {
                pass4++;
            }
            if((int) list1[4] >= 33)
            {
                pass5++;
            }
        }
        try {
            pass1 = pass1*100;
        persub1 = pass1/count;
        pass2 = pass2*100;
        persub2 = pass2/count;
        pass3 = pass3*100;
        persub3 = pass3/count;
        pass4 = pass4*100;
        persub4 = pass4/count;
        pass5 = pass5*100;
        persub5 = pass5/count;

      if(list != null)
        {
            boolean yes = true;
        map.put("check", yes);
          return "success";
        }
      else
      {
          return "error";
      }
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
        
    }
    
    public void loadObject() {
        subId = new SubjectId(branchSemGetSet.getSemester(), branchSemGetSet.getBranch());
        sub = showStudentMarks.getAllSubject(subId);
        System.out.println(sub);
    }
    
 @Override
 public void prepare() throws Exception {
     branchSemGetSet = new BranchSemGetSet();
     showStudentMarks = new ShowStudentMarks();
     sub = new Subject();
 }

    @Override
    public BranchSemGetSet getModel() {
        return branchSemGetSet;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.map = map;
    }

}