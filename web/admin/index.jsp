<%
    if(session.getAttribute("adminname")==null || session.getAttribute("adminname").equals("")){
        response.sendRedirect(request.getContextPath()+"/admin/adminlogin.jsp");
    }else{
        response.sendRedirect(request.getContextPath()+"/AdminController?action=tableadmin");
    }
%>