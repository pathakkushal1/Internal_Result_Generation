/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.FacultyDao;
import dto.Faculty;
import dto.MyMail;
import java.io.File;
import java.io.FileInputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author Kushal
 */
public class FacultyAction extends ActionSupport implements Preparable, ModelDriven<Faculty> {

    private Faculty fact;
    private File myExcelSheet;
    private String myExcelSheetFileName;
    private String myExcelSheetContextType;
    private FacultyDao factDao;
    private MyMail mail;
    private String gen = "ABCDEFGH";
    private List<Faculty> list;

    public List<Faculty> getList() {
        return list;
    }

    public void setList(List<Faculty> list) {
        this.list = list;
    }

    
    public Faculty getFact() {
        return fact;
    }

    public void setFact(Faculty fact) {
        this.fact = fact;
    }

    public File getMyExcelSheet() {
        return myExcelSheet;
    }

    public void setMyExcelSheet(File myExcelSheet) {
        this.myExcelSheet = myExcelSheet;
    }

    public String getMyExcelSheetFileName() {
        return myExcelSheetFileName;
    }

    public void setMyExcelSheetFileName(String myExcelSheetFileName) {
        this.myExcelSheetFileName = myExcelSheetFileName;
    }

    public String getMyExcelSheetContextType() {
        return myExcelSheetContextType;
    }

    public void setMyExcelSheetContextType(String myExcelSheetContextType) {
        this.myExcelSheetContextType = myExcelSheetContextType;
    }

    public MyMail getMail() {
        return mail;
    }

    public void setMail(MyMail mail) {
        this.mail = mail;
    }

    public String callAddFacultyExcel() {
        System.out.println("we are in Faculty Action excel");
        try {
            XSSFWorkbook wb = new XSSFWorkbook(new FileInputStream(myExcelSheet));

            // Get first sheet from the workbook
            XSSFSheet sheet = wb.getSheetAt(0);

            Row row;
            Cell cell;

            // Iterate through each rows from first sheet
            Iterator<Row> rowIterator = sheet.iterator();
            int i = 0;
            row = rowIterator.next();
            while (rowIterator.hasNext()) {
                row = rowIterator.next();

                // For each row, iterate through each columns
                Iterator<Cell> cellIterator = row.cellIterator();

                while (cellIterator.hasNext()) {
                    cell = cellIterator.next();

                    switch (cell.getCellType()) {

                        case Cell.CELL_TYPE_STRING: {
                            if (i == 0) {
                                fact.setFactId(cell.getStringCellValue());
                            }
                            if (i == 1) {
                                fact.setFacultyName(cell.getStringCellValue());
                            }
                            if (i == 2) {
                                fact.setFacultyEmail(cell.getStringCellValue());
                            }
                            if (i == 3) {
                                fact.setFacultyAddress(cell.getStringCellValue());
                            }
                            if (i == 4) {
                                fact.setFacultyDept(cell.getStringCellValue());
                            }
                        }

                        break;
                    }
                    i++;
                }
                i = 0;
                System.out.println("Object from excel : " + fact);
                callSaveFaculty();
                System.out.println("Our Obeject");

            }
            System.out.println("");
        } catch (Exception ex) {
            ex.printStackTrace();

        }
        System.out.println("We end");
        return SUCCESS;

    }

    @Override
    public void prepare() throws Exception {
        fact = new Faculty();
        factDao = new FacultyDao();
    }

    @Override
    public Faculty getModel() {
        return fact;
    }

    public void sendMail(Faculty faculty) {
        mail = new MyMail();
        mail.setReceiverEmailId(faculty.getFacultyEmail());
        mail.setSubject("Password");
        mail.setContent("Your password : " + faculty.getFacultyPass());
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

    public String callSaveFaculty() {
        Random ra = new Random();
        char a1, a2;
        a1 = gen.charAt(ra.nextInt(7));
        a2 = gen.charAt(ra.nextInt(7));
        System.out.println("");
        int a = ra.nextInt(20000);
        String pass = a1 + a2 + a + "";

        fact.setFacultyPass(pass);
        System.out.println("faculty object in action : " + fact);
        String result = factDao.facultydatainput(fact);
        sendMail(fact);
        if (result.equals("succes")) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public String callUpdataSingleFaculty() {
        System.out.println("We are in single Student Get : " + fact);
        fact = factDao.getSingleFaculty(fact);
        if (fact == null) {
            return "error";
        } else {
            return "success";
        }
    }

    public String callUpdataFaculty() {
        System.out.println("Update To made : " + fact);
        String flag = factDao.updateSingleFact(fact);
        return flag;
    }

    public String callAllGetFaculty() {
        list = factDao.getAllFaculty();
        System.out.println("List in facultyaction: " + list);
        if (list != null) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public String callBWGetFaculty() {
        list = factDao.getBWFaculty(fact.getFacultyDept());
        if (list != null) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

}
