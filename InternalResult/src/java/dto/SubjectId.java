package dto;
// Generated Jul 12, 2015 6:02:16 AM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * SubjectId generated by hbm2java
 */
@Embeddable
public class SubjectId  implements java.io.Serializable {


     private int semid;
     private String branch;

    public SubjectId() {
    }

    public SubjectId(int semid, String branch) {
       this.semid = semid;
       this.branch = branch;
    }
   


    @Column(name="semid", nullable=false)
    public int getSemid() {
        return this.semid;
    }
    
    public void setSemid(int semid) {
        this.semid = semid;
    }


    @Column(name="branch", nullable=false, length=45)
    public String getBranch() {
        return this.branch;
    }
    
    public void setBranch(String branch) {
        this.branch = branch;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof SubjectId) ) return false;
		 SubjectId castOther = ( SubjectId ) other; 
         
		 return (this.getSemid()==castOther.getSemid())
 && ( (this.getBranch()==castOther.getBranch()) || ( this.getBranch()!=null && castOther.getBranch()!=null && this.getBranch().equals(castOther.getBranch()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getSemid();
         result = 37 * result + ( getBranch() == null ? 0 : this.getBranch().hashCode() );
         return result;
   }   


}


