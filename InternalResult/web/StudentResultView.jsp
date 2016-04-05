<html>
    <head>
        <title>Result</title>
        <script language="javascript">
            function  validate() {
                var fra = document.getElementById("fr");
                fra.style.display = "block";
                var rol = document.getElementById("rolno").value;

                if (rol == "") {
                    alert("Please Insert roll number !!!!");
                    return false;
                }

                return true;

            }

        </script>
        <link href="imcss.css" rel="stylesheet" type="text/css">

    </head>
    <body id="body">
        <form action="checkFine" method="post" target="fr">
            <table id="log2" border="0" cellpadding="1">
                <thead>            
                    <tr>
                        <th colspan="12" id="thb" style="font-weight: bolder; font-size: 2.0em">
                            RESULT
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Roll No:</td>
                        <td><input type="text" id="rolno" name="stdRoll"></td>
                        <td>Semester:</td>
                        <td>
                            <select name="semester">
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
                            <button type="submit"  onclick="validate()" name="gen_result" >VIEW RESULT</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>