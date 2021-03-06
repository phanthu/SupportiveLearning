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

        <title>Subject</title>

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
                                Subject
                            </h1>
                            <ol class="breadcrumb">
                                <li>
                                    <i class="fa fa-dashboard"></i>  <a href="${context}/admin/index.jsp">Dashboard</a>
                                </li>
                                <li class="active">
                                    <i class="fa fa-table"></i> Subject
                                </li>
                            </ol>
                        </div>
                    </div>
                    <!-- /.row -->

                    <div class="row">
                        <h2>Search Subject</h2>
                        <form action="${context}/SubjectController" method="POST">
                            <div>
                                <div>
                                    <label for="inputSubjectId">Subject ID</label>
                                    <input maxlength="6" type="number" class="form-control" placeholder="Enter Subject ID..." name="id" id="inputSubjectId" min="1" max="1000000">
                                    <br>
                                </div>
                                <div>
                                    <label for="inputSubjectName">Subject name</label>
                                    <input maxlength="50" type="text" class="form-control" placeholder="Enter Subject name..." name="name" id="inputSubjectName">
                                    <br>
                                </div>
                                <button class="btn btn-success" type="submit" name="action" id="search" value="Subject">Search Subject</button>
                                <a href="SubjectController?action=ClearFinder" class="btn btn-default">Clear search</a>
                                <button type="button" class="btn btn-primary" id="create" data-toggle="modal" data-target="#createSubject" target="create">Create new Subject</button>
                            </div>
                        </form>
                        <div>
                            <h2>Subject List</h2>
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover table-striped">

                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="subject" items="${requestScope.lst}">
                                            <tr id="${subject.subjectId}">
                                                <td>${subject.subjectId}</td>
                                                <td>${subject.subjectName}</td>
                                                <td><button class="btn btn-primary btn-sm" subject_id="${subject.subjectId}" data-toggle="modal" target="edit" data-target="#editSubject">Edit</button>
                                                    <button class="btn btn-danger btn-sm" subject_id="${subject.subjectId}" data-toggle="modal" target="delete" data-target="#deleteSubject">Delete</button></td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                            <div class="btn-group">
                                <c:if test="${requestScope.page>1}">
                                    <a type="button" href="${context}/SubjectController?action=Subject&page=${requestScope.page-1}" class="btn btn-default">Previous</a>
                                </c:if>

                                <c:forEach var="i" begin="1" end="${requestScope.noOfPages}">
                                    <c:choose>
                                        <c:when test="${i eq requestScope.page}">
                                            <a href="${context}/SubjectController?action=Subject&page=${i}" type="button" class="btn btn-primary disabled">${i}</a>
                                        </c:when>
                                        <c:when test="${i ne requestScope.page}">
                                            <a href="${context}/SubjectController?action=Subject&page=${i}" type="button" class="btn btn-default">${i}</a>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>

                                <c:if test="${requestScope.page<requestScope.noOfPages}">
                                    <a type="button" href="${context}/SubjectController?action=Subject&page=${requestScope.page+1}" class="btn btn-default">Next</a>
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
        <!-- Morris Charts JavaScript -->
        <script>
            $(document).on('click', '#createS', function (e) {
                e.preventDefault();
                if (checkSubject() === true) {
                    var obj = {
                        action: 'createsubject',
                        subjectname: $('#subjectName').val().trim()
                    };
                    $.ajax({
                        url: "${context}/SubjectAjaxController",
                        type: 'POST',
                        data: obj,
                        datatype: 'json',
                        success: function (data) {
                            if (data.status === 0) {
                                showMessage("Success!", data.message, "info");

                                if ($('#createSubject').length) {
                                    $('#createSubject').modal('hide');
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

                    var subjectid = $(this).attr('subject_id');
                    if (subjectid) {
                        var dataTarget = $(this).attr('data-target');
                        var target = $(this).attr('target');
                        var obj = {
                            id: subjectid,
                            target: target
                        };
                        $.ajax({
                            url: '${context}/SubjectAjaxController',
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
                            url: "${context}/SubjectAjaxController",
                            type: 'POST',
                            data: obj,
                            dataType: 'html',
                            error: function (jqXHR, textStatus, errorThrown) {
                                showMessage("Error", "Ajax error", "danger");
                            },
                            success: function (data) {
                                $('body').prepend(data);
                                $('#createSubject').modal('show');
                            }
                        });
                    }
                });
            });

            $(document).on('click', '#saveS', function (e) {
                e.preventDefault();
                if (checkSubject()) {
                    var obj = {
                        action: 'savesubject',
                        subjectId: $('#esubjectId').val().trim(),
                        subjectName: $('#esubjectName').val().trim()
                    };
                    $.ajax({
                        url: "${context}/SubjectAjaxController",
                        type: 'POST',
                        data: obj,
                        datatype: 'json',
                        success: function (data) {
                            if (data.status === 0) {
                                showMessage("Success!", data.message, "info");
                                if ($('#editSubject').length) {
                                    $('#editSubject').modal('hide');
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

            $(document).on('click', '#deleteS', function (e) {
                e.preventDefault();
                var obj = {
                    action: 'deletesubject',
                    subjectId: $('#did').val().trim()
                };
                $.ajax({
                    url: "${context}/SubjectAjaxController",
                    type: 'POST',
                    data: obj,
                    datatype: 'json',
                    success: function (data) {
                        if (data.status === 0) {
                            showMessage("Success!", data.message, "info");
                            if ($('#deleteSubject').length) {
                                $('#deleteSubject').modal('hide');
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
