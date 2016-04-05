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
import dao.ResultDao;
import dao.StdFineDao;
import dao.StudentDetailsdao;
import dao.SubjectDao;
import dto.StdMarks;
import dto.Stdfine;
import dto.StudentDetails;
import dto.Studentexdetails;
import dto.Subject;
import dto.SubjectId;
import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Kushal
 */
public class ResultAction extends ActionSupport implements Preparable, ModelDriven<StdMarks>, SessionAware {

    StdMarks stdR;
    ResultDao rdao;
    private String bran;
    private String sem;
    private File myExcelSheet;
    private String myExcelSheetFileName;
    private String myExcelSheetContextType;
    Studentexdetails stdEx;
    StudentDetailsdao stdDao;
    List<String> list;
    Subject subject;
    SubjectDao subDao;
    SubjectId subId;
    StudentDetails stdDetails;
    Map<String, Object> map;
    
    
    public ResultDao getRdao() {
        return rdao;
    }

    public void setRdao(ResultDao rdao) {
        this.rdao = rdao;
    }

    public String getBra() {
        return bran;
    }

    public void setBra(String bran) {
        this.bran = bran;
    }

    public StdMarks getStdR() {
        return stdR;
    }

    public void setStdR(StdMarks stdR) {
        this.stdR = stdR;
    }

    public String getBran() {
        return bran;
    }

    public void setBran(String bran) {
        this.bran = bran;
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

    public String getSem() {
        return sem;
    }

    public void setSem(String sem) {
        this.sem = sem;
    }

    @Override
    public void prepare() throws Exception {
        stdR = new StdMarks();
        rdao = new ResultDao();
        stdEx = new Studentexdetails();
        stdDao = new StudentDetailsdao();
        subject = new Subject();
        subDao = new SubjectDao();
        subId = new SubjectId();
        stdDetails = new StudentDetails();
    }

    @Override
    public StdMarks getModel() {
        return stdR;
    }

    public String callReadExecl() {
        System.out.println("we are here");
        String flag = "success";
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
                System.out.println("iterator Strated");
                // For each row, iterate through each columns
                Iterator<Cell> cellIterator = row.cellIterator();
                int pra[] = new int[4];
                int sub[] = new int[5];
                int j = 0, k = 0,total=0;
                while (cellIterator.hasNext()) {
                    cell = cellIterator.next();

                    switch (cell.getCellType()) {

                        case Cell.CELL_TYPE_NUMERIC:
                            int a = (int) cell.getNumericCellValue();
                            total = total+a;
                            if (j < 5) {
                                sub[j] = a;
                                j++;
                            } else if (k < 4) {
                                pra[k] = a;
                                k++;
                            }
                            if (i == 2) {
                                stdR.setSemester(a);
                            } else if (i == 3) {
                                stdR.setSub1(a);
                            } else if (i == 4) {
                                stdR.setSub2(a);
                            } else if (i == 5) {
                                stdR.setSub3(a);
                            } else if (i == 6) {
                                stdR.setSub4(a);
                            } else if (i == 7) {
                                stdR.setSub5(a);
                            } else if (i == 8) {
                                stdR.setPra1(a);
                            } else if (i == 9) {
                                stdR.setPra2(a);
                            } else if (i == 10) {
                                stdR.setPra3(a);
                            } else if (i == 11) {
                                stdR.setPra4(a);
                            } else if (i == 12) {
                                stdR.setTotal(a);
                            } else if (i == 13) {
                                stdR.setPercentage((long) cell.getNumericCellValue());
                            }
                            break;

                        case Cell.CELL_TYPE_STRING: {
                            if (i == 0) {
                                stdR.setStdRoll(cell.getStringCellValue());
                            } else if (i == 1) {
                                stdR.setBranch(cell.getStringCellValue());
                            }
                        }

                        break;
                    }
                    i++;
                }
                i = 0;
                stdR.setTotal(total);
                System.out.println("Total");
                System.out.println("Student marks : " + stdR);
                subId.setSemid(stdR.getSemester());
                subId.setBranch(stdR.getBranch());
                subject = subDao.getAllSubject(subId);
                stdEx.setStdRollEx(stdR.getStdRoll());
                getStudentExSubject(stdEx);
                if (stdR.getPra1() < 13) {
                    list.add(subject.getPra1() + "_");
                }
                if (stdR.getPra2() < 13) {
                    list.add(subject.getPra2() + "_");
                }
                if (stdR.getPra3() < 13) {
                    list.add(subject.getPra3() + "_");
                }
                if (stdR.getPra4() < 13) {
                    list.add(subject.getPra4() + "_");
                }
                if (stdR.getSub1() < 25) {
                    list.add(subject.getSub1() + "_");
                }
                if (stdR.getSub2() < 25) {
                    list.add(subject.getSub2() + "_");
                }
                if (stdR.getSub3() < 25) {
                    list.add(subject.getSub3() + "_");
                }
                if (stdR.getSub4() < 25) {
                    list.add(subject.getSub4() + "_");
                }
                if (stdR.getSub5() < 25) {
                    list.add(subject.getSub5() + "_");
                }
                String subj = "";
                for (int ii = 0; ii < list.size(); ii++) {
                    subj += list.get(ii);
                }

                System.out.println("Subject Ka object : " + subject);
                System.err.println("Student Object : " + stdDetails);
                System.err.println("Student Marks Object : " + stdR);
                System.err.println("Student Ex : " + stdEx);
                stdEx.setStudentExDetailscol(subj);
                stdDetails.setStdRollnumber(stdR.getStdRoll());
                stdDetails = stdDao.getSingleSudentData(stdDetails);
                stdDetails.setStdMarks(stdR);
                stdDetails.setStudentexdetails(stdEx);
                stdR.setStudentDetails(stdDetails);
                stdEx.setStudentDetails(stdDetails);
                //flag = stdDao.updateStudent(stdDetails);
                System.out.println("Subject Ka object : " + subject);
                System.err.println("Student Object : " + stdDetails);
                System.err.println("Student Marks Object : " + stdR);
                System.err.println("Student Ex : " + stdEx);
                callsaveMarks();
                System.out.println("iteration ended");

            }
            System.out.println("");
        } catch (Exception ex) {
            ex.printStackTrace();

        }
        System.out.println("We end");
        return flag;
    }

    public void getStudentExSubject(Studentexdetails std) {
        list = stdDao.getStudentExSubject(std);
        if (list == null) {
            entry = true;
            list = new ArrayList<String>();
        }
    }

    private void callsaveMarks() {
        String res = rdao.saveResultForStudent(stdR);
        if (entry) {
            String flag = stdDao.updateStudentEx(stdEx);
        } else {
            String flag = stdDao.saveSingleStudentEx(stdEx);
        }

    }
    boolean entry = false;

    public String callDeleteResult() {
        String ans = rdao.deleteResult(stdR);
        if (ans.equals("success")) {
            map.put("remsg", "Record Deleted Successfully");
        } else {
            map.put("remsg", "There is some error");
        }
        return ans;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.map = map;
    }


}
