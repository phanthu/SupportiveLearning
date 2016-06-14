/* global data */

<%-- 
    Document   : admin
    Created on : Apr 7, 2016, 7:19:22 PM
    Author     : Miku
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.apt.entity.Admin"%>
<%@page import="java.util.List"%>
<%@page import="com.apt.facade.AdminFacade"%>
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

        <title>Admin</title>

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
                                Admin
                            </h1>
                            <ol class="breadcrumb">
                                <li>
                                    <i class="fa fa-dashboard"></i>  <a href="${context}/admin/index.jsp">Dashboard</a>
                                </li>
                                <li class="active">
                                    <i class="fa fa-table"></i> Admin
                                </li>
                            </ol>
                        </div>
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <h2>Search Admin</h2>
                        <form action="${context}/AdminController" method="POST">
                            <div>
                                <div>
                                    <label for="inputAdminId">Admin ID</label>
                                    <input maxlength="10" type="number" class="form-control" placeholder="Enter Admin ID..." name="adminid" id="inputAdminId" min="1" max="1000000">
                                    <br>
                                </div>
                                <div>
                                    <label for="inputAdminName">Admin name</label>
                                    <input maxlength="50" type="text" class="form-control" placeholder="Enter Admin name..." name="adminname" id="inputAdminName">
                                    <br>
                                </div>
                                <div>
                                    <label for="adminstatus">Status</label>
                                    <select class="form-control" id="adminstatus" name="status">
                                        <option value="0" selected>Bolt</option>
                                        <option value="1">Active</option>
                                        <option value="2">Disable</option>
                                    </select>
                                </div>
                                <br>
                                <button class="btn btn-success" type="submit" name="action" id="search" value="search">Search</button>
                                <a href="AdminController?action=tableadmin" class="btn btn-default">Clear search</a>
                                <button type="button" name="action" class="btn btn-primary" id="create" data-toggle="modal" target="create" data-target="#createModal">Create new admin</button>
                            </div>
                        </form>
                        <h2>List Admin</h2>


                        <% if (request.getSession().getAttribute("finder") == null) { %>
                        <div class="table-responsive ">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>iD</th>
                                        <th>Admin Name</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="admin" items="${requestScope.lst}">
                                        <tr id="${admin.adminId}">
                                            <td>${admin.adminId}</td>
                                            <td>${admin.adminName}</td>
                                            <td>${admin.status eq 1 ? "<font color='green'>active":"<font color='red'>disable"}</td>
                                            <td><button class="btn btn-primary btn-sm" admin_id="${admin.adminId}" data-toggle="modal" target="edit" data-target="#editModal">Edit</button>
                                                <button class="btn btn-danger btn-sm" admin_id="${admin.adminId}" data-toggle="modal" target="delete" data-target="#deleteModal">Delete</button></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>                               
                        </div>
                        <div class="btn-group">
                            <c:if test="${requestScope.page>1}">
                                <a type="button" href="${context}/AdminController?action=tableadmin&page=${requestScope.page-1}" class="btn btn-default">Previous</a>
                            </c:if>

                            <c:forEach var="i" begin="1" end="${requestScope.noOfPages}">
                                <c:choose>
                                    <c:when test="${i eq requestScope.page}">
                                        <a href="${context}/AdminController?action=tableadmin&page=${i}" type="button" class="btn btn-primary disabled">${i}</a>
                                    </c:when>
                                    <c:when test="${i ne requestScope.page}">
                                        <a href="${context}/AdminController?action=tableadmin&page=${i}" type="button" class="btn btn-default">${i}</a>
                                    </c:when>
                                </c:choose>
                            </c:forEach>

                            <c:if test="${requestScope.page<requestScope.noOfPages}">
                                <a type="button" href="${context}/AdminController?action=tableadmin&page=${requestScope.page+1}" class="btn btn-default">Next</a>
                            </c:if>
                        </div>
                        <%  } else { %>
                        <div class="table-responsive ">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>iD</th>
                                        <th>Admin Name</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="admin" items="${requestScope.lst}">
                                        <tr>
                                            <td>${admin.adminId}</td>
                                            <td>${admin.adminName}</td>
                                            <td>${admin.status eq 1 ? "<font color='green'>active":"<font color='red'>disable"}</td>
                                            <td><button class="btn btn-primary btn-sm" admin_id="${admin.adminId}" data-toggle="modal" target="edit" data-target="#editModal">Edit</button>
                                                <button class="btn btn-danger btn-sm" admin_id="${admin.adminId}" data-toggle="modal" target="delete" data-target="#deleteModal">Delete</button></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>                               
                        </div>
                        <div class="btn-group">
                            <c:if test="${requestScope.page>1}">
                                <a type="button" href="${context}/AdminController?action=search&page=${requestScope.page-1}" class="btn btn-default">Previous</a>
                            </c:if>

                            <c:forEach var="i" begin="1" end="${requestScope.noOfPages}">
                                <c:choose>
                                    <c:when test="${i eq requestScope.page}">
                                        <a href="${context}/AdminController?action=search&page=${i}" type="button" class="btn btn-primary disabled">${i}</a>
                                    </c:when>
                                    <c:when test="${i ne requestScope.page}">
                                        <a href="${context}/AdminController?action=search&page=${i}" type="button" class="btn btn-default">${i}</a>
                                    </c:when>
                                </c:choose>
                            </c:forEach>

                            <c:if test="${requestScope.page<requestScope.noOfPages}">
                                <a type="button" href="${context}/AdminController?action=search&page=${requestScope.page+1}" class="btn btn-default">Next</a>
                            </c:if>
                        </div>
                        <% }%>

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
        <script src="${resources}/js/bootstrap-notify.min.js" type="text/javascript"></script>
        <script src="${resources}/js/myutil.js" type="text/javascript"></script>
        <script src="${resources}/js/validate.js" type="text/javascript"></script>

        <script>
            $(document).on('click', '#createAdmin', function (e) {
                e.preventDefault();
                if (checkCreateAdmin() === true) {
                    var obj = {
                        action: 'createadmin',
                        adminName: $('#adminName').val().trim(),
                        password: $('#password').val().trim(),
                        status: $('#status').val().trim()
                    };
                    $.ajax({
                        url: "${context}/AdminAjaxController",
                        type: 'POST',
                        data: obj,
                        datatype: 'json',
                        success: function (data) {
                            if (data.status === 0) {
                                showMessage("Success!", data.message, "info");
                                if ($('#createModal').length) {
                                    $('#createModal').modal('hide');
                                }
                            }
                            if (data.status === 1) {
                                showMessage("Error!", data.message, "warning");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            showMessage("Message", "An error occurred", "danger");
                        }
                    });
                }
            });

            $(document).ready(function () {
                $('[data-toggle="modal"]').click(function (e) {
                    e.preventDefault();
                    e.stopPropagation();

                    var adminid = $(this).attr('admin_id');
                    if (adminid) {
                        var dataTarget = $(this).attr('data-target');
                        var target = $(this).attr('target');
                        var obj = {
                            id: adminid,
                            target: target
                        };
                        $.ajax({
                            url: '${context}/AdminAjaxController',
                            type: 'POST',
                            data: obj,
                            dataType: 'html',
                            error: function (xhr, status, error) {
                                console.log('Error from ajax');
                                console.log(status);
                                console.log(xhr.responseText);
                            },
                            success: function (data) {
                                if ($('#modal').length) {
                                    $('#modal').remove();
                                }
                                if ($('#myConfirm').length) {
                                    $('#myConfirm').remove();
                                }
                                $('body').prepend(data);
                                var modal = $(dataTarget);
                                modal.modal('show');
                            }
                        });
                    } else {
                        var target = $(this).attr('target');
                        var obj = {
                            id: -1,
                            target: target
                        };
                        $.ajax({
                            url: "${context}/AdminAjaxController",
                            type: 'POST',
                            data: obj,
                            dataType: 'html',
                            error: function (jqXHR, textStatus, errorThrown) {
                                showMessage("Error", "Ajax error", "danger");
                            },
                            success: function (data) {
                                $('body').prepend(data);
                                $('#createModal').modal('show');
                            }
                        });
                    }
                });
            });

            $(document).on('click', '#saveAdmin', function (e) {
                e.preventDefault();
                if (checkSaveAdmin()) {
                    var obj = {
                        action: 'saveadmin',
                        adminId: $('#eadminID').val().trim(),
                        adminName: $('#eadminName').val().trim(),
                        password: $('#epassword').val().trim(),
                        status: $('#estatus').val().trim()
                    };
                    $.ajax({
                        url: "${context}/AdminAjaxController",
                        type: 'POST',
                        data: obj,
                        datatype: 'json',
                        success: function (data) {
                            if (data.status === 0) {
                                showMessage("Success!", data.message, "info");
                                if ($('#editModal').length) {
                                    $('#editModal').modal('hide');
                                }
                            }
                            if (data.status === 1) {
                                showMessage("Error!", data.message, "warning");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            showMessage("Message", "An error occurred", "danger");
                        }
                    });
                }
            });

            $(document).on('click', '#deleteAdmin', function (e) {
                e.preventDefault();
                var obj = {
                    action: 'deleteadmin',
                    adminId: $('#did').val().trim()
                };
                $.ajax({
                    url: "${context}/AdminAjaxController",
                    type: 'POST',
                    data: obj,
                    datatype: 'json',
                    success: function (data) {
                        if (data.status === 0) {
                            showMessage("Success!", data.message, "info");
                            if ($('#deleteModal').length) {
                                $('#deleteModal').modal('hide');
                            }
                        }
                        if (data.status === 1) {
                            showMessage("Error!", data.message, "warning");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        showMessage("Message", "An error occurred", "danger");
                    }
                });
            });
        </script>
    </body>
</html>
