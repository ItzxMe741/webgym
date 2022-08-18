<%-- 
    Document   : BMICalculator
    Created on : Aug 16, 2022, 9:49:39 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="BMICalculatorServlet">
            <center>
                <table>
                    <tr>
                        <th colspan="2">BMI Calculator</th>
                    </tr>
                    <p class="text-danger">${h_error}</p>  
                    <tr>                      
                    <td>Height</td>
                        <td><input type="number" name="height" value="<%= request.getAttribute("height")!=null ? request.getAttribute("height") : "" %>"/> (Meters)</td>
                    </tr>
                    <p class="text-danger">${w_error}</p> 
                     <tr>
                        <td>Weight</td>
                        <td><input type="number" name="weight" value="<%= request.getAttribute("weight")!=null ? request.getAttribute("weight") : "" %>"/> (Kilograms)</td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="Calculator"/></td>
                        <td><input type="reset" name="Clear"/></td>
                    </tr>
                    <tr>
                        <td>Result</td>
                        <td><%= request.getAttribute("result")!=null ? request.getAttribute("result") : ""%></td>
                    </tr>
                </table>
            </center>

        </form>
    </body>
</html>
