<%-- 
    Document   : tables
    Created on : Apr 7, 2016, 7:19:22 PM
    Author     : Miku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Submit</title>

        <c:set var="resources" value="${pageContext.servletContext.contextPath}/resources" />
        <c:set var="context" value="${pageContext.servletContext.contextPath}" />


        <!-- Bootstrap Core CSS -->
        <link href="${resources}/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="${resources}/css/sb-admin.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="${resources}/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="/https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>
        <jsp:include page="adminchangepassword.jsp" />
        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <!-- Brand and toggle get grouped for better mobile display -->
                <jsp:include page="layout/navbar-header.jsp" />
                <!-- Top Menu Items -->
                <jsp:include page="layout/topmenu-item.jsp" />
                <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
                <jsp:include page="layout/nav-sidebar.jsp" />
                <!-- /.navbar-collapse -->
            </nav>

            <div id="page-wrapper">

                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">
                                Submit
                            </h1>
                            <ol class="breadcrumb">
                                <li>
                                    <i class="fa fa-dashboard"></i>  <a href="${context}/admin/index.jsp">Dashboard</a>
                                </li>
                                <li class="active">
                                    <i class="fa fa-table"></i> Submit
                                </li>
                            </ol>
                        </div>
                    </div>
                    <!-- /.row -->

                    <div class="row">
                        <h2>Search Submit</h2>
                        <form action="${context}/AdminController" method="POST">
                            <div>
                                <div>
                                    <label for="inputAdminId">Assignment ID</label>
                                    <input maxlength="10" type="text" class="form-control" placeholder="Enter Admin ID..." name="adminid" id="inputAdminId" min="1" max="1000000">
                                    <br>
                                </div>
                                <div>
                                    <label for="inputAdminName">Student ID</label>
                                    <input maxlength="50" type="text" class="form-control" placeholder="Enter Admin name..." name="adminname" id="inputAdminName">
                                </div>
                                <br>
                                <button class="btn btn-success" type="submit" name="action" id="search" value="search">Search</button>
                                <a href="AdminController?action=tableadmin" class="btn btn-default">Clear search</a>
                            </div>
                        </form>
                        <div>
                            <h2>Submit List</h2>
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover table-striped">
                                    <thead>
                                    <th>Student ID</th>
                                    <th>Student Name</th>
                                    <th>URL</th>
                                    <th>Mark</th>
                                    <th>Action</th>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="submit" items="${requestScope.lst}">
                                            <tr id="submit${submit.submitId}">
                                                <td>${submit.student.studentId}</td>
                                                <td>${submit.sutdent.studentName}</td>
                                                <td>${submit.url}</td>
                                                <td>${submit.mark}</td>
                                                <td></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="${resources}/js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="${resources}/js/bootstrap.min.js"></script>

        <!-- Morris Charts JavaScript -->
        <script src="${resources}/js/plugins/morris/raphael.min.js"></script>
        <script src="${resources}/js/plugins/morris/morris.min.js"></script>
        <script src="${resources}/js/plugins/morris/morris-data.js"></script>

    </body>
</html>
