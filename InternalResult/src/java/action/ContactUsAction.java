/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dto.MyMail;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Kushal
 */
public class ContactUsAction extends ActionSupport implements Preparable {

    MyMail mail;
    String Name,Email;
    String sub,con;

    public String getSub() {
        return sub;
    }

    public void setSub(String sub) {
        this.sub = sub;
    }

    public String getCon() {
        return con;
    }

    public void setCon(String con) {
        this.con = con;
    }


    public MyMail getMail() {
        return mail;
    }

    public void setMail(MyMail mail) {
        this.mail = mail;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    @Override
    public void prepare() throws Exception {
        mail = new MyMail();
    }

    @Override
    public String execute() throws Exception {
        mail = new MyMail();
        mail.setSubject(sub);
        
        mail.setContent("Name : "+Name+"\nEmail : "+Email+"\n\n"+con);
        System.out.println(mail);
        System.out.println("\n\n : Name"+Name);
        System.out.println("\n Subject"+sub);
        System.out.println("Contect "+con);
        mail.setReceiverEmailId("teams8834@gmail.com");
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
        return "success";
    }
}
