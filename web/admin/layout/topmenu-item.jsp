<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="resources" value="${pageContext.servletContext.contextPath}/resources" />
<c:set var="context" value="${pageContext.servletContext.contextPath}" />

<script src="${resources}/js/jquery.js"></script>
<ul class="nav navbar-right top-nav">
    <li class="dropdown">
        <% if (request.getSession().getAttribute("adminname") != null) { %>
        <a href="${context}/admin/#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${sessionScope.adminname} <b class="caret"></b></a>
            <%  } else { %> 
        <a href="${context}/admin/#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Admin <b class="caret"></b></a>
            <% }%>
        <ul class="dropdown-menu" style="width:180px !important;">
            <li>
                <a type="button" id="adminchangepassword"><i class="fa fa-fw fa-user"></i> Change Password</a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="${context}/AdminController?action=logout"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
            </li>
        </ul>
    </li>
</ul>


<script>
    $('#adminchangepassword').click(function (){
        $('#modalchangePassword').modal('show');
    });
    $('#modalchangePassword').on("hidden",function (){
        document.location.reload();
    });
</script>
