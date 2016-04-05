package action;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.StudentDetailsdao;
import dto.Studentexdetails;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Aditya Kasbekar
 */
public class StudentExAction extends ActionSupport implements Preparable, ModelDriven<Studentexdetails>, SessionAware {
    
    private Studentexdetails se;
    private StudentDetailsdao sdao;
    private List<Studentexdetails> list;
    private String sr, sr2;
    private Map<String, Object> map;
    private String studentExDetailscol;
    private String stdRollEx;
    
    public String getStudentExDetailscol() {
        return studentExDetailscol;
    }
    
    public void setStudentExDetailscol(String studentExDetailscol) {
        this.studentExDetailscol = studentExDetailscol;
    }
    
    public String getStdRollEx() {
        return stdRollEx;
    }
    
    public void setStdRollEx(String stdRollEx) {
        this.stdRollEx = stdRollEx;
    }
    
    public String getSr() {
        return sr;
    }
    
    public void setSr(String sr) {
        this.sr = sr;
    }
    
    public Studentexdetails getSe() {
        return se;
    }
    
    public void setSe(Studentexdetails se) {
        this.se = se;
    }
    
    public List<Studentexdetails> getList() {
        return list;
    }
    
    public void setList(List<Studentexdetails> list) {
        this.list = list;
    }
    /*
    public String callGetStudentEx() {
        list = sdao.getStudentEx(se);
        System.out.println("List in action:" + list);
        sr = list.get(0).getStudentExDetailscol();
        sr2 = list.get(0).getStdRollEx();
        System.out.println(sr);
        if (list != null) {
            map.put("sub", sr);
            map.put("sub2", sr2);
            return SUCCESS;
        } else {
            return ERROR;
        }
        
    }*/
    
    public String callGetStudentEx() {
        String rn = se.getStdRollEx();
        list = sdao.getStudentEx(se);
        if (list != null) {
            System.out.println("List in action:" + list);
            sr = list.get(0).getStudentExDetailscol();
            sr2 = list.get(0).getStdRollEx();
            map.put("sub", sr);
            map.put("sub2", sr2);
            return SUCCESS;
        } else {
            map.put("sub3", rn);
            return ERROR;
        }

    }

    public String callUpdateStudentEx() {
        String updEx = se.getStudentExDetailscol();
        int l = updEx.length();
        String updEx2 = "";
        for (int i = 0; i < l - 1; i++) {
            updEx2 += updEx.charAt(i) + "";
        }
        se.setStudentExDetailscol(updEx2);
        String flag = sdao.updateStudentEx(se);
        return flag;
    }
    
    @Override
    public void prepare() throws Exception {
        se = new Studentexdetails();
        sdao = new StudentDetailsdao();
    }
    
    @Override
    public Studentexdetails getModel() {
        return se;
    }
    
    @Override
    public void setSession(Map<String, Object> map) {
        this.map = map;
    }
}
