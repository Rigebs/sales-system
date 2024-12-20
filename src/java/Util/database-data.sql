INSERT INTO categoria (nombre, descripcion, estado) VALUES
('Electrónica', 'Dispositivos y gadgets electrónicos', 'Activa'),
('Ropa', 'Prendas de vestir y accesorios', 'Activa'),
('Hogar', 'Artículos para el hogar y cocina', 'Activa'),
('Deportes', 'Equipo y ropa deportiva', 'Activa'),
('Libros', 'Libros y material de lectura', 'Activa'),
('Juguetes', 'Juguetes y juegos para niños', 'Activa'),
('Belleza', 'Productos de belleza y cuidado personal', 'Activa'),
('Salud', 'Productos de salud y cuidado personal', 'Activa'),
('Automotriz', 'Accesorios y repuestos para autos', 'Activa'),
('Jardinería', 'Herramientas y artículos para el jardín', 'Activa');

SELECT * FROM ARTICULO

INSERT INTO articulo (idcategoria, codigo, nombre, precio_venta, stock, descripcion, estado) VALUES
(1, 'E001', 'Smartphone XYZ', '299.99', '50', 'Smartphone con pantalla de 6.5 pulgadas', 'Disponible'),
(1, 'E002', 'Televisor 4K', '499.99', '30', 'Televisor 4K UHD con 55 pulgadas', 'Disponible'),
(2, 'R001', 'Camisa Casual', '29.99', '100', 'Camisa casual de algodón', 'Disponible'),
(2, 'R002', 'Pantalón Jeans', '49.99', '80', 'Pantalón de mezclilla para hombre', 'Disponible'),
(3, 'H001', 'Olla a Presión', '59.99', '40', 'Olla a presión de 6 litros', 'Disponible'),
(3, 'H002', 'Juego de Cubiertos', '19.99', '200', 'Juego de cubiertos de acero inoxidable', 'Disponible'),
(4, 'D001', 'Bicicleta de Montaña', '299.99', '15', 'Bicicleta de montaña con 21 velocidades', 'Disponible'),
(4, 'D002', 'Balón de Fútbol', '19.99', '100', 'Balón de fútbol tamaño reglamentario', 'Disponible'),
(5, 'L001', 'Novela Famosa', '9.99', '150', 'Novela de autor conocido', 'Disponible'),
(5, 'L002', 'Enciclopedia', '49.99', '20', 'Enciclopedia de varios volúmenes', 'Disponible');

INSERT INTO persona (tipo_persona, nombre, tipo_documento, num_documento, direccion, telefono, email) VALUES
('Natural', 'Juan Perez', 'DNI', '12345678', 'Calle Falsa 123', '555-1234', 'juan.perez@example.com'),
('Jurídica', 'Empresa XYZ', 'RUC', '987654321', 'Av. Siempre Viva 456', '555-5678', 'contacto@xyz.com'),
('Natural', 'Maria Lopez', 'DNI', '87654321', 'Calle Luna 789', '555-8765', 'maria.lopez@example.com'),
('Jurídica', 'Corporación ABC', 'RUC', '112233445', 'Av. Estrella 101', '555-1010', 'info@abc.com'),
('Natural', 'Pedro Gomez', 'DNI', '11223344', 'Calle Sol 202', '555-2020', 'pedro.gomez@example.com');


-- Registros para la tabla rol
INSERT INTO rol (nombre, descripcion, estado) VALUES
('Administrador', 'Rol con permisos administrativos completos', 'Activo'),
('Vendedor', 'Rol con permisos limitados para ventas', 'Activo'),
('Cliente', 'Rol para usuarios que son clientes', 'Activo'),
('Supervisor', 'Rol con permisos de supervisión', 'Activo');

-- Registros para la tabla usuario
INSERT INTO usuario (idrol, nombre, tipo_documento, num_documento, direccion, telefono, email, password, estado) VALUES
(1, 'Admin User', 'DNI', '12345678', 'Av. Principal 123', '999888777', 'admin@example.com', 'admin123', 'Activo'),
(2, 'Vendedor Uno', 'DNI', '87654321', 'Calle Secundaria 456', '987654321', 'vendedor1@example.com', 'vendedor123', 'Activo'),
(2, 'Vendedor Dos', 'DNI', '56789012', 'Calle Terciaria 789', '963258741', 'vendedor2@example.com', 'vendedor456', 'Activo'),
(3, 'Cliente Uno', 'RUC', '98765432100', 'Av. Comercial 789', '951357951', 'cliente1@example.com', 'cliente123', 'Activo'),
(3, 'Cliente Dos', 'DNI', '876543210', 'Jr. Comercial 456', '987654321', 'cliente2@example.com', 'cliente456', 'Activo'),
(4, 'Supervisor', 'DNI', '456789012', 'Urb. Residencial 789', '963852741', 'supervisor@example.com', 'supervisor123', 'Activo');
