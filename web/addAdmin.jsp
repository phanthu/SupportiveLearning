<%-- 
    Document   : addAdmin
    Created on : Mar 23, 2016, 7:08:11 PM
    Author     : 50802
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Admin</title>
    </head>
    <body>
        <form method="POST" action="AdminController">
            Name: <input type="text" name="name"/><br/>
            Password: <input type="text" name="password"/><br/>
            Status: <input type="text" name="status"/><br/>
            <input type="submit" name="action" value="add"/>
        </form>
    </body>
</html>
