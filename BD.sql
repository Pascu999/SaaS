DROP TABLE IF EXISTS Evidencias;
DROP TABLE IF EXISTS Proveedor_Suministra_Materiales;
DROP TABLE IF EXISTS Trabajador_Asignada_Obra;
DROP TABLE IF EXISTS Obras_Requieren_Materiales;
DROP TABLE IF EXISTS Clientes_Contratan_Obras;
DROP TABLE IF EXISTS Proveedores;
DROP TABLE IF EXISTS Materiales;
DROP TABLE IF EXISTS Trabajadores;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Obras;

DROP SEQUENCE IF EXISTS secuencia_proveedores;
DROP SEQUENCE IF EXISTS secuencia_materiales;
DROP SEQUENCE IF EXISTS secuencia_obras_requieren_materiales;
DROP SEQUENCE IF EXISTS secuencia_obras;
DROP SEQUENCE IF EXISTS secuencia_trabajadores;
DROP SEQUENCE IF EXISTS secuencia_evidencias;
DROP SEQUENCE IF EXISTS secuencia_clientes;
DROP SEQUENCE IF EXISTS secuencia_contratos_numeros;

DROP TRIGGER IF EXISTS tr_crear_secuencia_proveedores ON Proveedores;
DROP TRIGGER IF EXISTS tr_crear_secuencia_materiales ON Materiales;
DROP TRIGGER IF EXISTS tr_crear_secuencia_obras_requieren_materiales ON Obras_Requieren_Materiales;
DROP TRIGGER IF EXISTS tr_crear_secuencia_obras ON Obras;
DROP TRIGGER IF EXISTS tr_crear_secuencia_trabajadores ON Trabajadores;
DROP TRIGGER IF EXISTS tr_crear_secuencia_evidencias ON Evidencias;
DROP TRIGGER IF EXISTS tr_crear_secuencia_clientes ON Clientes;
DROP TRIGGER IF EXISTS tr_crear_secuencia_contratos ON Contratos;

DROP FUNCTION IF EXISTS crear_secuencia_proveedores;
DROP FUNCTION IF EXISTS crear_secuencia_materiales;
DROP FUNCTION IF EXISTS crear_secuencia_obras_requieren_materiales;
DROP FUNCTION IF EXISTS crear_secuencia_obras;
DROP FUNCTION IF EXISTS crear_secuencia_trabajadores;
DROP FUNCTION IF EXISTS crear_secuencia_evidencias;
DROP FUNCTION IF EXISTS crear_secuencia_clientes;
DROP FUNCTION IF EXISTS crear_secuencia_contratos;

CREATE SEQUENCE secuencia_proveedores;
CREATE SEQUENCE secuencia_materiales;
CREATE SEQUENCE secuencia_obras_requieren_materiales;
CREATE SEQUENCE secuencia_obras;
CREATE SEQUENCE secuencia_trabajadores;
CREATE SEQUENCE secuencia_evidencias;
CREATE SEQUENCE secuencia_clientes;
CREATE SEQUENCE secuencia_contratos;

DROP EXTENSION IF EXISTS postgis;

CREATE EXTENSION postgis;


CREATE TABLE Proveedores(
    proveedor_id INT,
    proveedor_nombre VARCHAR (50),
    proveedor_nit INT,
    proveedor_direccion VARCHAR (50),
    proveedor_correo_electronico VARCHAR (50),
    proveedor_telefono VARCHAR (20),
    proveedor_estado INT,

    CONSTRAINT pk_proveedor PRIMARY KEY (proveedor_id)

);

CREATE TABLE Materiales(
    material_id INT,
    material_descripcion VARCHAR (200),
    material_nombre VARCHAR (50),
    material_cantidad INT,
    material_estado INT,

    CONSTRAINT pk_material PRIMARY KEY (material_id) 


);

CREATE TABLE Obras(
    obra_id INT,
    obra_nombre VARCHAR (50),
    obra_direccion VARCHAR (50),
    obra_ciudad VARCHAR (50),
    obra_estado INT,
    obra latitud DECIMAL(8,6),
    obra_longitud DECIMAL(8,6),

    CONSTRAINT  pk_obra PRIMARY KEY (obra_id)


);

CREATE TABLE Clientes(
    cliente_id INT,
    cliente_nombre VARCHAR (50),
    cliente_nit INT,
    cliente_estado INT,
    cliente_correo VARCHAR (50),
    cliente_direccion VARCHAR (50),
    cliente_contrasena VARCHAR (256),

    CONSTRAINT  pk_cliente PRIMARY KEY (cliente_id)

);

CREATE TABLE Trabajadores(
    trabajador_id INT,
    trabajador_nombre VARCHAR(50),
    trabajdor_apellido VARCHAR(50),
    trabajador_documento VARCHAR(20),
    trabajador_direccion VARCHAR(50),
    trabajador_celular VARCHAR(20),
    trabajador_contrasena VARCHAR(256),
    trabajador_estado  INT,

    CONSTRAINT  pk_trabajador PRIMARY KEY (trabajador_id)

);