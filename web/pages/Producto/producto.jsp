<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setAttribute("pageContent", "/pages/Producto/productoContent.jsp"); %>

<jsp:include page="../../public/template.jsp">
    <jsp:param name="stylesheet" value="/pages/Producto/productoStyle.css" />
</jsp:include>
