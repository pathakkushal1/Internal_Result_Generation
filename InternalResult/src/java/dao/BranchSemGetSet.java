package dao;

public class BranchSemGetSet
{
   private String branch;
   private int semester;
   private Integer sub1;
     private Integer sub2;
     private Integer sub3;
     private Integer sub4;
     private Integer sub5;
     private Integer pra1;
     private Integer pra2;
     private Integer pra3;
     private Integer pra4;

    public Integer getSub1() {
        return sub1;
    }

    public void setSub1(Integer sub1) {
        this.sub1 = sub1;
    }

    public Integer getSub2() {
        return sub2;
    }

    public void setSub2(Integer sub2) {
        this.sub2 = sub2;
    }

    public Integer getSub3() {
        return sub3;
    }

    public void setSub3(Integer sub3) {
        this.sub3 = sub3;
    }

    public Integer getSub4() {
        return sub4;
    }

    public void setSub4(Integer sub4) {
        this.sub4 = sub4;
    }

    public Integer getSub5() {
        return sub5;
    }

    public void setSub5(Integer sub5) {
        this.sub5 = sub5;
    }

    public Integer getPra1() {
        return pra1;
    }

    public void setPra1(Integer pra1) {
        this.pra1 = pra1;
    }

    public Integer getPra2() {
        return pra2;
    }

    public void setPra2(Integer pra2) {
        this.pra2 = pra2;
    }

    public Integer getPra3() {
        return pra3;
    }

    public void setPra3(Integer pra3) {
        this.pra3 = pra3;
    }

    public Integer getPra4() {
        return pra4;
    }

    public void setPra4(Integer pra4) {
        this.pra4 = pra4;
    }
     
     

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }

    @Override
    public String toString() {
        return "BranchSemGetSet{" + "branch=" + branch + ", semester=" + semester + '}';
    }
   
}