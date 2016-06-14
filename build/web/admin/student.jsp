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

        <title>Student</title>

        <c:set var="resources" value="${pageContext.servletContext.contextPath}/resources" />
        <c:set var="context" value="${pageContext.servletContext.contextPath}" />


        <!-- Bootstrap Core CSS -->
        <link href="${resources}/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="${resources}/css/sb-admin.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="${resources}/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="${context}/template/plugins/bootstrap-combobox-master/css/bootstrap-combobox.css" rel="stylesheet" type="text/css"/>

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
                                Student
                            </h1>
                            <ol class="breadcrumb">
                                <li>
                                    <i class="fa fa-dashboard"></i>  <a href="${context}/admin/index.jsp">Dashboard</a>
                                </li>
                                <li class="active">
                                    <i class="fa fa-table"></i> Student
                                </li>
                            </ol>
                        </div>
                    </div>
                    <!-- /.row -->

                    <div class="row">
                        <h2>Search Student</h2>
                        <form action="${context}/StudentController" method="POST">
                            <div>
                                <div>
                                    <label for="inputStudentId">Student ID</label>
                                    <input maxlength="6" type="number" class="form-control" placeholder="Enter Student ID..." name="id" id="inputStudentId" min="1" max="1000000">
                                    <br>
                                </div>
                                <div>
                                    <label for="inputStudentName">Student name</label>
                                    <input maxlength="50" type="text" class="form-control" placeholder="Enter Student name..." name="name" id="inputStudentName">
                                    <br>
                                </div>
                                <div>
                                    <label for="inputBatchName">Batch</label>
                                    <select maxlength="50" type="text" class="form-control combobox" placeholder="Enter Batch name..." name="batch" id="inputBatchtName" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false">
                                        <option value="" selected="selected">Chose a batch</option>
                                        <c:forEach var="batchx" items="${requestScope.lstb}">
                                            <option value="${batchx.batchId}" ${sessionScope.stuFinder.batch.batchId eq batchx.batchId ? "selected" : ""}>${batchx.batchName}</option>
                                        </c:forEach>

                                    </select>
                                    <br>
                                </div>
                                <button class="btn btn-success" type="submit" name="action" id="search" value="Student">Search Student</button>
                                <a href="StudentController?action=ClearFinder" class="btn btn-default">Clear search</a>
                                <button type="button" class="btn btn-primary" id="create" data-toggle="modal" data-target="#createStudent" target="create">Create new Student</button>
                            </div>
                        </form>
                        <div>
                            <h2>Student List</h2>
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover table-striped">

                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Password</th>
                                            <th>Batch</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="student" items="${requestScope.lst}">
                                            <tr id="${student.studentId}">
                                                <td>${student.studentId}</td>
                                                <td>${student.studentName}</td>
                                                <td>${student.password}</td>
                                                <td>${student.batch.batchName}</td>
                                                <td><button class="btn btn-primary btn-sm" student_id="${student.studentId}" data-toggle="modal" target="edit" data-target="#editStudent">Edit</button>
                                                    <button class="btn btn-danger btn-sm" student_id="${student.studentId}" data-toggle="modal" target="delete" data-target="#deleteStudent">Delete</button></td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                            <div class="btn-group">
                                <c:if test="${requestScope.page>1}">
                                    <a type="button" href="${context}/StudentController?action=Student&page=${requestScope.page-1}" class="btn btn-default">Previous</a>
                                </c:if>

                                <c:forEach var="i" begin="1" end="${requestScope.noOfPages}">
                                    <c:choose>
                                        <c:when test="${i eq requestScope.page}">
                                            <a href="${context}/StudentController?action=Student&page=${i}" type="button" class="btn btn-primary disabled">${i}</a>
                                        </c:when>
                                        <c:when test="${i ne requestScope.page}">
                                            <a href="${context}/StudentController?action=Student&page=${i}" type="button" class="btn btn-default">${i}</a>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>

                                <c:if test="${requestScope.page<requestScope.noOfPages}">
                                    <a type="button" href="${context}/StudentController?action=Student&page=${requestScope.page+1}" class="btn btn-default">Next</a>
                                </c:if>
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
        <script src="${resources}/js/bootstrap-notify.min.js" type="text/javascript"></script>

        <script src="${resources}/js/myutil.js" type="text/javascript"></script>
        <script src="${resources}/js/validate.js" type="text/javascript"></script>
        <script src="${context}/template/plugins/bootstrap-combobox-master/js/bootstrap-combobox.js" type="text/javascript"></script>
        <!-- Morris Charts JavaScript -->
        <script type="text/javascript">
            $(document).ready(function () {
                $('.combobox').combobox();
            });
            $(document).ready(function () {
                $(document).on('focus', ':input', function () {
                    $(this).attr('autocomplete', 'off');
                });
            });
        </script>
        <script>
            $(document).on('click', '#createStu', function (e) {
                e.preventDefault();
                if (checkcreateStudent() === true) {
                    var obj = {
                        action: 'createstudent',
                        studentname: $('#studentName').val().trim(),
                        studentpass: $('#studentPass').val().trim(),
                        batch: $('#cbatch').val().trim()
                    };
                    $.ajax({
                        url: "${context}/StudentAjaxController",
                        type: 'POST',
                        data: obj,
                        datatype: 'json',
                        success: function (data) {
                            if (data.status === 0) {
                                showMessage("Success!", data.message, "info");

                                if ($('#createStudent').length) {
                                    $('#createStudent').modal('hide');
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

                    var studentid = $(this).attr('student_id');
                    if (studentid) {
                        var dataTarget = $(this).attr('data-target');
                        var target = $(this).attr('target');
                        var obj = {
                            id: studentid,
                            target: target
                        };
                        $.ajax({
                            url: '${context}/StudentAjaxController',
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
                            url: "${context}/StudentAjaxController",
                            type: 'POST',
                            data: obj,
                            dataType: 'html',
                            error: function (jqXHR, textStatus, errorThrown) {
                                showMessage("Error", "Ajax error", "danger");
                            },
                            success: function (data) {
                                $('body').prepend(data);
                                $('#createStudent').modal('show');
                            }
                        });
                    }
                });
            });

            $(document).on('click', '#saveStu', function (e) {
                e.preventDefault();
                if (checkeditStudent()) {
                    var obj = {
                        action: 'savestudent',
                        studentId: $('#estudentId').val().trim(),
                        studentName: $('#estudentName').val().trim(),
                        password: $('#estudentPass').val().trim(),
                        batch: $('#ebatch').val().trim()
                    };
                    $.ajax({
                        url: "${context}/StudentAjaxController",
                        type: 'POST',
                        data: obj,
                        datatype: 'json',
                        success: function (data) {
                            if (data.status === 0) {
                                showMessage("Success!", data.message, "info");
                                if ($('#editStudent').length) {
                                    $('#editStudent').modal('hide');
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

            $(document).on('click', '#deleteStu', function (e) {
                e.preventDefault();
                var obj = {
                    action: 'deletestudent',
                    studentId: $('#did').val().trim()
                };
                $.ajax({
                    url: "${context}/StudentAjaxController",
                    type: 'POST',
                    data: obj,
                    datatype: 'json',
                    success: function (data) {
                        if (data.status === 0) {
                            showMessage("Success!", data.message, "info");
                            if ($('#deleteStudent').length) {
                                $('#deleteStudent').modal('hide');
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
