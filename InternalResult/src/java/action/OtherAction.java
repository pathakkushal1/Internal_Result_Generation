package action;

import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.LoginDetailsGetSet;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;


public class OtherAction implements Preparable , ModelDriven<LoginDetailsGetSet>, SessionAware
{
    Map<String, Object> map;
    LoginDetailsGetSet loginDetailsGetSet;
    private String othersname;
    private String otherspost;

    public LoginDetailsGetSet getLoginDetailsGetSet() {
        return loginDetailsGetSet;
    }

    public void setLoginDetailsGetSet(LoginDetailsGetSet loginDetailsGetSet) {
        this.loginDetailsGetSet = loginDetailsGetSet;
    }

    public String getOthersname() {
        return othersname;
    }

    public String getOtherspost() {
        return otherspost;
    }
    
    
  public String callCheckOtherLogin()
 {

  if(loginDetailsGetSet.getName().equalsIgnoreCase("Chetan") && loginDetailsGetSet.getPassword().equals("12345")){
      
      othersname = "Chetan Sir";
      otherspost = "Principal";
      boolean yes = true;
        map.put("check", yes);
      return "success";
      
  }
  else if(loginDetailsGetSet.getName().equalsIgnoreCase("Shalu") && loginDetailsGetSet.getPassword().equals("12345")){

      othersname= "Shalu";
      otherspost= "Management";
      boolean yes = true;
        map.put("check", yes);
      return "success";
      
  }
  else if(loginDetailsGetSet.getName().equalsIgnoreCase("Ankur") && loginDetailsGetSet.getPassword().equals("12345")){
      
      othersname= "Ankur Agrawal";
      otherspost= "Management";
      boolean yes = true;
        map.put("check", yes);
      return "success";
      
  }
  else if(loginDetailsGetSet.getName().equalsIgnoreCase("Ayushi") && loginDetailsGetSet.getPassword().equals("12345")){

      othersname= "Aayushi Agrawal";
      otherspost= "Management";
      boolean yes = true;
        map.put("check", yes);
      return "success";
      
  }
  else if(loginDetailsGetSet.getName().equalsIgnoreCase("Dheeresh") && loginDetailsGetSet.getPassword().equals("12345")){
      
      othersname= "Dheeresh Udawat";
      otherspost= "Management";
      boolean yes = true;
        map.put("check", yes);
      return "success";
      
  }
  
  else
  {
      return "error";
  }
 }
 
 
 
 @Override
 public void prepare() throws Exception {
   loginDetailsGetSet = new LoginDetailsGetSet();
 }

    @Override
    public LoginDetailsGetSet getModel() {
        return loginDetailsGetSet;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.map = map;
    }

}