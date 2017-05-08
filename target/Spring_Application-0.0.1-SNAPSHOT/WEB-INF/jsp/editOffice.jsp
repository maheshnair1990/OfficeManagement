<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 


<html>
    <head>
        <title>Spring MVC Appication</title>

    </head>
    <body>
        <form:form  method = "POST" action = "/Spring_Application/editsave">

            <table style="font-family: verdana;">
                <tr>


                    <td>City</td> 
                    <td> <form:input type="text" path="city" /></td>
                </tr>
                <tr> 
                    <td>Addr1</td> 
                    <td> <form:input type="text" path="addr1"  /></td>
                    <td>Addr2</td> 
                    <td> <form:input type="text" path="addr2"  /></td>
                </tr>
                <tr>
                    <td>Postal</td> 
                    <td> <form:input type="text" path="postal"  /></td>
                    <td>State</td> 
                    <td>

                        <form:select path="state" >
                            <form:option value="Maharastra">Maharastra</form:option>
                            <form:option value="kerala">kerala</form:option>
                            <form:option value="goa">goa</form:option>
                        </form:select> 
                    </td>

                </tr>
                <tr>
                    <td>Country</td> 
                    <td> <form:input type="text" path="country"  /></td>
                    <td>Territory</td> 
                    <td>
                        <form:input type="text" path="territory"  /></td>
                    <td>  <form:hidden path="code"  /></td>
                </tr>
                <tr>
                    <td>
                        <input type = "submit" value = "Submit"/>        
                    </td>
                   
                </tr>
            </table>
        </form:form>            
    </body>
</html>