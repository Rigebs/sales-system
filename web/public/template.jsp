<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Template Page</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/components/Navbar/navbarStyle.css">

        <link rel="stylesheet" href="<%= request.getContextPath()%>/components/Sidebar/sidebarStyle.css">

        <%
            String stylesheet = request.getParameter("stylesheet");

            if (stylesheet != null && !stylesheet.isEmpty()) {
        %> 
        <link rel="stylesheet" href="<%= request.getContextPath() + stylesheet%>">
        <%
            }
        %>

        <link rel="stylesheet" href="<%= request.getContextPath()%>/public/styles.css">
    </head>
    <body>
        <div >
            <jsp:include page="../components/Navbar/navbar.jsp" />
        </div>
        <div >
            <jsp:include page="../components/Sidebar/sidebar.jsp" />
        </div>
        <div class="content">
            <%
                String pageContent = (String) request.getAttribute("pageContent");
            %>
            <jsp:include page="<%= pageContent%>" />
        </div>
    </body>
</html>
