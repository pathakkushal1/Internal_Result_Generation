package dto;
// Generated Jul 12, 2015 6:02:16 AM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Passout generated by hbm2java
 */
@Entity
@Table(name="passout"
    ,catalog="project1"
)
public class Passout  implements java.io.Serializable {


     private String stdroll;
     private String batch;
     private Integer passoutYear;
     private String stdName;
     private String stdAddress;
     private Long stdNumber;
     private Long cgpa;

    public Passout() {
    }

	
    public Passout(String stdroll) {
        this.stdroll = stdroll;
    }
    public Passout(String stdroll, String batch, Integer passoutYear, String stdName, String stdAddress, Long stdNumber, Long cgpa) {
       this.stdroll = stdroll;
       this.batch = batch;
       this.passoutYear = passoutYear;
       this.stdName = stdName;
       this.stdAddress = stdAddress;
       this.stdNumber = stdNumber;
       this.cgpa = cgpa;
    }
   
     @Id 

    
    @Column(name="stdroll", unique=true, nullable=false, length=20)
    public String getStdroll() {
        return this.stdroll;
    }
    
    public void setStdroll(String stdroll) {
        this.stdroll = stdroll;
    }

    
    @Column(name="batch", length=45)
    public String getBatch() {
        return this.batch;
    }
    
    public void setBatch(String batch) {
        this.batch = batch;
    }

    
    @Column(name="passoutYear")
    public Integer getPassoutYear() {
        return this.passoutYear;
    }
    
    public void setPassoutYear(Integer passoutYear) {
        this.passoutYear = passoutYear;
    }

    
    @Column(name="std_name", length=25)
    public String getStdName() {
        return this.stdName;
    }
    
    public void setStdName(String stdName) {
        this.stdName = stdName;
    }

    
    @Column(name="stdAddress", length=45)
    public String getStdAddress() {
        return this.stdAddress;
    }
    
    public void setStdAddress(String stdAddress) {
        this.stdAddress = stdAddress;
    }

    
    @Column(name="stdNumber")
    public Long getStdNumber() {
        return this.stdNumber;
    }
    
    public void setStdNumber(Long stdNumber) {
        this.stdNumber = stdNumber;
    }

    
    @Column(name="cgpa", precision=10, scale=0)
    public Long getCgpa() {
        return this.cgpa;
    }
    
    public void setCgpa(Long cgpa) {
        this.cgpa = cgpa;
    }




}


