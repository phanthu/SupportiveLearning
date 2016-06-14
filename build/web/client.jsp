/* global i */

<%-- 
    Document   : blank-page
    Created on : Apr 7, 2016, 7:14:03 PM
    Author     : Miku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Supportive Learning</title>

        <c:set var="resources" value="${pageContext.servletContext.contextPath}/resources" />
        <c:set var="context" value="${pageContext.servletContext.contextPath}" />
        <!-- Bootstrap Core CSS -->
        <link href="resources/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="resources/css/sb-admin.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>

        <div class="modal fade" tabindex="-1" role="dialog" id="modalchangePassword">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Change Password</h4>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <label for="adminName">Old Password</label>
                                <input type="Password" class="form-control" id="adminName" placeholder="Name" maxlength="50">
                            </div>
                            <div class="form-group">
                                <label for="password">New Password</label>
                                <input type="password" class="form-control" id="password" placeholder="Password" maxlength="32">
                            </div>
                            <div class="form-group">
                                <label for=repassword">Retype Password</label>
                                <input type="password" class="form-control" id="repassword" placeholder="Password" maxlength="32">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary" id="createAdmin">Change Password</button>
                    </form>

                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="collapse.html">Royal Educational Academy</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${sessionScope.studentNa} <b class="caret"></b></a>
                    <ul class="dropdown-menu" style="width:180px !important;">
                        <li>
                            <a type="button" data-toggle="modal" data-target="#modalchangePassword"><i class="fa fa-fw fa-user"></i> Change Password</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="${context}/StudentController?action=logout"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <c:forEach var="subject" items="${requestScope.lstSubject}">
                        <c:choose>
                            <c:when test="${subject.subjectName == requestScope.subname}">
                                <li class="active">
                                    <a href="${context}/StudentController?action=client&subject=${subject.subjectId}"><i class="fa fa-fw fa-dashboard"></i>${subject.subjectName}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="${context}/StudentController?action=client&subject=${subject.subjectId}" ><i class="fa fa-fw fa-dashboard"></i>${subject.subjectName}</a>
                                </li>
                            </c:otherwise>                       
                        </c:choose>
                    </c:forEach>
                                <li>
                                    <a href ="${context}/upload test.jsp">upload test</a>
                                </li>
                    <!-- /.navbar-collapse -->
                    </nav>

                    <div id="page-wrapper">

                        <div class="container-fluid">

                            <!-- Page Heading -->
                            <h1 class="page-header">${requestScope.subname}</h1>
                            <c:forEach var="asm" items="${requestScope.lstAssignment}">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">
                                                <h4 class="panel-title"> ${asm.assignmentName}
                                                    <div class="pull-right">  <a href="#" data-perform="panel-collapse" class="btn btn-primary btn-xs pull-right"><i class="fa fa-minus"></i></a> </div>
                                                </h4>
                                            </div>
                                            <div class="panel-wrapper collapse in">
                                                <div class="panel-body">
                                                    <div class="table-responsive col-lg-12">
                                                        <table class="table">
                                                            <tr>
                                                                <td>Start time</td>
                                                                <td colspan="2"><fmt:formatDate value="${asm.startTime}" pattern="dd-MM-yyyy HH:mm:ss" /></td>
                                                                <td align="center">Mark</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Dead line</td>
                                                                <td colspan="2"><fmt:formatDate value="${asm.endTime}" pattern="dd-MM-yyyy HH:mm:ss" /></td>
                                                                <td align="center" valign="bottom" rowspan="2" style="font-size: 40px">9</td>
                                                            </tr>
                                                            <tr>
                                                                <td><a href="#" type="button" class="btn btn-success">Download</a></td>

                                                                <td><button class="btn btn-info" data-toggle="modal" data-target="#modalupload" target="upload" assignment_id="${asm.assignmentId}" id="showmodal">Upload Submit</button></td>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <div class="panel panel-info">
                                                            <div class="panel-heading">
                                                                <h4 class="panel-title"> View feedback
                                                                    <div class="pull-right">  <a href="#" data-perform="panel-collapse" class="btn btn-primary btn-xs pull-right"><i class="fa fa-minus"></i></a> </div>
                                                                </h4>
                                                            </div>
                                                            <div class="panel-wrapper collapse">
                                                                <div class="panel-body"> Keep it up </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <!-- /.row -->

                        </div>
                        <!-- /.container-fluid -->

                    </div>
                    <!-- /#page-wrapper -->

            </div>
            <!-- /#wrapper -->
            <!-- jQuery -->
            <script src="resources/js/jquery.js"></script>

            <!-- Bootstrap Core JavaScript -->
            <script src="resources/js/bootstrap.min.js"></script>
            <script src="resources/js/bootstrap-notify.min.js" type="text/javascript"></script>
            <script src="${resources}/js/myutil.js" type="text/javascript"></script>
            <script src="${resources}/js/validate.js" type="text/javascript"></script>
            <script src="resources/js/bootstrap-filestyle.min.js" type="text/javascript"></script>
            <script>
                $(document).ready(function () {

                    /** ******************************
                     * Collapse Panels
                     * [data-perform="panel-collapse"]
                     ****************************** **/
                    (function ($, window, document) {
                        var panelSelector = '[data-perform="panel-collapse"]';

                        $(panelSelector).each(function () {
                            var $this = $(this),
                                    parent = $this.closest('.panel'),
                                    wrapper = parent.find('.panel-wrapper'),
                                    collapseOpts = {toggle: false};

                            if (!wrapper.length) {
                                wrapper =
                                        parent.children('.panel-heading').nextAll()
                                        .wrapAll('<div/>')
                                        .parent()
                                        .addClass('panel-wrapper');
                                collapseOpts = {};
                            }
                            wrapper
                                    .collapse(collapseOpts)
                                    .on('hide.bs.collapse', function () {
                                        $this.children('i').removeClass('fa-minus').addClass('fa-plus');
                                    })
                                    .on('show.bs.collapse', function () {
                                        $this.children('i').removeClass('fa-plus').addClass('fa-minus');
                                    });
                        });
                        $(document).on('click', panelSelector, function (e) {
                            e.preventDefault();
                            var parent = $(this).closest('.panel');
                            var wrapper = parent.find('.panel-wrapper');
                            wrapper.collapse('toggle');
                        });
                    }(jQuery, window, document));

                    /** ******************************
                     * Remove Panels
                     * [data-perform="panel-dismiss"]
                     ****************************** **/
                    (function ($, window, document) {
                        var panelSelector = '[data-perform="panel-dismiss"]';
                        $(document).on('click', panelSelector, function (e) {
                            e.preventDefault();
                            var parent = $(this).closest('.panel');
                            removeElement();

                            function removeElement() {
                                var col = parent.parent();
                                parent.remove();
                                col.filter(function () {
                                    var el = $(this);
                                    return (el.is('[class*="col-"]') && el.children('*').length === 0);
                                }).remove();
                            }
                        });
                    }(jQuery, window, document));

                });
            </script>

            <script>
                $(document).ready(function () {
                    $('[id="showmodal"]').click(function (e) {

                        e.preventDefault();
                        e.stopPropagation();

                        var assignmentid = $(this).attr('assignment_id');
                        if (assignmentid) {

                            var dataTarget = $(this).attr('data-target');
                            var target = $(this).attr('target');
                            var obj = {
                                target: target,
                                action: 'showmodal',
                                id: assignmentid
                            };

                            $.ajax({
                                url: '${context}/SubmitAjaxController',
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
                                    if ($('#modalupload').length) {
                                        $('#modalupload').remove();
                                    }
                                    $('body').append(data);
                                    var modal = $(dataTarget);
                                    modal.modal('show');
                                }
                            });
                        } else {
                            $('#modalchangePassword').modal('show');
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

