<%-- 
    Document   : adminlogin
    Created on : Apr 12, 2016, 4:31:52 PM
    Author     : Miku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>

        <c:set var="resources" value="${pageContext.servletContext.contextPath}/resources" />
        
        <link href="${resources}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${resources}/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="${resources}/css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="wrapper">
            <form class="form-signin" action="${pageContext.servletContext.contextPath}/StudentController" method="POST">       
                <h2 class="form-signin-heading">Student Login</h2>
                <input type="text" class="form-control" name="loginName" placeholder="Student ID" required="" autofocus="" />
                <input type="password" class="form-control" name="loginPassword" placeholder="Password" required=""/>      
                <label class="checkbox">
                    <input type="checkbox" value="remember-me" id="rememberMe" name="rememberMe"> Remember me
                </label>
                <button class="btn btn-lg btn-primary btn-block" type="submit" value="login" name="action">Login</button>
                <p></p>
                 <a href="admin/index.jsp" >admin Login</a>
            </form>
               
        </div>
        <script src="../resources/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>