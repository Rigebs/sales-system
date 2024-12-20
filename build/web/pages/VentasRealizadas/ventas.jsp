<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("pageContent", "/pages/VentasRealizadas/ventasContent.jsp"); %>

<jsp:include page="../../public/template.jsp">
    <jsp:param name="stylesheet" value="/pages/VentasRealizadas/ventasStyle.css" />
</jsp:include>