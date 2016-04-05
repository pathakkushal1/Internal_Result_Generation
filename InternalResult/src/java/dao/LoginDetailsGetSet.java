package dao;

public class LoginDetailsGetSet {
    
   private String name;
   private String password;
   private String facultyEmail;
   
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFacultyEmail() {
        return facultyEmail;
    }

    public void setFacultyEmail(String facultyEmail) {
        this.facultyEmail = facultyEmail;
    }

    @Override
    public String toString() {
        return "LoginDetailsGetSet{" + "name=" + name + ", password=" + password + ", facultyEmail=" + facultyEmail + '}';
    }

}