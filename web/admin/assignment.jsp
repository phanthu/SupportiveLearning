<%-- 
    Document   : tables
    Created on : Apr 7, 2016, 7:19:22 PM
    Author     : Miku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Assignment</title>

    <c:set var="resources" value="${pageContext.servletContext.contextPath}/resources" />
    <c:set var="context" value="${pageContext.servletContext.contextPath}" />



    <!-- Bootstrap Core CSS -->
    <link href="${resources}/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${resources}/css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${resources}/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${context}/template/plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css"/>
    <link href="${context}/template/plugins/bootstrap-combobox-master/css/bootstrap-combobox.css" rel="stylesheet" type="text/css"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="/https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->



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
                        <form action="${context}/AssignmentController?action=Assignment" method="POST" id="assignmentform">
                            <div>
                                <div>
                                    <label for="inputBatchName">Batch</label>
                                    <select maxlength="50" type="text" class="form-control combobox" name="batchid" id="inputBatchtName">
                                        <option value="" selected="selected">Chose a batch</option>
                                        <c:forEach var="batchx" items="${requestScope.lstb}">
                                            <option value="${batchx.batchId}">${batchx.batchName}</option>
                                        </c:forEach>

                                    </select>
                                    <br>
                                </div>
                                <div>
                                    <label for="inputSubjectName">Subject</label>
                                    <select maxlength="50" type="text" class="form-control combobox" name="subjectid" id="inputSubjecttName">
                                        <option value="" selected="selected">Chose a subject</option>
                                        <c:forEach var="sub" items="${requestScope.lsts}">
                                            <option value="${sub.subjectId}">${sub.subjectName}</option>
                                        </c:forEach>

                                    </select>
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
                                        <div class='input-group date' >
                                            <input type='text' class="form-control" id='datetimepicker1' name="start" />
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <script type="text/javascript">
                                    $(function () {
                                        $('#datetimepicker1').daterangepicker({
                                            format: 'DD-MM-YYYY HH:mm:ss',
                                            timePicker: true,
                                            timePickerIncrement: 15,
                                            singleDatePicker: true
                                        });
                                        $('#datetimepicker1').on('apply.daterangepicker', function (ev, picker) {
                                            $('#startdate').val($('#datetimepicker1').data('daterangepicker').startDate.valueOf());
                                        });
                                    });
                                </script>

                                <div>
                                    <div class="form-group date">
                                        <label for="datetimepicker2">To</label>
                                        <div class='input-group date' >
                                            <input type='text' class="form-control" id='datetimepicker2' name="end" />
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" id="startdate" name="startdate" /> 
                                <input type="hidden" id="enddate" name="enddate" />
                                <script type="text/javascript">
                                    $(function () {
                                        $('#datetimepicker2').daterangepicker({
                                            format: 'DD-MM-YYYY HH:mm:ss',
                                            timePicker: true,
                                            timePickerIncrement: 15,
                                            singleDatePicker: true
                                        });
                                        $('#datetimepicker2').on('apply.daterangepicker', function (ev, picker) {
                                            $('#enddate').val($('#datetimepicker2').data('daterangepicker').startDate.valueOf());
                                        });
                                    });
                                </script>
                                <div>
                                    <label for="assignmentstatus">Status</label>
                                    <select class="form-control" id="assignmentstatus" name="status">
                                        <option value="0" selected>Bolt</option>
                                        <option value="1">Active</option>
                                        <option value="2">Disable</option>
                                    </select>
                                </div>
                                <br>
                                <button class="btn btn-success" type="button" name="action" id="search" value="Assignment">Search Assignment</button>
                                <a href="AssignmentController?action=ClearFinder" class="btn btn-default">Clear search</a>
                                <button type="button" name="action" class="btn btn-primary" id="create" data-toggle="modal" data-target="#createAssignment" target="create">Create new assignment</button>
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
                                                <td><fmt:formatDate value="${assignment.startTime}" pattern="dd-MM-yyyy HH:mm:ss" /></td>
                                                <td><fmt:formatDate value="${assignment.endTime}" pattern="dd-MM-yyyy HH:mm:ss" /></td>
                                                <c:if test="${not empty assignment.url}">
                                                    <td><a href="ServletDownload?url=${assignment.url}" class="btn btn-info btn-sm">Download</a></td>
                                                </c:if>
                                                <c:if test="${empty assignment.url}">
                                                    <td></td>
                                                </c:if>
                                                <td>${assignment.status eq 1 ? "<font color='green'>active":"<font color='red'>disable"}</td>
                                                <td style="white-space: nowrap">
                                                    <button class="btn btn-primary btn-sm" assignment_id="${assignment.assignmentId}" data-toggle="modal" target="edit" data-target="#editAssignment">Edit</button>
                                                    <button class="btn btn-danger btn-sm" assignment_id="${assignment.assignmentId}" data-toggle="modal" target="delete" data-target="#deleteAssignment">Delete</button>
                                                    <a href="SubmitController?assignment=${assignment.assignmentId}" class="btn btn-info btn-sm" assignment_id="${assignment.assignmentId}" >View Submit</a>
                                                    <button class="btn btn-success btn-sm" assignment_id="${assignment.assignmentId}" data-toggle="modal" target="upload" data-target="#modalupload">Upload</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="btn-group">
                                <c:if test="${requestScope.page>1}">
                                    <a type="button" href="${context}/AssignmentController?action=Assignment&page=${requestScope.page-1}" class="btn btn-default">Previous</a>
                                </c:if>

                                <c:forEach var="i" begin="1" end="${requestScope.noOfPages}">
                                    <c:choose>
                                        <c:when test="${i eq requestScope.page}">
                                            <a href="${context}/AssignmentController?action=Assignment&page=${i}" type="button" class="btn btn-primary disabled">${i}</a>
                                        </c:when>
                                        <c:when test="${i ne requestScope.page}">
                                            <a href="${context}/AssignmentController?action=Assignment&page=${i}" type="button" class="btn btn-default">${i}</a>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>

                                <c:if test="${requestScope.page<requestScope.noOfPages}">
                                    <a type="button" href="${context}/AssignmentController?action=Assignment&page=${requestScope.page+1}" class="btn btn-default">Next</a>
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
        <script src="${context}/template/plugins/daterangepicker/moment.min.js" type="text/javascript"></script>
        <script src="${context}/template/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
        <script src="${resources}/js/myutil.js" type="text/javascript"></script>
        <script src="${resources}/js/validate.js" type="text/javascript"></script>
        <script src="${context}/template/plugins/bootstrap-combobox-master/js/bootstrap-combobox.js" type="text/javascript"></script>
        <script type="text/javascript">
                                    $(document).ready(function () {
                                        $('.combobox').combobox();
                                    });

        </script>
        <script>
            $(document).on('click', '#search', function () {
                $('#assignmentform').submit();
            });
            $(document).ready(function () {
                $(document).on('focus', ':input', function () {
                    $(this).attr('autocomplete', 'off');
                });
            });
        </script>
        <script>
            $(document).on('click', '#createasm', function (e) {
                e.preventDefault();
                if (checkCreateAssignment() === true) {
                    var obj = {
                        action: 'createasm',
                        assignmentName: $('#cAssignmentname').val().trim(),
                        batch: $('#cbatch').val().trim(),
                        subject: $('#csubject').val().trim(),
                        status: $('#status').val().trim(),
                        startdate: $('#ctime').data('daterangepicker').startDate.valueOf(),
                        enddate: $('#ctime').data('daterangepicker').endDate.valueOf()
                    };
                    $.ajax({
                        url: "${context}/AssignmentAjaxController",
                        type: 'POST',
                        data: obj,
                        datatype: 'json',
                        success: function (data) {
                            if (data.status === 0) {
                                showMessage("Success!", data.message, "info");
                                if ($('#createAssignment').length) {
                                    $('#createAssignment').modal('hide');
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
                                if ($('#editAssignment').length) {
                                    $('#editAssignment').remove();
                                }
                                if ($('#deleteAssignment').length) {
                                    $('#deleteAssignment').remove();
                                }
                                if ($('#modalupload').length) {
                                    $('#modalupload').remove();
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
                                if ($('createAssignment').length) {
                                    $('#createAssignment').remove();
                                }
                                $('body').prepend(data);
                                $('#createAssignment').modal('show');
                            }
                        });
                    }
                });
            });

            $(document).on('click', '#saveAsm', function (e) {
                e.preventDefault();
                if (checkSaveAssignment()) {
                    var obj = {
                        action: 'editasm',
                        batch: $('#ebatch').val().trim(),
                        subject: $('#esubject').val().trim(),
                        assignmentId: $('#eAssignmentid').val().trim(),
                        assignmentName: $('#eAssignmentname').val().trim(),
                        status: $('#estatus').val().trim(),
                        startdate: $('#estart').data('daterangepicker').startDate.valueOf(),
                        enddate: $('#eend').data('daterangepicker').startDate.valueOf()
                    };
                    $.ajax({
                        url: "${context}/AssignmentAjaxController",
                        type: 'POST',
                        data: obj,
                        datatype: 'json',
                        success: function (data) {
                            if (data.status === 0) {
                                showMessage("Success!", data.message, "info");
                                if ($('#editAssignment').length) {
                                    $('#editAssignment').modal('hide');
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

            $(document).on('click', '#deleteasm', function (e) {
                e.preventDefault();
                var obj = {
                    action: 'deleteasm',
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
                            if ($('#deleteAssignment').length) {
                                $('#deleteAssignment').modal('hide');
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

            $(document).on('click', '#beginupload', function (e) {
                e.preventDefault();
                var assignmentId = $(this).attr('assignment_id');
                    var fileupload = $('#fileupload')[0].files[0];
                    var formdata = new FormData();                   
                    formdata.append('assignmentid', assignmentId);
                    formdata.append('file',fileupload);
                    $.ajax({
                        url: "${context}/AjaxUpload",
                        type: 'POST',
                        enctype: 'multipart/form-data',
                        data: formdata,
                        dataType: 'json',
                        processData: false,
                        contentType: false,
                        success: function (data) {
                            if (data.status === 0) {
                                showMessage("Success!", data.message, "info");
                                if ($('#modalupload').length) {
                                    $('#modalupload').modal('hide');
                                }
                            }
                            if (data.status === 1) {
                                showMessage("Error!", data.message, "warning");
                            }
                        },
                        error: function (jqXHR, status, error) {
                            showMessage("Message", "An error occurred", "danger");
                            console.log('Error from ajax');
                            console.log(status);
                            console.log(jqXHR.responseText);
                        }
                    });
            });
        </script>
    </body>
</html>
