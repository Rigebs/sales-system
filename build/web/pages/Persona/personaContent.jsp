<%@page import="Model.PersonaModel"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Personas</title>
</head>
<body>
    <!-- Modal para crear nueva persona -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="cerrarModal()">&times;</span>
            <h2>Crear Nueva Persona</h2>
            <form action="PersonaServlet" method="POST">
                <h4>Tipo: </h4><input type="text" name="tipoPersona"><br>
                <h4>Nombre: </h4><input type="text" name="nomPersona"><br>
                <h4>Tipo Documento: </h4><input type="text" name="tipoDocumento"><br>
                <h4>Numero Doc: </h4><input type="text" name="numDocumento"><br>
                <h4>Direccion: </h4><input type="text" name="direccion"><br>
                <h4>Telefono: </h4><input type="text" name="telefono"><br>
                <h4>Email: </h4><input type="text" name="email"><br><br>
                <input type="submit" value="Guardar">
            </form>
        </div>
    </div>

    <!-- Modal para editar persona -->
    <div id="editModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="cerrarEditModal()">&times;</span>
            <h2>Editar Persona</h2>
            <form id="editForm" action="PersonaServlet?action=editar" method="POST">
                <input type="hidden" name="idPersona" id="editIdPersona">
                <h4>Tipo Persona: </h4><input type="text" name="tipoPersona" id="editTipoPersona"><br>
                <h4>Nombre: </h4><input type="text" name="nomPersona" id="editNomPersona"><br>
                <h4>Tipo Documento: </h4><input type="text" name="tipoDocumento" id="editTipoDocumento"><br>
                <h4>Numero Documento: </h4><input type="text" name="numDocumento" id="editNumDocumento"><br>
                <h4>Direccion: </h4><input type="text" name="direccion" id="editDireccion"><br>
                <h4>Telefono: </h4><input type="text" name="telefono" id="editTelefono"><br>
                <h4>Email: </h4><input type="text" name="email" id="editEmail"><br><br>
                <input type="submit" value="Guardar">
            </form>
        </div>
    </div>

    <!-- Modal para confirmar eliminación de persona -->
    <div id="deleteModal" class="modal">
        <div class="modal-content" style="margin: 15% auto;">
            <span class="close" onclick="cerrarDeleteModal()">&times;</span>
            <h2 style="text-align: center">Confirmación de Eliminación</h2>
            <p style="margin: 20px 0">¿Deseas eliminar la persona?</p>
            <div class="botones">
            <button onclick="confirmarEliminar()">SI</button>
            <button onclick="cerrarDeleteModal()">NO</button>
            </div>
        </div>
    </div>

    <!-- Encabezado de la tabla -->
    <div class="table-header">
        <h1>Lista de Personas</h1>
        <div class="boton">
            <button onclick="mostrarModal()">Crear</button>
        </div>
    </div>

    <!-- Tabla de personas -->
    <div class="outer-wrapper">
        <div class="table-wrapper" style="max-height: 500px; overflow: scroll;">
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tipo</th>
                        <th>Nombre</th>
                        <th>Tipo Documento</th>
                        <th>Num Documento</th>
                        <th>Direccion</th>
                        <th>Telefono</th>
                        <th>Email</th>
                        <th style="position: sticky; right: 0;">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <% List<PersonaModel> personas = (List<PersonaModel>) request.getAttribute("personaslista");
                       for (PersonaModel persona : personas) { %>
                    <tr>
                        <td><%= persona.getIdPersona()%></td>
                        <td><%= persona.getTipoPersona()%></td>
                        <td><%= persona.getNomPersona()%></td>
                        <td><%= persona.getTipoDocumento()%></td>
                        <td><%= persona.getNumDocumento()%></td>
                        <td><%= persona.getDireccion()%></td>
                        <td><%= persona.getTelefono()%></td>
                        <td><%= persona.getEmail()%></td>
                        <td style="position: sticky; right: 0; background-color: #f0f0f0;">
                            <button style="margin: 5px 0; padding: 5px 0"
                                    onclick="editarPersona(
                                                    '<%= persona.getIdPersona()%>',
                                                    '<%= persona.getTipoPersona()%>',
                                                    '<%= persona.getNomPersona()%>',
                                                    '<%= persona.getTipoDocumento()%>',
                                                    '<%= persona.getNumDocumento()%>',
                                                    '<%= persona.getDireccion()%>',
                                                    '<%= persona.getTelefono()%>',
                                                    '<%= persona.getEmail()%>')">Editar</button>
                            <button style="margin: 5px 0; padding: 5px 0" onclick="mostrarDeleteModal(<%= persona.getIdPersona()%>)">Eliminar</button>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Formulario oculto para eliminar persona -->
    <form id="deleteForm" style="display: none" action="PersonaServlet?action=eliminar" method="POST">
        <input type="hidden" name="idPersona" id="deleteIdPersona">
    </form>

    <script>
        var modal = document.getElementById('myModal');
        var editModal = document.getElementById('editModal');
        var deleteModal = document.getElementById('deleteModal');
        var spanCerrar = modal.getElementsByClassName("close")[0];
        var spanEditCerrar = editModal.getElementsByClassName("close")[0];
        var spanDeleteCerrar = deleteModal.getElementsByClassName("close")[0];
        var personaAEliminar = null;

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

        function mostrarDeleteModal(idPersona) {
            personaAEliminar = idPersona;
            deleteModal.style.display = "block";
        }

        function cerrarDeleteModal() {
            deleteModal.style.display = "none";
            personaAEliminar = null;
        }

        window.onclick = function(event) {
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

        function editarPersona(id, tipoPersona, nomPersona, tipoDocumento, numDocumento, direccion, telefono, email) {
            document.getElementById('editIdPersona').value = id;
            document.getElementById('editTipoPersona').value = tipoPersona;
            document.getElementById('editNomPersona').value = nomPersona;
            document.getElementById('editTipoDocumento').value = tipoDocumento;
            document.getElementById('editNumDocumento').value = numDocumento;
            document.getElementById('editDireccion').value = direccion;
            document.getElementById('editTelefono').value = telefono;
            document.getElementById('editEmail').value = email;
            mostrarEditModal();
        }

        function confirmarEliminar() {
            if (personaAEliminar !== null) {
                document.getElementById('deleteIdPersona').value = personaAEliminar;
                document.getElementById('deleteForm').submit();
            }
            cerrarDeleteModal();
        }
    </script>
</body>
</html>
