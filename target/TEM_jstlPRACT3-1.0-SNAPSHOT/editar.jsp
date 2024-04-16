

<%@page import="com.emergentes.Estudiante"%>
<%
    Estudiante est = (Estudiante) request.getAttribute("miobjest");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function cambiarTextoEncabezado() {
        document.getElementById("tituloRegistro").innerText = "EDITAR REGISTRO";
    }
            
        </script>
  <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .encabezado {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 20px 0;
        }

        .encabezado h1 {
            margin: 0;
        }

        .contenedor {
            display: flex;
            justify-content: space-around;
            padding: 20px;
        }

        .cuadro {
            background-color: #fff;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .cuadro h3 {
            margin-top: 0;
        }

        input[type="text"],
        input[type="date"],
        input[type="radio"],
        input[type="checkbox"],
        button {
            margin-bottom: 10px;
        }

        button {
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #555;
        }
    </style>
    </head>
    <body>
        <div class="encabezado">
            <h1>REGISTRO DE SEMINARIO</h1>
        </div>

        <h2 id="tituloRegistro" ><span style="font-weight: bold;">NUEVO REGISTRO</span></h2>


        <div class="contenedor">
            <div class="cuadro">
                <h3>Datos Personales</h3>
                <form action="MainServlet" method="post"  onsubmit="return validarCampos()">
                    <input type="hidden" name="id" value="<%= est.getId()%>">
                    <table>
                        <tr>
                            <td>Fecha</td>
                            <td><input type="date" name="fecha" value="<%= est.getFecha()%>"></td>
                        </tr>
                        <tr>
                            <td>Nombre</td>
                            <td><input type="text" name="nombre" value="<%= est.getNombre()%>" ></td>
                        </tr>
                        <tr>
                            <td>Apellidos</td>
                            <td><input type="text" name="apellidos"  value="<%= est.getApellidos()%>" ></td>
                        </tr>
                        <tr>
                            <td>Turno</td>
                            <td>
                                   <input type="radio" name="turno" value="mañana" <% if (est.getTurno().equals("mañana")) {
                                           out.print("checked");
                                       } %>> Mañana
                                       <input type="radio" name="turno" value="tarde" <% if (est.getTurno().equals("tarde")) {
                                               out.print("checked");
                                           } %>> Tarde
                                       <input type="radio" name="turno" value="noche" <% if (est.getTurno().equals("noche")) {
                                               out.print("checked");
                                           } %>> Noche
                            </td>
                        </tr>
                    </table>
            </div>

            <div class="cuadro">
                <h3>Seminarios</h3>
                <table>
                    <tr>
                        <td>
                               <input type="checkbox" name="seminario" value="Inteligencia Artificial" <% if (est.getSeminario().equals("Inteligencia Artificial")) {
                                    out.print("checked");
                                } %>> Inteligencia Artificial <br>
                                   <input type="checkbox" name="seminario" value="Machine Learning" <% if (est.getSeminario().equals("Machine Learning")) {
                                    out.print("checked");
                                } %>> Machine Learning <br>
                                   <input type="checkbox" name="seminario" value="Simulación con Arena" <% if (est.getSeminario().equals("Simulación con Arena")) {
                                    out.print("checked");
                                } %>> Simulación con Arena <br>
                                   <input type="checkbox" name="seminario" value="Robótica Educativa" <% if (est.getSeminario().equals("Robótica Educativa")) {
                                    out.print("checked");
                                }%>> Robótica Educativa <br>
                        </td>
                    </tr>
                </table>
            </div>
        </div>


        <h1></h1>
        <button href="MainServlet?op=enviar" type="submit" onclick="return validarCampos()">Enviar Reguistro</button>
    </form>
    <script>
        function validarCampos() {
            // Obtener los valores de los campos
            var fecha = document.getElementsByName("fecha")[0].value.trim();
            var nombre = document.getElementsByName("nombre")[0].value.trim();
            var apellidos = document.getElementsByName("apellidos")[0].value.trim();
            var turno = document.querySelector('input[name="turno"]:checked');
            var seminarios = document.querySelectorAll('input[name="seminario"]:checked');

            // Verificar si algún campo está vacío
            if (fecha === "" || nombre === "" || apellidos === "" || turno === null || seminarios.length === 0) {
                alert("Error: Todos los campos deben ser llenados.");
                return false; // Evitar el envío del formulario
            }

            // Si todos los campos están llenos, permitir el envío del formulario
            return true;
        }
         

    </script>                 

</body>
</html>
