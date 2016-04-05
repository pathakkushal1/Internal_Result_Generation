/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.PassoutDao;
import dto.Passout;
import java.util.List;

/**
 *
 * @author Aditya Kasbekar
 */
public class PassoutAction extends ActionSupport implements Preparable, ModelDriven<Passout> {

    private Passout passout;
    private PassoutDao pdao;
    private List<Passout> list;

    public List<Passout> getList() {
        return list;
    }

    public void setList(List<Passout> list) {
        this.list = list;
    }

    public Passout getPassout() {
        return passout;
    }

    public void setPassout(Passout passout) {
        this.passout = passout;
    }

    public String callGetPassouts() {
        list = pdao.getPassouts();
        System.out.println("list: " + list.get(0).getStdName());
        if (list != null) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    @Override
    public void prepare() throws Exception {
        passout = new Passout();
        pdao = new PassoutDao();
    }

    @Override
    public Passout getModel() {
        return passout;
    }
}
