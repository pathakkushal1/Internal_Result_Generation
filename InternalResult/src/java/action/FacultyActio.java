package action;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.CheckFacultyLoginGetDetails;
import dao.LoginDetailsGetSet;
import dto.Admin;
import dto.Faculty;
import dto.MyMail;
import java.util.Map;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;


public class FacultyActio implements Preparable , ModelDriven<LoginDetailsGetSet>, SessionAware ,ServletRequestAware
{
    HttpServletRequest rst;
    LoginDetailsGetSet loginDetailsGetSet;
    CheckFacultyLoginGetDetails checkFacultyLoginGetDetails;
    Faculty facultyname;
    Faculty ans;
    private MyMail mail;
    Map<String, Object> map;

    public LoginDetailsGetSet getLoginDetailsGetSet() {
        return loginDetailsGetSet;
    }

    public void setLoginDetailsGetSet(LoginDetailsGetSet loginDetailsGetSet) {
        this.loginDetailsGetSet = loginDetailsGetSet;
    }

    public Faculty getFacultyname() {
        return facultyname;
    }

    public void setFacultyname(Faculty facultyname) {
        this.facultyname = facultyname;
    }

 public String callCheckFacultyLogin()
 {
     System.out.println(loginDetailsGetSet);
    facultyname = checkFacultyLoginGetDetails.showFacultyLoginCheck(loginDetailsGetSet);
    
    if(facultyname!=null)
    {
        boolean yes = true;
        map.put("check", yes);
        return "success";
    }
    else
    {
        return "error";
    }

 }
 
 public String logoutFaculty() {
        boolean no = false;
        
        map.put("check", no);
        map.put("msg", "You have signed out");
        return SUCCESS;
    }

 public String callFacultyGetEmail()
 {
     //LoginDetailsGetSet ans = CheckFacultyLoginGetDetails.checkUserId(loginDetailsGetSet);
     ans = CheckFacultyLoginGetDetails.checkUserId(loginDetailsGetSet);
        if (ans == null) {
            map.put("msg", "Invalid UserId");
            return ERROR;
        } else {
            sendMail(ans);
            map.put("msg", "Check your Email For Password");
            return SUCCESS;
        }
    }

    public void sendMail(Faculty ad) {
        mail = new MyMail();
        System.out.println(ad);
        mail.setReceiverEmailId(ad.getFacultyEmail());
        mail.setSubject("Password");
        mail.setContent("Your password : " + ad.getFacultyPass());
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session session1 = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(mail.getGmailUserName(), mail.getGmailUserPass());
                    }
                });
        try {
            Message message = new MimeMessage(session1);
            message.setFrom(new InternetAddress(mail.getSenderEmailId()));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(mail.getReceiverEmailId()));
            message.setSubject(mail.getSubject());
            message.setText(mail.getContent());

            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.map = map;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        rst = hsr;
    }
     
 @Override
 public void prepare() throws Exception {
  loginDetailsGetSet = new LoginDetailsGetSet();
  checkFacultyLoginGetDetails = new CheckFacultyLoginGetDetails();
  ans = new Faculty();
 }

    @Override
    public LoginDetailsGetSet getModel() {
        return loginDetailsGetSet;
    }

}