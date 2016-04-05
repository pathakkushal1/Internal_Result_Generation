package action;

import com.opensymphony.xwork2.*;
import static com.opensymphony.xwork2.Action.SUCCESS;
import dao.AdminDao;
import dto.Admin;
import dto.MyMail;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.Properties;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.apache.commons.io.FileUtils;

public class AdminValidation extends ActionSupport implements Preparable, ModelDriven<Admin>, SessionAware ,ServletRequestAware {
    HttpServletRequest rst;
    Admin adm;
    Map<String, Object> map;
    String useridF;
    private MyMail mail;
    private File myE;
    private String myEFileName;
    private String myEContentType;

    public File getMyE() {
        return myE;
    }

    public void setMyE(File myE) {
        this.myE = myE;
    }

    public String getMyEFileName() {
        return myEFileName;
    }

    public void setMyEFileName(String myEFileName) {
        this.myEFileName = myEFileName;
    }

    public String getMyEContentType() {
        return myEContentType;
    }

    public void setMyEContentType(String myEContentType) {
        this.myEContentType = myEContentType;
    }

    

    public Admin getAdm() {
        return adm;
    }

    public void setAdm(Admin adm) {
        this.adm = adm;
    }

    @Override
    public void prepare() throws Exception {
        adm = new Admin();
    }

    @Override
    public Admin getModel() {
        return adm;
    }

    public String validateAdmin() {
        adm = dao.AdminDao.validateAdmin(adm);
        if (adm!=null) {
            boolean yes = true;
            map.put("Stdobject", adm);
            map.put("check", yes);
            return SUCCESS;
        } else {
            map.put("msg", "Invalid Username or Password");
            return ERROR;
        }
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.map = map;
    }

    public String logoutAdmin() {
        boolean no = false;
        
        map.put("check", no);
        map.put("msg", "You have signed out");
        return SUCCESS;
    }

    public String getUserId() {
        System.out.println("Id at action : " + useridF);
        Admin ans = dao.AdminDao.checkUserId(adm);
        if (ans == null) {
            map.put("msg", "Invalid UserId");
            return ERROR;
        } else {
            sendMail(ans);
            map.put("msg", "Check your Email For Password");
            return SUCCESS;
        }
    }

    public void sendMail(Admin ad) {
        mail = new MyMail();
        mail.setReceiverEmailId(ad.getEmail());
        mail.setSubject("Password");
        mail.setContent("Your password : " + ad.getPassword());
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
    
    public String callUpdateAdminData(){
        String flag = AdminDao.updateAdmin(adm);
        map.put("Stdobject", adm);
        return flag;
    }
    
    public String callUpdatePhotoAdminData(){
        System.out.println("Control comes here");
         String filePath = rst.getSession().getServletContext().getRealPath("/");
            File fileToCreat = new File(filePath, this.myEFileName);
        try {
            FileUtils.copyFile(this.myE, fileToCreat);
            
            adm = AdminDao.validateAdmin(adm);
            System.out.println("File Name : "+myEFileName);
            System.out.println("File Context : "+myEContentType);
       
             map.put("Stdobject", adm);
        } catch (IOException ex) {
           ex.printStackTrace();
        }
            return SUCCESS;
    }
    
    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        rst = hsr;
    }
}
