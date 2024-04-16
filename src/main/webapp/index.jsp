<%@page import="com.emergentes.Estudiante"%>
<%@page import="java.util.ArrayList" %>
<%
    if (session.getAttribute("listaest") == null) {
        ArrayList<Estudiante> lisaux = new ArrayList<Estudiante>();
        session.setAttribute("listaest", lisaux);
    }
    ArrayList<Estudiante> lista = (ArrayList<Estudiante>) session.getAttribute("listaest");
%>      

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registro de Seminario</title>
    <style>
        body {
            font-family: Arial, sans-serif; /* Fuente genérica para todo el cuerpo */
            text-align: center;
            background-color: #f9f9f9; /* Color de fondo */
            margin: 0; /* Elimina el margen predeterminado */
            padding: 0; /* Elimina el relleno predeterminado */
            color: #333; /* Color de texto general */
        }

        .tabla-container {
            margin: 20px auto;
            width: 80%;
            overflow-x: auto; /* Habilita la barra de desplazamiento horizontal si es necesario */
        }

        .tabla {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #ddd;
            background-color: #fff;
        }

        .tabla th, .tabla td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            font-weight: normal; /* Restaura el peso de la fuente */
        }

        .tabla th {
            background-color: #f2f2f2;
            font-weight: bold;
            color: #333; /* Color de texto del encabezado */
        }

        .tabla td {
            font-size: 14px;
        }

        .tabla a {
            text-decoration: none;
            color: #007bff; /* Color del enlace */
            font-weight: bold;
            transition: color 0.3s;
        }

        .tabla a:hover {
            color: #0056b3; /* Cambia el color del enlace al pasar el cursor */
        }

        @keyframes slideInFromLeft {
            0% {
                transform: translateX(-100%);
                opacity: 0;
            }
            100% {
                transform: translateX(0);
                opacity: 1;
            }
        }

        .tabla-container {
            animation: slideInFromLeft 0.5s ease-in-out; /* Aplica la animación a la tabla */
        }
        
        .contenedor-botones {
            text-align: left; /* Para alinear los botones hacia la derecha */
            margin-left: 120px;
        }
    </style>
</head>
<body>
    <div class="encabezado">
    <h1>Lista de Registros</h1>
</div>

<div class="contenedor-botones">
    <button onclick="window.location.href = 'MainServlet?op=nuevo'">Nuevo registro</button>
</div>
<div class="tabla-container">
    
    <table class="tabla">
        <thead>
        <tr>
            <th>ID</th>
            <th>Fecha</th>
            <th>Nombres</th>
            <th>Apellidos</th>
            <th>Turno</th>
            <th>Seminario</th>
            <th>Editar Estudiante</th>
            <th>Eliminar Estudiante</th>
        </tr>
        </thead>
        <tbody>
        <% if (lista != null) {
        for (Estudiante item : lista) { %>
        <tr>
            <td><%= item.getId() %></td>
            <td><%= item.getFecha() %></td>
            <td><%= item.getNombre() %></td>
            <td><%= item.getApellidos() %></td>
            <td><%= item.getTurno() %></td>
            <td><%= item.getSeminario() %></td>

            <td>
                <a href="MainServlet?op=editar&id=<%= item.getId() %>" onclick="cambiarTextoEncabezado()">Editar</a>
            </td>
            <td>
                <a href="MainServlet?op=eliminar&id=<%= item.getId() %>"
                   onclick="return (confirm('¿Estás seguro de eliminar?'))">Eliminar</a>
            </td>
        </tr>
        <% }
        } %>
        </tbody>
    </table>
</div>
</body>
</html>
