/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.FacultyDao;
import dto.FacultySubject;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Aditya Kasbekar
 */
public class FacultySubjectAction extends ActionSupport implements Preparable, ModelDriven<FacultySubject>, SessionAware {

    private FacultySubject fs;
    private FacultyDao fdao;
    private Map<String, Object> map;
    private List<FacultySubject> list;
    private String fid;
    private String fsub;

    public String getFid() {
        return fid;
    }

    public void setFid(String fid) {
        this.fid = fid;
    }

    public FacultySubject getFs() {
        return fs;
    }

    public void setFs(FacultySubject fs) {
        this.fs = fs;
    }

    public List<FacultySubject> getList() {
        return list;
    }

    public void setList(List<FacultySubject> list) {
        this.list = list;
    }

    public String callGetFacultySubject() {
        list = fdao.getFacultySubject(fs);
        System.out.println("List in action: " + list.get(0).getFactId() + " " + list.get(0).getFactSubDetail());
        fid = list.get(0).getFactId();
        fsub = list.get(0).getFactSubDetail();
        if (list != null) {
            map.put("f1", fid);
            map.put("f2", fsub);
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public String callUpdateFacultySubject() {
        String flag = fdao.updateFacultySubject(fs);
        int l = flag.length();
        return flag;
    }

    @Override
    public void prepare() throws Exception {
        fs = new FacultySubject();
        fdao = new FacultyDao();
    }

    @Override
    public FacultySubject getModel() {
        return fs;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.map = map;
    }

}
