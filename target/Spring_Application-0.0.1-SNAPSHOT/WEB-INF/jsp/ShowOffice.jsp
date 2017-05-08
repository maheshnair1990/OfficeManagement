<%-- 
    Document   : edit
    Created on : May 7, 2017, 3:46:51 PM
    Author     : Mahesh Nair
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>OFFICE LIST</h1>
        <table border="2" width="70%" cellpadding="2">  
            <tr><th>CODE</th><th>CITY</th><th>POSTAL</th><th>Actions</th></tr>  
                    <c:forEach var="off" items="${list}">   
                <tr>  
                    <td>${off.code}</td>  
                    <td>${off.city}</td>  
                    <td>${off.postal}</td>   
                    <td><a href="editoff/${off.code}">Edit</a>  ||   <a href="deleteemp/${off.code}">Delete</a>
                    </td>  
                </tr>  
            </c:forEach>  
        </table>  
    </body>
</html>
