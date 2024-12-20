<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("pageContent", "/pages/Venta/ventaContent.jsp"); %>

<jsp:include page="../../public/template.jsp">
    <jsp:param name="stylesheet" value="/pages/Venta/ventaStyle.css" />
</jsp:include>