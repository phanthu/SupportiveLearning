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
                                                                <c:if test="${not empty asm.url}">
                                                                    <td><a href="ServletDownload?url=${asm.url}" type="button" class="btn btn-success">Download</a></td>
                                                                </c:if>
                                                                <c:if test="${empty asm.url}">
                                                                    <td><a href="#" type="button" class="btn btn-success" disabled>Download</a></td>   
                                                                </c:if>
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