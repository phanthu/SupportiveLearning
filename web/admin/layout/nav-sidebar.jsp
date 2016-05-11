<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="resources" value="${pageContext.servletContext.contextPath}/resources" />
<c:set var="context" value="${pageContext.servletContext.contextPath}" />

<div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav side-nav">
        <% if (request.getSession().getAttribute("finder") != null) {%>
        <li>
            <a href="${context}/AdminController?action=search&page=1"><i class="fa fa-fw fa-dashboard"></i> Admin manage</a>
        </li>
        <% } else { %>
        <li>
            <a href="${context}/AdminController?action=tableadmin"><i class="fa fa-fw fa-dashboard"></i> Admin manage</a>
        </li>       
        <% } %>
        
        <li>
            <a href="${context}/SubjectController?action=Subject"><i class="fa fa-fw fa-dashboard"></i> Subject manage</a>
        </li>
        <li>
            <a href="${context}/BatchController?action=Batch"><i class="fa fa-fw fa-dashboard"></i> Batch manage</a>
        </li>
        <li>
            <a href="${context}/StudentController?action=Student"><i class="fa fa-fw fa-dashboard"></i> Student manage</a>
        </li>
        <li>
            <a href="${context}/AssignmentController?action=Assignment"><i class="fa fa-fw fa-dashboard"></i> Assignment manage</a>
        </li>
        <li>
            <a href="${context}/SubmitController?action=Submit"><i class="fa fa-fw fa-dashboard"></i> Submit manage</a>
        </li>


    </ul>
</div>

