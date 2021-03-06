package dto;
// Generated Jul 12, 2015 6:02:16 AM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * StudentDetails generated by hbm2java
 */
@Entity
@Table(name="student_details"
    ,catalog="project1"
)
public class StudentDetails  implements java.io.Serializable {


     private String stdRollnumber;
     private String stdName;
     private String stdEmail;
     private String stdBatch;
     private String stdBranch;
     private Integer stdSemester;
     private String stdAddress;
     private Long stdContact;
     private Stdfine stdfine;
     private StudentWorking studentWorking;
     private Studentexdetails studentexdetails;
     private StdMarks stdMarks;

    public StudentDetails() {
    }

	
    public StudentDetails(String stdRollnumber) {
        this.stdRollnumber = stdRollnumber;
    }
    public StudentDetails(String stdRollnumber, String stdName, String stdEmail, String stdBatch, String stdBranch, Integer stdSemester, String stdAddress, Long stdContact, Stdfine stdfine, StudentWorking studentWorking, Studentexdetails studentexdetails, StdMarks stdMarks) {
       this.stdRollnumber = stdRollnumber;
       this.stdName = stdName;
       this.stdEmail = stdEmail;
       this.stdBatch = stdBatch;
       this.stdBranch = stdBranch;
       this.stdSemester = stdSemester;
       this.stdAddress = stdAddress;
       this.stdContact = stdContact;
       this.stdfine = stdfine;
       this.studentWorking = studentWorking;
       this.studentexdetails = studentexdetails;
       this.stdMarks = stdMarks;
    }
   
     @Id 

    
    @Column(name="stdRollnumber", unique=true, nullable=false, length=20)
    public String getStdRollnumber() {
        return this.stdRollnumber;
    }
    
    public void setStdRollnumber(String stdRollnumber) {
        this.stdRollnumber = stdRollnumber;
    }

    
    @Column(name="stdName", length=25)
    public String getStdName() {
        return this.stdName;
    }
    
    public void setStdName(String stdName) {
        this.stdName = stdName;
    }

    
    @Column(name="stdEmail", length=25)
    public String getStdEmail() {
        return this.stdEmail;
    }
    
    public void setStdEmail(String stdEmail) {
        this.stdEmail = stdEmail;
    }

    
    @Column(name="stdBatch", length=25)
    public String getStdBatch() {
        return this.stdBatch;
    }
    
    public void setStdBatch(String stdBatch) {
        this.stdBatch = stdBatch;
    }

    
    @Column(name="stdBranch", length=15)
    public String getStdBranch() {
        return this.stdBranch;
    }
    
    public void setStdBranch(String stdBranch) {
        this.stdBranch = stdBranch;
    }

    
    @Column(name="stdSemester")
    public Integer getStdSemester() {
        return this.stdSemester;
    }
    
    public void setStdSemester(Integer stdSemester) {
        this.stdSemester = stdSemester;
    }

    
    @Column(name="stdAddress", length=45)
    public String getStdAddress() {
        return this.stdAddress;
    }
    
    public void setStdAddress(String stdAddress) {
        this.stdAddress = stdAddress;
    }

    
    @Column(name="stdContact")
    public Long getStdContact() {
        return this.stdContact;
    }
    
    public void setStdContact(Long stdContact) {
        this.stdContact = stdContact;
    }

@OneToOne(fetch=FetchType.LAZY, mappedBy="studentDetails")
    public Stdfine getStdfine() {
        return this.stdfine;
    }
    
    public void setStdfine(Stdfine stdfine) {
        this.stdfine = stdfine;
    }

@OneToOne(fetch=FetchType.LAZY, mappedBy="studentDetails")
    public StudentWorking getStudentWorking() {
        return this.studentWorking;
    }
    
    public void setStudentWorking(StudentWorking studentWorking) {
        this.studentWorking = studentWorking;
    }

@OneToOne(fetch=FetchType.LAZY, mappedBy="studentDetails")
    public Studentexdetails getStudentexdetails() {
        return this.studentexdetails;
    }
    
    public void setStudentexdetails(Studentexdetails studentexdetails) {
        this.studentexdetails = studentexdetails;
    }

@OneToOne(fetch=FetchType.LAZY, mappedBy="studentDetails")
    public StdMarks getStdMarks() {
        return this.stdMarks;
    }
    
    public void setStdMarks(StdMarks stdMarks) {
        this.stdMarks = stdMarks;
    }




}


