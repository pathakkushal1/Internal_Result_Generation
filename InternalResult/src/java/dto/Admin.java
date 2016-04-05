package dto;
// Generated Jul 12, 2015 6:02:16 AM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Admin generated by hbm2java
 */
@Entity
@Table(name="admin"
    ,catalog="project1"
)
public class Admin  implements java.io.Serializable {


     private String userid;
     private String password;
     private String email;
     private String picName;

    public Admin() {
    }

	
    public Admin(String userid, String password, String email) {
        this.userid = userid;
        this.password = password;
        this.email = email;
    }
    public Admin(String userid, String password, String email, String picName) {
       this.userid = userid;
       this.password = password;
       this.email = email;
       this.picName = picName;
    }
   
     @Id 

    
    @Column(name="userid", unique=true, nullable=false, length=25)
    public String getUserid() {
        return this.userid;
    }
    
    public void setUserid(String userid) {
        this.userid = userid;
    }

    
    @Column(name="password", nullable=false, length=45)
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    
    @Column(name="email", nullable=false, length=45)
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    
    @Column(name="picName", length=45)
    public String getPicName() {
        return this.picName;
    }
    
    public void setPicName(String picName) {
        this.picName = picName;
    }




}


