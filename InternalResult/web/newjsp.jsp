<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
    <head>
        <link href="imcss.css" rel="stylesheet" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        <br/>
        <table id="log2" border="0" cellpadding="1">
            <thead>
            </thead>
            <tbody>
                <tr>
                    <td>NAME</td>
                    <td><s:property value="std_name"/></td>
                </tr>
                <tr>
                    <td>Roll Number</td>
                    <td><s:property value="std_rollno"/></td>
                </tr>
                <tr>
                    <td>Branch</td>
                    <td><s:property value="std_branch"/></td>
                </tr>
            </tbody>
        </table>
        <br/>
        <table id="log2" border="0" cellpadding="1">
            <thead>
                <tr>
                    <th>Subject</th>
                    <th>Obtained marks</th>
                    <th>Total marks</th>
                </tr>
            </thead>
            <tbody>
                <s:iterator value="result_list">
                    <tr>
                        <td><s:property value="sub_name"/></td>
                        <td><s:property value="marks"/></td>
                        <td><s:property value="total"/></td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>

    </body>
</html>
