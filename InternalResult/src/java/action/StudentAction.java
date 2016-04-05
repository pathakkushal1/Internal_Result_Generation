/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.StudentDetailsdao;
import dto.StudentDetails;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author Kushal
 */
public class StudentAction extends ActionSupport implements Preparable, ModelDriven<StudentDetails>, ServletRequestAware {

    private StudentDetails stdDetails;
    private File myExcelSheet;
    private String myExcelSheetFileName;
    private String myExcelSheetContextType;
    private HttpServletRequest hsr;
    private StudentDetailsdao sdao;
    private String roll;
    private List<StudentDetails> list;

    public List<StudentDetails> getList() {
        return list;
    }

    public void setList(List<StudentDetails> list) {
        this.list = list;
    }

    public StudentDetails getStdDetails() {
        return stdDetails;
    }

    public void setStdDetails(StudentDetails stdDetails) {
        this.stdDetails = stdDetails;
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

    @Override
    public void prepare() throws Exception {
        stdDetails = new StudentDetails();
        sdao = new StudentDetailsdao();
    }

    @Override
    public StudentDetails getModel() {
        return stdDetails;
    }

    public String callGetStudentExcel() {
        System.out.println("we are here");
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

                        case Cell.CELL_TYPE_NUMERIC:
                            if (i == 5) {
                                stdDetails.setStdSemester((int) cell.getNumericCellValue());
                            } else if (i == 7) {
                                stdDetails.setStdContact((long) cell.getNumericCellValue());
                            }
                            break;

                        case Cell.CELL_TYPE_STRING: {
                            if (i == 0) {
                                stdDetails.setStdRollnumber(cell.getStringCellValue());
                            } else if (i == 1) {
                                stdDetails.setStdName(cell.getStringCellValue());
                            } else if (i == 2) {
                                stdDetails.setStdEmail(cell.getStringCellValue());
                            } else if (i == 3) {
                                stdDetails.setStdBatch(cell.getStringCellValue());
                            } else if (i == 4) {
                                stdDetails.setStdBranch(cell.getStringCellValue());
                            } else if (i == 6) {
                                stdDetails.setStdAddress(cell.getStringCellValue());
                            }
                        }

                        break;
                    }
                    i++;
                }
                i = 0;
                callSaveStudent();
                System.out.println("Our Obeject");
                System.out.println(stdDetails);
            }
            System.out.println("");
        } catch (Exception ex) {
            ex.printStackTrace();

        }
        System.out.println("We end");
        return SUCCESS;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        this.hsr = hsr;
    }

    public String callStudentUpdateDetails() {
        String flag = sdao.updateStudent(stdDetails);
        return flag;
    }

    public String callStudentUpdateGetData() {
        System.out.println("We are in load");
        stdDetails = sdao.getSingleSudentData(stdDetails);
        System.out.println("Object in action :" + stdDetails);
        if (stdDetails == null) {
            return ERROR;
        } else {
            return SUCCESS;
        }
    }

    public String callSaveStudent() {
        System.out.println("In save student"+stdDetails);
        String s = sdao.saveStudent(stdDetails);
        if (!s.equals("")) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public String callGetStudents() {
        list = sdao.getStudents(stdDetails.getStdBranch(), stdDetails.getStdSemester());
        if (list != null) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

}
