<%@page import="Model.PersonaModel"%>
<%@page import="Model.ArticuloModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Realizar Venta</title>
        <link rel="stylesheet" type="text/css" href="ventaStyle.css">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <!-- Left Container -->
                <div class="col left-container">
                    <button class="btn" id="seleccionarProductosBtn">Productos</button>

                    <table class="table" id="detalle_venta">
                        <thead>
                            <tr>
                                <th>N</th>
                                <th>Producto</th>
                                <th>Precio</th>
                                <th style="width: 20px">Cantidad</th>
                                <th>Subtotal</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Aquí se agregarán los productos seleccionados -->
                        </tbody>
                    </table>
                    <button type="button" class="btn" id="confirmarVenta" style="margin-top: 15px">Confirmar</button>
                    <div id="resultadosVenta" class="mt-3">
                        <p>Costo: <span id="costo"></span></p>
                        <p>Impuesto: <span id="impuesto"></span></p>
                        <p>Total: <span id="total"></span></p>
                    </div>
                </div>

                <!-- Right Container -->
                <div class="col right-container">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="tipo_documento" id="boleta" value="boleta" checked>
                        <label class="form-check-label" for="boleta">Boleta</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="tipo_documento" id="factura" value="factura">
                        <label class="form-check-label" for="factura">Factura</label>
                    </div>
                    <div class="form-group mt-3">
                        <label for="numero">Número</label>
                        <input type="text" class="form-control" id="numero">
                    </div>
                    <div class="form-group">
                        <label for="serie">Serie</label>
                        <input type="text" class="form-control" id="serie">
                    </div>
                    <button type="button" class="btn" id="seleccionarClienteBtn">
                        Seleccionar Cliente
                    </button>
                    <p style="margin: 10px 0;">Cliente seleccionado: <span id="clienteSeleccionado"></span></p>

                    <button type="button" class="btn" id="realizarVenta">Realizar Venta</button>
                </div>
            </div>
        </div>

        <!-- Modal para seleccionar productos -->
        <div class="modal" id="productosModal">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Seleccionar Productos</h5>
                    <span class="close" id="closeProductosModal" onclick="cerrarModal('productosModal')">&times;</span>
                </div>
                <div class="modal-body">
                    <div class="outer-wrapper">
                        <div class="table-wrapper" style="max-height: 450px; overflow-y: scroll;">
                            <table class="table" id="tabla_productos">
                                <thead>
                                    <tr>
                                        <th style="width: 2px">N</th>
                                        <th>Producto</th>
                                        <th style="width: 5px">Precio</th>
                                        <th style="width: 10px">Seleccionar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        List<ArticuloModel> articulos = (List<ArticuloModel>) request.getAttribute("articuloslista");
                                        if (articulos != null && !articulos.isEmpty()) {
                                            int contador = 1;
                                            for (ArticuloModel articulo : articulos) {
                                    %>
                                    <tr>
                                        <td><%= contador++%></td>
                                        <td><%= articulo.getNomArticulo()%></td>
                                        <td><%= articulo.getPrecioVenta()%></td>
                                        <td><button class="btn seleccionarProducto" data-id="<%= articulo.getIdArticulo()%>" data-producto="<%= articulo.getNomArticulo()%>" data-precio="<%= articulo.getPrecioVenta()%>" onclick="agregarProducto(this)">Agregar</button></td>
                                    </tr>
                                    <%
                                            }
                                        } else {
                                            // Mostrar aviso si no hay productos
                                            String mensaje = "No hay productos disponibles.";
                                            out.print("<script>mostrarAviso('" + mensaje + "')</script>");
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal" id="avisoModal">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Aviso</h5>
                    <span class="close" onclick="cerrarModal('avisoModal')">&times;</span>
                </div>
                <div class="modal-body">
                    <p id="avisoMensaje"></p>
                </div>
            </div>
        </div>                     

        <!-- Modal para seleccionar clientes -->
        <div class="modal" id="clientesModal">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Seleccionar Cliente</h5>
                    <span class="close" id="closeClientesModal" onclick="cerrarModal('clientesModal')">&times;</span>
                </div>
                <div class="modal-body">
                    <table class="table" id="tabla_clientes">
                        <thead>
                            <tr>
                                <th>Num</th>
                                <th>Cliente</th>
                                <th>Seleccionar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Iterar sobre la lista de clientes disponibles -->
                            <%
                                List<PersonaModel> personas = (List<PersonaModel>) request.getAttribute("personaslista");
                                if (personas != null && !personas.isEmpty()) {
                                    int contador = 1;
                                    for (PersonaModel persona : personas) {
                            %>
                            <tr>
                                <td><%= contador++%></td>
                                <td><%= persona.getNomPersona()%></td>
                                <td><button class="btn seleccionarCliente" data-id="<%= persona.getIdPersona()%>" data-cliente="<%= persona.getNomPersona()%>" onclick="seleccionarCliente(this)">Seleccionar</button></td>
                            </tr>
                            <%
                                    }
                                } else {
                                    // Mostrar aviso si no hay clientes
                                    String mensaje = "No hay clientes disponibles.";
                                    out.print("<script>mostrarAviso('" + mensaje + "')</script>");
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Formularios ocultos -->
        <form id="ventaForm" action="VentaServlet" method="POST">
            <input type="hidden" name="idCliente" id="idClienteInput">
            <input type="hidden" name="tipoComprobante" id="tipoComprobanteInput">
            <input type="hidden" name="serieComprobante" id="serieComprobanteInput">
            <input type="hidden" name="numComprobante" id="numComprobanteInput">
            <input type="hidden" name="impuesto" id="impuestoInput">
            <input type="hidden" name="total" id="totalInput">
            <!-- Campos ocultos para los detalles de la venta se agregarán dinámicamente -->
        </form>

        <script>
            function mostrarModal(modalId) {
                document.getElementById(modalId).style.display = 'block';
            }

            function cerrarModal(modalId) {
                document.getElementById(modalId).style.display = 'none';
            }

            function agregarProducto(button) {
                var id = button.getAttribute('data-id');
                var producto = button.getAttribute('data-producto');
                var precio = parseFloat(button.getAttribute('data-precio'));
                var cantidad = 1; // Inicialmente 1, se puede cambiar según sea necesario
                var subtotal = precio * cantidad;

                // Verificar si el producto ya está en la tabla
                var existe = false;
                document.querySelectorAll('#detalle_venta tbody tr').forEach(function (row) {
                    if (row.cells[0].innerText === id) {
                        existe = true;
                    }
                });

                if (!existe) {
                    var nuevaFila = '<tr>' +
                            '<td>' + id + '</td>' +
                            '<td>' + producto + '</td>' +
                            '<td>' + precio.toFixed(2) + '</td>' +
                            '<td><input type="number" value="' + cantidad + '" min="1" class="cantidad" data-precio="' + precio + '" oninput="actualizarSubtotal(this)"></td>' +
                            '<td class="subtotal">' + subtotal.toFixed(2) + '</td>' +
                            '</tr>';

                    document.querySelector('#detalle_venta tbody').insertAdjacentHTML('beforeend', nuevaFila);
                    // Deshabilitar el botón para que no se pueda seleccionar nuevamente
                    button.disabled = true;
                } else {
                    alert('El producto ya está en la lista.');
                }
            }

            function actualizarSubtotal(input) {
                var cantidad = parseInt(input.value);
                var precio = parseFloat(input.getAttribute('data-precio'));
                var subtotal = cantidad * precio;

                var fila = input.closest('tr');
                fila.querySelector('.subtotal').innerText = subtotal.toFixed(2);
            }

            function actualizarResultados() {
                var costo = 0;
                document.querySelectorAll('#detalle_venta tbody tr').forEach(function (row) {
                    var subtotal = parseFloat(row.querySelector('.subtotal').innerText);
                    costo += subtotal;
                });

                var impuesto = costo * 0.18; // Suponiendo un impuesto del 18%
                var total = costo + impuesto;

                document.getElementById('costo').innerText = costo.toFixed(2);
                document.getElementById('impuesto').innerText = impuesto.toFixed(2);
                document.getElementById('total').innerText = total.toFixed(2);
            }

            document.getElementById('confirmarVenta').addEventListener('click', function () {
                actualizarResultados();
            });

            document.getElementById('seleccionarProductosBtn').addEventListener('click', function () {
                mostrarModal('productosModal');
            });

            document.getElementById('seleccionarClienteBtn').addEventListener('click', function () {
                mostrarModal('clientesModal');
            });

            function seleccionarCliente(button) {
                var idCliente = button.getAttribute('data-id'); // Obtener el ID del cliente
                var cliente = button.getAttribute('data-cliente'); // Nombre del cliente (opcional para mostrar en UI)

                document.getElementById('clienteSeleccionado').innerText = cliente;

                document.getElementById('idClienteInput').value = idCliente;

                cerrarModal('clientesModal');
            }

            document.getElementById('realizarVenta').addEventListener('click', function () {
                var tipoComprobante = document.querySelector('input[name="tipo_documento"]:checked').value;
                var serieComprobante = document.getElementById('serie').value;
                var numComprobante = document.getElementById('numero').value;
                var impuesto = parseFloat(document.getElementById('impuesto').innerText);
                var total = parseFloat(document.getElementById('total').innerText);

                document.getElementById('tipoComprobanteInput').value = tipoComprobante;
                document.getElementById('serieComprobanteInput').value = serieComprobante;
                document.getElementById('numComprobanteInput').value = numComprobante;
                document.getElementById('impuestoInput').value = impuesto.toFixed(2);
                document.getElementById('totalInput').value = total.toFixed(2);

                // Limpiar el formulario de detalles de venta
                var ventaForm = document.getElementById('ventaForm');
                ventaForm.querySelectorAll('.detalleVentaField').forEach(function (field) {
                    field.remove();
                });

                // Agregar los detalles de la venta al formulario
                document.querySelectorAll('#detalle_venta tbody tr').forEach(function (row) {
                    var idArticulo = row.cells[0].innerText;
                    var cantidad = row.querySelector('.cantidad').value;
                    var precio = row.cells[2].innerText;

                    var inputIdArticulo = document.createElement('input');
                    inputIdArticulo.type = 'hidden';
                    inputIdArticulo.name = 'idArticulo[]';
                    inputIdArticulo.value = idArticulo;
                    inputIdArticulo.classList.add('detalleVentaField');

                    var inputCantidad = document.createElement('input');
                    inputCantidad.type = 'hidden';
                    inputCantidad.name = 'cantidad[]';
                    inputCantidad.value = cantidad;
                    inputCantidad.classList.add('detalleVentaField');

                    var inputPrecio = document.createElement('input');
                    inputPrecio.type = 'hidden';
                    inputPrecio.name = 'precio[]';
                    inputPrecio.value = precio;
                    inputPrecio.classList.add('detalleVentaField');

                    ventaForm.appendChild(inputIdArticulo);
                    ventaForm.appendChild(inputCantidad);
                    ventaForm.appendChild(inputPrecio);
                });

                ventaForm.submit();
                alert('Venta realizada con éxito');
            });

            window.onclick = function (event) {
                var modals = document.querySelectorAll('.modal');
                modals.forEach(function (modal) {
                    if (event.target === modal) {
                        modal.style.display = 'none';
                    }
                });
            };

            function mostrarAviso(mensaje) {
                document.getElementById('avisoMensaje').innerText = mensaje;
                mostrarModal('avisoModal');
            }
        </script>
    </body>
</html>
