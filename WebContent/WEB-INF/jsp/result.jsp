<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 


<html>
    <head>
        <title>Spring MVC Appication</title>
        <script type="text/javascript">
            function resetForm() {
                document.getElementById("officeForm").reset();
            }
        </script>
    </head>
    <body>
        <form:form id="officeForm" modelAttribute="office" method = "POST" action = "create">

            <table style="font-family: verdana;">
                <tr>
                    <td>Code</td> 
                    <td> <form:input type="text" path="code"  /></td>
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
                </tr>
                <tr>
                    <td>
                        <input type = "submit" value = "Submit"/>        
                    </td>
                    <td>
                        <input type="button" value="Clear" onclick="resetForm();"/>
                    </td>
                </tr>
            </table>
        </form:form>       
        <br/> <br/>
        <form action="search" method="post">  
            <input type="text" name="code"/>
            <input type="submit" value="Search"/>
        </form>
        <br/> <br/>

        <c:if test="${!empty list}">
            <table border="2" width="70%" cellpadding="2">  
                <tr><th>CODE</th><th>CITY</th><th>POSTAL</th><th>Actions</th></tr>  
                        <c:forEach var="off" items="${list}">   
                    <tr>  
                        <td>${off.code}</td>  
                        <td>${off.city}</td>  
                        <td>${off.postal}</td>   
                        <td><a href="<c:url value="/editoff/${off.code}" />">Edit</a>  ||   <a href=" <c:url value="/deleteoff/${off.code}" />">Delete</a>

                        </td>  
                    </tr>  
                </c:forEach>  
            </table>  
        </c:if>
        <c:if test="${empty list}">
            <table border="2" width="70%" cellpadding="2">  
                <tr><th>CODE</th><th>CITY</th><th>POSTAL</th><th>Actions</th></tr>  

                <tr>  
                    <td>
                        No Records Found for the search
                    </td>  
                </tr>  

            </table>  
        </c:if>




    </body>
</html>