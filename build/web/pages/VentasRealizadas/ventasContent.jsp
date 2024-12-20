<%@page import="Model.VentaModel"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.ArticuloModel" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Lista de Ventas</title>
    </head>
    <body>
        <div class="table-header">
            <h1>Lista de Productos</h1>
        </div>
        <div class="outer-wrapper" >
            <div class="table-wrapper" style="max-height: 500px; overflow: scroll;">
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>ID CLIENTE</th>
                            <th>ID USUARIO</th>
                            <th>COMPROBANTE</th>
                            <th>SERIE</th>
                            <th>NUMERO</th>
                            <th>FECHA</th>
                            <th>IMPUESTO</th>
                            <th>TOTAL</th>
                            <th>ESTADO</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<VentaModel> ventas = (List<VentaModel>) request.getAttribute("ventaslista");

                            for (VentaModel venta : ventas) {
                        %>
                        <tr>
                            <td><%= venta.getIdVenta()%></td>
                            <td><%= venta.getIdCliente()%></td>
                            <td><%= venta.getIdUsuario()%></td>
                            <td><%= venta.getTipoComprobante()%></td>
                            <td><%= venta.getSerieComprobante()%></td>
                            <td><%= venta.getNumComprobante()%></td>
                            <td><%= venta.getFechaHora()%></td>
                            <td><%= venta.getImpuesto()%></td>
                            <td><%= venta.getTotal()%></td>
                            <td><%= venta.getEstado()%></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <script>
            var modal = document.getElementById('myModal');
            var btnAbrir = document.querySelector('button');
            var spanCerrar = document.getElementsByClassName("close")[0];

            function mostrarModal() {
                modal.style.display = "block";
            }

            function cerrarModal() {
                modal.style.display = "none";
            }

            window.onclick = function (event) {
                if (event.target === modal) {
                    modal.style.display = "none";
                }
            };


        </script>

    </body>
</html>