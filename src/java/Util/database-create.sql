CREATE DATABASE DB_SALES_SYSTEM;

USE DB_SALES_SYSTEM;

create table categoria(
       idcategoria int primary key auto_increment not null,
       nombre varchar(50) not null,
       descripcion varchar(256) null,
       estado varchar(20)
);

SELECT * FROM venta

SELECT * FROM DETALLE_VENTA

create table articulo(
       idarticulo int primary key auto_increment not null,
       idcategoria int not null,
       codigo varchar(50) null,
       nombre varchar(100) not null,
       precio_venta varchar(50),
       stock varchar(50),
       descripcion varchar(256),
       estado varchar(20),
       FOREIGN KEY (idcategoria) REFERENCES categoria(idcategoria)
);

SELECT * FROM ARTICULO;


create table persona(
       idpersona int primary key auto_increment not null,
       tipo_persona varchar(20) not null,
       nombre varchar(100) not null,
       tipo_documento varchar(20) null,
       num_documento varchar(20) null,
       direccion varchar(70) null,
       telefono varchar(20) null,
       email varchar(50) null
);


create table rol(
       idrol int primary key auto_increment not null,
       nombre varchar(30) not null,
       descripcion varchar(100) null,
       estado varchar(20)
);

create table usuario(
       idusuario int primary key auto_increment not null,
       idrol int not null,
       nombre varchar(100) not null,
       tipo_documento varchar(20) null,
       num_documento varchar(20) null,
       direccion varchar(70) null,
       telefono varchar(20) null,
       email varchar(50) null,
       password varchar(50) null,
       estado varchar(20),
       FOREIGN KEY (idrol) REFERENCES rol (idrol)
);

create table ingreso(
       idingreso int primary key auto_increment not null,
       idproveedor int not null,
       idusuario int not null,
       tipo_comprobante varchar(20) not null,
       serie_comprobante varchar(7) null,
       num_comprobante varchar (10) not null,
       fecha varchar(20),
       impuesto varchar(20),
       total varchar(20),
       estado varchar(20) ,
       FOREIGN KEY (idproveedor) REFERENCES persona (idpersona),
       FOREIGN KEY (idusuario) REFERENCES usuario (idusuario)
);

create table detalle_ingreso(
       iddetalle_ingreso int primary key auto_increment not null,
       idingreso int not null,
       idarticulo int not null,
       cantidad varchar(10) not null,
       precio varchar(10) not null,
       FOREIGN KEY (idingreso) REFERENCES ingreso (idingreso),
       FOREIGN KEY (idarticulo) REFERENCES articulo (idarticulo)
);

create table venta(
       idventa int primary key auto_increment not null,
       idcliente int not null,
       idusuario int not null,
       tipo_comprobante varchar(20) not null,
       serie_comprobante varchar(7) null,
       num_comprobante varchar (10) not null,
       fecha_hora varchar(20),
       impuesto varchar(20),
       total varchar(20),
       estado varchar(20),
       FOREIGN KEY (idcliente) REFERENCES persona (idpersona),
       FOREIGN KEY (idusuario) REFERENCES usuario (idusuario)
);

SELECT * FROM VENTA

create table detalle_venta(
       iddetalle_venta int primary key auto_increment not null,
       idventa int not null,
       idarticulo int not null,
       cantidad int not null,
       precio varchar(20),
       descuento varchar(20),
       FOREIGN KEY (idventa) REFERENCES venta (idventa),
       FOREIGN KEY (idarticulo) REFERENCES articulo (idarticulo)
);

SELECT * FROM detalle_venta