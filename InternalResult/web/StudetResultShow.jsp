
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="imcss.css" rel="stylesheet" type="text/css" />
        <title>Result</title>
        <style>
            td{
                text-align:center; 
            }
            input{padding: 5px;
                  size: 15px;
                  border: 0px;
                  text-align:center; 
                  color:blanchedalmond;
            }
        </style>
        <script>
            function valid() {
                window.location = "StudentResultView.jsp";
            }
            function sho() {
                print(); 
                var numberT = [];
                var numberP = [];
                var sub = [];
                for (var i = 0; i < 5; i++) {
                    if (i < 4) {
                        numberP[i] = document.getElementById("p" + (i + 1)).value;
                        sub[i + 5] = document.getElementById("s" + (i + 6)).value;
                    }
                    numberT[i] = document.getElementById("t" + (i + 1)).value;
                    sub[i] = document.getElementById("s" + (i + 1)).value;
                }
                var fail = "";
                
                alert("reach");
                for (var i = 0; i < 5; i++) {
                    if (i < 4) {
                        if (numberP[i] < 13) {
                            fail += sub[i + 5];
                            fail += " ";

                        } 
                    }
                    if (numberT[i] < 25) {
                        fail += sub[i];
                        fail += " ";

                    } 

                }
                 if (fail == "") {
                    fail = "PASS";
                }
                var total = document.getElementById("total").value;
                var per = (total*100)/530;
                prompt(total,total);
                document.getElementById("marks").value = fail;
                document.getElementById("pers").value = per;
                alert("end");
            }
        </script>
    </head>
    <body id="body" onload="sho()">
        <table id="log2" border="0" cellpadding="1">
            <thead>            
                <tr>
                    <th colspan="12" id="thb" style="font-weight: bolder; font-size: 2.0em">
                        VIEW RESULT
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Roll No:</td>
                    <td><input required="required" type="text" value="<s:property value="stdRoll"/>" disabled="true" id="rolno" name="rolno"></td>
                    <td>Semester:</td>
                    <td>
                        <select disabled="true" <s:property value="semester"/>  name="semester">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                        </select>
                    </td>
                    <td>
                        <button type="button" onclick="valid()" name="gen_result" >RESET</button>
                    </td>
                </tr>
            </tbody>
        </table>
        <br/>
        <div>
            <table id="log4" border="0">
                <tbody>
                    <tr>
                        <td id="thb" style="font-weight: bolder; font-size: 1.0em">Name</td>
                        <td><input class="dub" type="text" disabled="true"  id="p2" value="<s:property value="stdDetails.stdName"/>"></td>
                        <td id="thb" style="font-weight: bolder; font-size: 1.0em">Roll NUmber</td>
                        <td><input class="dub" type="text" disabled="true"  id="p2" value="<s:property value="stdDetails.stdRollnumber"/>"></td>
                    </tr>
                    <tr>
                        <td id="thb" style="font-weight: bolder; font-size: 1.0em">Branch</td>
                        <td><input class="dub" type="text" disabled="true"  id="p2" value="<s:property value="stdDetails.stdBranch"/>"></td>
                        <td id="thb" style="font-weight: bolder; font-size: 1.0em">Rank</td>
                        <td>Not supported yet</td>
                    </tr>
                </tbody>
            </table>
            <table id="log4" border="0">
                <tbody>
                    <tr>
                        <td id="thb" style="font-weight: bolder; font-size: 1.0em">Subject Name</td>
                        <td id="thb" style="font-weight: bolder; font-size: 1.0em">Total Marks</td>
                        <td id="thb" style="font-weight: bolder; font-size: 1.0em">Marks Obtained</td>
                    </tr>
                    <tr>
                        <td><input class="dub" type="text" disabled="true"  id="s1" value="<s:property value="sub.sub1"/>"></td>
                        <td>70</td>

                        <td> <input class="dub" type="text" disabled="true" id="t1" value="<s:property  value="stdM.sub1"/>" ></td>
                    </tr>
                    <tr>
                        <td><input class="dub" type="text" disabled="true"  id="s2" value="<s:property value="sub.sub2"/>"></td>
                        <td>70</td>

                        <td> <input class="dub" type="text" disabled="true" id="t2" value="<s:property value="stdM.sub2"/>"></td>
                    </tr>
                    <tr>
                        <td><input class="dub" type="text" disabled="true"  id="s3" value="<s:property value="sub.sub3"/>"></td>
                        <td>70</td>

                        <td> <input class="dub" type="text" disabled="true" id="t3" value="<s:property value="stdM.sub3"/>"></td>
                    </tr>
                    <tr>
                        <td><input class="dub" type="text" disabled="true"  id="s4" value="<s:property value="sub.sub4"/>"></td>
                        <td>70</td>

                        <td> <input class="dub" type="text" disabled="true"  id="t4" value="<s:property value="stdM.sub4"/>"></td>
                    </tr>
                    <tr>
                        <td><input class="dub" type="text" disabled="true"  id="s5" value="<s:property value="sub.sub5"/>"></td>
                        <td>70</td>

                        <td> <input class="dub" type="text" disabled="true" id="t5" value="<s:property value="stdM.sub5"/>"></td>
                    </tr>
                    <tr>
                        <td><input class="dub" type="text" disabled="true"  id="s6" value="<s:property value="sub.pra1"/>"></td>
                        <td>30</td>

                        <td> <input class="dub" type="text" disabled="true" id="p1" value="<s:property value="stdM.pra1"/>"></td>
                    </tr>
                    <tr>
                        <td><input class="dub" type="text" disabled="true"  id="s7" value="<s:property value="sub.pra2"/>"></td>
                        <td>30</td>

                        <td><input class="dub" type="text" disabled="true"  id="p2" value="<s:property value="stdM.pra2"/>"></td>
                    </tr>
                    <tr>
                        <td><input class="dub" type="text" disabled="true"  id="s8" value="<s:property value="sub.pra3"/>"></td>
                        <td>30</td>

                        <td> <input class="dub" type="text" disabled="true" id="p3" value="<s:property value="stdM.pra3"/>"></td>
                    </tr> <tr>
                        <td><input class="dub" type="text" disabled="true"  id="s9" value="<s:property value="sub.pra4"/>"></td>
                        <td>30</td>

                        <td> <input class="dub" type="text" disabled="true"  id="p4" value="<s:property value="stdM.pra4"/>"></td>
                    </tr>
                </tbody>
            </table>
            <br/>
            <table border="0" id="log4">
                <tbody>
                    <tr>
                        <th>Result</th>
                        <th>Percentage</th>
                    </tr>
                    <tr>
                <input  type="hidden" disabled="true"  id="total" value="<s:property value="stdM.total"/>"></td>
                        <td><input type="text" id="marks" value=""></td>
                        <td><input type="text" id="pers" value=""></td>

                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
