<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.ArticuloModel" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Lista de Productos</title>
    </head>
    <body>
        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="cerrarModal()">&times;</span>
                <h2>Crear Nuevo Artículo</h2>
                <form action="ProductoServlet" method="POST">
                    <!-- Aquí van los campos del formulario -->
                    <h4>ID Categoría: </h4><input type="text" name="idCategoria"><br>
                    <h4>Código: </h4><input type="text" name="codigo"><br>
                    <h4>Nombre del Artículo: </h4><input type="text" name="nomArticulo"><br>
                    <h4>Precio de Venta: </h4><input type="text" name="precioVenta"><br>
                    <h4>Stock: </h4><input type="text" name="stock"><br>
                    <h4>Descripción: </h4><input type="text" name="descripcion"><br>
                    <h4>Estado: </h4><input type="text" name="estado"><br><br>
                    <input type="submit" value="Guardar">
                </form>
            </div>
        </div>

        <div id="editModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="cerrarEditModal()">&times;</span>
                <h2>Editar Artículo</h2>
                <form id="editForm" action="ProductoServlet?action=editar" method="POST">
                    <!-- Aquí van los campos del formulario -->
                    <input type="hidden" name="idArticulo" id="editIdArticulo">
                    <h4>ID Categoría: </h4><input type="text" name="idCategoria" id="editIdCategoria"><br>
                    <h4>Código: </h4><input type="text" name="codigo" id="editCodigo"><br>
                    <h4>Nombre del Artículo: </h4><input type="text" name="nomArticulo" id="editNomArticulo"><br>
                    <h4>Precio de Venta: </h4><input type="text" name="precioVenta" id="editPrecioVenta"><br>
                    <h4>Stock: </h4><input type="text" name="stock" id="editStock"><br>
                    <h4>Descripción: </h4><input type="text" name="descripcion" id="editDescripcion"><br>
                    <h4>Estado: </h4><input type="text" name="estado" id="editEstado"><br><br>
                    <input type="submit" value="Guardar">
                </form>
            </div>
        </div>

        <div id="deleteModal" class="modal">
            <div class="modal-content" style="margin: 15% auto;">
                <span class="close" onclick="cerrarDeleteModal()">&times;</span>
                <h2 style="text-align: center">Confirmación de Eliminación</h2>
                <p style="margin: 20px 0">¿Deseas eliminar el producto?</p>
                <div class="botones">
                <button onclick="confirmarEliminar()">SI</button>
                <button onclick="cerrarDeleteModal()">NO</button>
                </div>
            </div>
        </div>

        <div class="table-header">
            <h1>Lista de Productos</h1>

            <div class="boton">
                <button onclick="mostrarModal()">Crear</button>
            </div>
        </div>

        <div class="outer-wrapper">
            <div class="table-wrapper" style="max-height: 500px; overflow: scroll;">
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Categoría</th>
                            <th>Código</th>
                            <th>Nombre</th>
                            <th>Precio</th>
                            <th>Stock</th>
                            <th>Descripción</th>
                            <th>Estado</th>
                            <th style="position: sticky; right: 0;">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<ArticuloModel> articulos = (List<ArticuloModel>) request.getAttribute("articuloslista");

                            for (ArticuloModel articulo : articulos) {
                        %>
                        <tr>
                            <td><%= articulo.getIdArticulo()%></td>
                            <td><%= articulo.getIdCategoria()%></td>
                            <td><%= articulo.getCodigo()%></td>
                            <td><%= articulo.getNomArticulo()%></td>
                            <td><%= articulo.getPrecioVenta()%></td>
                            <td><%= articulo.getStock()%></td>
                            <td><%= articulo.getDescripcion()%></td>
                            <td><%= articulo.getEstado()%></td>
                            <td style="position: sticky; right: 0; background-color: #f0f0f0;">
                                <button style="margin: 5px 0; padding: 5px 0"
                                        onclick="editarArticulo(
                                                        '<%= articulo.getIdArticulo()%>',
                                                        '<%= articulo.getIdCategoria()%>',
                                                        '<%= articulo.getCodigo()%>',
                                                        '<%= articulo.getNomArticulo()%>',
                                                        '<%= articulo.getPrecioVenta()%>',
                                                        '<%= articulo.getStock()%>',
                                                        '<%= articulo.getDescripcion()%>',
                                                        '<%= articulo.getEstado()%>')">Editar</button>
                                <button style="margin: 5px 0; padding: 5px 0" onclick="mostrarDeleteModal(<%= articulo.getIdArticulo()%>)">Eliminar</button>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>


        <form id="deleteForm" style="display: none" action="ProductoServlet?action=eliminar" method="POST">
            <input type="hidden" name="idArticulo" id="deleteIdArticulo">
        </form>

        <script>
            var modal = document.getElementById('myModal');
            var editModal = document.getElementById('editModal');
            var deleteModal = document.getElementById('deleteModal');
            var spanCerrar = modal.getElementsByClassName("close")[0];
            var spanEditCerrar = editModal.getElementsByClassName("close")[0];
            var spanDeleteCerrar = deleteModal.getElementsByClassName("close")[0];
            var articuloAEliminar = null;

            function mostrarModal() {
                modal.style.display = "block";
            }

            function cerrarModal() {
                modal.style.display = "none";
            }

            function mostrarEditModal() {
                editModal.style.display = "block";
            }

            function cerrarEditModal() {
                editModal.style.display = "none";
            }

            function mostrarDeleteModal(idArticulo) {
                articuloAEliminar = idArticulo;
                deleteModal.style.display = "block";
            <%log("HOLANDAS");%>
            }

            function cerrarDeleteModal() {
                deleteModal.style.display = "none";
                articuloAEliminar = null;
            }

            window.onclick = function (event) {
                if (event.target === modal) {
                    modal.style.display = "none";
                }
                if (event.target === editModal) {
                    editModal.style.display = "none";
                }
                if (event.target === deleteModal) {
                    deleteModal.style.display = "none";
                }
            };

            function editarArticulo(id, idCategoria, codigo, nomArticulo, precioVenta, stock, descripcion, estado) {
                document.getElementById('editIdArticulo').value = id;
                document.getElementById('editIdCategoria').value = idCategoria;
                document.getElementById('editCodigo').value = codigo;
                document.getElementById('editNomArticulo').value = nomArticulo;
                document.getElementById('editPrecioVenta').value = precioVenta;
                document.getElementById('editStock').value = stock;
                document.getElementById('editDescripcion').value = descripcion;
                document.getElementById('editEstado').value = estado;
                mostrarEditModal();
            }

            function confirmarEliminar() {
                if (articuloAEliminar !== null) {
                    document.getElementById('deleteIdArticulo').value = articuloAEliminar;
                    document.getElementById('deleteForm').submit();
                }
                cerrarDeleteModal();
            }
        </script>
    </body>
</html>
