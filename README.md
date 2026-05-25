# Sistema de Generación de Turnos LiMar

Proyecto desarrollado para el parcial práctico de Bases de Datos utilizando PostgreSQL, Docker y pgAdmin.

## Tecnologías utilizadas

* Docker
* PostgreSQL 14
* pgAdmin 4
* SQL
* Ubuntu Linux

## Descripción

Este proyecto implementa un sistema básico de generación de turnos para la empresa Servicios LiMar.

El sistema permite:

* Registrar usuarios
* Gestionar empleados
* Administrar servicios
* Generar turnos
* Enviar notificaciones
* Relacionar información mediante claves foráneas

## Contenedores utilizados

### PostgreSQL

```bash
sudo docker run -d --name postgres_bd \
-e POSTGRES_USER=ulimar \
-e POSTGRES_PASSWORD=ex4men_db \
-p 5432:5432 \
postgres:14
```

### pgAdmin

```bash
sudo docker run -d --name pgadmin \
-e PGADMIN_DEFAULT_EMAIL=usuario@servilimar.com \
-e PGADMIN_DEFAULT_PASSWORD="limar#123" \
-p 5050:80 \
dpage/pgadmin4
```

## Base de datos

Nombre de la base de datos:

```text
servilimar
```

## Funcionalidades implementadas

* Creación de tablas mediante DDL
* Inserción de registros mediante DML
* Relaciones entre tablas usando claves foráneas
* Consultas SQL utilizando JOIN

## Autor

Giovanny Mora

Universidad del Valle
