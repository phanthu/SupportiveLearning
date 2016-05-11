<%-- 
    Document   : showAdmin
    Created on : Mar 23, 2016, 7:08:19 PM
    Author     : 50802
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Password</th>
                <th>Status</th>
            </tr>
            <c:forEach var="admin" items="${requestScope.lst}">
                <tr>
                    <td>${admin.adminId}</td>
                    <td>${admin.adminName}</td>
                    <td>${admin.password}</td>
                    <td>${admin.status}</td>
                </tr>
            </c:forEach>
        </table>
        <br/>
        <a href="index.jsp">Back to homepage</a>
    </body>
</html>
