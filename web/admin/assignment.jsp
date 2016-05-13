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

        <title>Assighment</title>

        <c:set var="resources" value="${pageContext.servletContext.contextPath}/resources" />
        <c:set var="context" value="${pageContext.servletContext.contextPath}" />


        <!-- Bootstrap Core CSS -->
        <link href="${resources}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${resources}/css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css"/>
        <link href="${resources}/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
        <link href="${resources}/css/bootstrap-datetimepicker-standalone.css" rel="stylesheet" type="text/css"/>

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
                                Assignment
                            </h1>
                            <ol class="breadcrumb">
                                <li>
                                    <i class="fa fa-dashboard"></i>  <a href="${context}/admin/index.jsp">Dashboard</a>
                                </li>
                                <li class="active">
                                    <i class="fa fa-table"></i> Assignment
                                </li>
                            </ol>
                        </div>
                    </div>
                    <!-- /.row -->

                    <div class="row">
                        <h2>Search Assignment</h2>
                        <form action="${context}/AssignmentController" method="POST">
                            <div>
                                <div>
                                    <label for="inputBatchId">Batch ID</label>
                                    <input maxlength="10" type="number" class="form-control" placeholder="Enter Batch ID..." name="batchid" id="inputBatchId" min="1" max="1000000">
                                    <br>
                                </div>
                                <div>
                                    <label for="inputSubjectId">Subject ID</label>
                                    <input maxlength="10" type="number" class="form-control" placeholder="Enter Subject ID..." name="subjectid" id="inputSubjectId" min="1" max="1000000">
                                    <br>
                                </div>
                                <div>
                                    <label for="inputAssignmentId">Assignment ID</label>
                                    <input maxlength="10" type="number" class="form-control" placeholder="Enter Assignment ID..." name="assignmentid" id="inputAssignmentId" min="1" max="1000000">
                                    <br>
                                </div>
                                <div>
                                    <label for="inputAssignmentName">Assignment name</label>
                                    <input maxlength="50" type="text" class="form-control" placeholder="Enter Assignment name..." name="assignmentname" id="inputAssignmentName">
                                    <br>
                                </div>
                                <div>
                                    <div class="form-group">
                                        <label for="datetimepicker1">From</label>
                                        <div class='input-group date' id='datetimepicker1'>
                                            <input type='text' class="form-control" />
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <script type="text/javascript">
                                    $(function () {
                                        $('#datetimepicker1').datetimepicker();
                                    });</script>

                                <div>
                                    <div class="form-group date">
                                        <label for="datetimepicker1">To</label>
                                        <div class='input-group date' id='datetimepicker2'>
                                            <input type='text' class="form-control" />
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <script type="text/javascript">
                                    $(function () {
                                        $('#datetimepicker2').datetimepicker();
                                    });</script>
                                <div>
                                    <label for="assignmentstatus">Status</label>
                                    <select class="form-control" id="assignmentstatus">
                                        <option value="0" selected>Bolt</option>
                                        <option value="1">Active</option>
                                        <option value="2">Disable</option>
                                    </select>
                                </div>
                                <br>
                                <button class="btn btn-success" type="submit" name="action" id="search" value="search">Search</button>
                                <a href="AssignmentController?action=tableassignment" class="btn btn-default">Clear search</a>
                                <button type="button" name="action" class="btn btn-primary" id="create" data-toggle="modal" data-target="#createModal">Create new assignment</button>
                            </div>
                        </form>
                        <div>
                            <h2>Assignment List</h2>
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover table-striped">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Subject</th>
                                            <th>Batch</th>
                                            <th>Start</th>
                                            <th>End</th>
                                            <th>Url</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="assignment" items="${requestScope.lst}">
                                            <tr id="${assignment.assignmentId}">
                                                <td>${assignment.assignmentId}</td>
                                                <td>${assignment.assignmentName}</td>
                                                <td>${assignment.subject.subjectName}</td>
                                                <td>${assignment.batch.batchName}</td>
                                                <td>${assignment.startTime}</td>
                                                <td>${assignment.endTime}</td>
                                                <td>${assignment.url}</td>
                                                <td>${assignment.status}</td>
                                                <td>
                                                    <button class="btn btn-primary btn-sm" assignment_id="${assignment.assignmentId}" data-toggle="modal" target="edit" data-target="#editAssignment">Edit</button>
                                                    <button class="btn btn-danger btn-sm" assignment_id="${assignment.assignmentId}" data-toggle="modal" target="delete" data-target="#deleteAssignment">Delete</button>
                                                </td>
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
        <script src="${resources}/js/bootstrap-datepicker.js" type="text/javascript"></script>
        <script src="${resources}/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
        <script src="${resources}/js/bootstrap-datetimepicker.js" type="text/javascript"></script>
        <script src="${resources}/js/bootstrap-notify.min.js" type="text/javascript"></script>

        <script src="${resources}/js/myutil.js" type="text/javascript"></script>
        <script src="${resources}/js/validate.js" type="text/javascript"></script>
        <script>
                                    $(document).on('click', '#createAssignment', function (e) {
                                        e.preventDefault();
                                        if (checkCreateAssignment() === true) {
                                            var obj = {
                                                action: 'createassgnment',
                                                assignmentName: $('#assignmentName').val().trim(),
                                                password: $('#password').val().trim(),
                                                status: $('#status').val().trim()
                                            };
                                            $.ajax({
                                                url: "${context}/AssignmentAjaxController",
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

                                            var assignmentid = $(this).attr('assignment_id');
                                            if (assignmentid) {
                                                var dataTarget = $(this).attr('data-target');
                                                var target = $(this).attr('target');
                                                var obj = {
                                                    id: assignmentid,
                                                    target: target
                                                };
                                                $.ajax({
                                                    url: '${context}/AssignmentAjaxController',
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
                                                    url: "${context}/AssignmentAjaxController",
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

                                    $(document).on('click', '#saveAssignment', function (e) {
                                        e.preventDefault();
                                        if (checkSaveAssignment()) {
                                            var obj = {
                                                action: 'saveassignment',
                                                assignmentId: $('#eassignmentID').val().trim(),
                                                assignmentName: $('#eassignmentName').val().trim(),
                                                password: $('#epassword').val().trim(),
                                                status: $('#estatus').val().trim()
                                            };
                                            $.ajax({
                                                url: "${context}/AssignmentAjaxController",
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

                                    $(document).on('click', '#deleteAssignment', function (e) {
                                        e.preventDefault();
                                        var obj = {
                                            action: 'deleteassignment',
                                            assignmentId: $('#did').val().trim()
                                        };
                                        $.ajax({
                                            url: "${context}/AssignmentAjaxController",
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
