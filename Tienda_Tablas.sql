CREATE TABLE CATEGORIA (
ID INTEGER PRIMARY KEY NOT NULL,
NOMBRE TEXT
);

CREATE TABLE PRODUCTO (
ID INTEGER PRIMARY KEY NOT NULL,
NOMBRE TEXT,
MARCA TEXT,
CATEGORIA_ID TEXT,
PRECIO_UNITARIO FLOAT
);

alter table producto drop column CATEGORIA_ID;
alter table producto add column CATEGORIA_ID integer;

alter table producto 
add constraint fk_categoria foreign key (categoria_Id) references Categoria(Id);


CREATE TABLE SUCURSAL  (
ID INTEGER PRIMARY KEY NOT NULL,
NOMBRE TEXT,
DIRECCION TEXT
);

CREATE TABLE STOCK  (
ID INTEGER PRIMARY KEY NOT NULL,
SUCURSAL_ID TEXT,
PRODUCTO_ID TEXT,
CANTIDAD INT,
UNIQUE (SUCURSAL_ID, PRODUCTO_ID)
);

alter table stock drop column SUCURSAL_ID;
alter table stock add column SUCURSAL_ID integer;
alter table stock drop column PRODUCTO_ID;
alter table stock add column PRODUCTO_ID integer;

alter table stock  
add constraint fk_sucursal foreign key (SUCURSAL_ID) references Sucursal(Id),
add constraint fk_producto foreign key (PRODUCTO_ID) references Producto(Id);

CREATE TABLE CLIENTE  (
ID INTEGER PRIMARY KEY NOT NULL,
NOMBRE TEXT,
TELEFONO INT
);

CREATE TABLE ORDEN (
ID INTEGER PRIMARY KEY NOT NULL,
CLIENTE_ID INTEGER,
SUCURSAL_ID INTEGER,
FECHA INT,
TOTAL FLOAT
);

alter table orden drop column FECHA;
alter table orden add column FECHA date;

alter table orden  
add constraint fk_cliente foreign key (CLIENTE_ID) references cliente(Id),
add constraint fk_sucursal foreign key (SUCURSAL_ID) references sucursal(Id);

CREATE TABLE ITEM (
ID INTEGER PRIMARY KEY NOT NULL,
ORDEN_ID INTEGER,
PRODUCTO_ID INTEGER,
CANTIDAD INT,
MONTO_VENTA FLOAT
);

alter table item  
add constraint fk_orden foreign key (ORDEN_ID) references orden(Id),
add constraint fk_producto foreign key (PRODUCTO_ID) references producto(Id);
