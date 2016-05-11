<%-- 
    Document   : index
    Created on : Mar 23, 2016, 7:07:46 PM
    Author     : 50802
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home page</title>
    </head>
    <body>
        <% 
            if(session.getAttribute("studentId")!=null){
                %>
                <jsp:forward page="clien.jsp" />
        <%
            }else{
                %>
                <jsp:forward page="login.jsp" />
    <%
            }
        %>
    </body>
</html>
