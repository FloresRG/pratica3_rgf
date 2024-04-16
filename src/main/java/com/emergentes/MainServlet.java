
package com.emergentes;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     String op = request.getParameter("op");
        Estudiante objest = new Estudiante();
        int id, pos;
        HttpSession ses = request.getSession();
        ArrayList<Estudiante> lista = (ArrayList<Estudiante>) ses.getAttribute("listaest");
        switch (op) {
            case "nuevo":
                //Enviar un objeto vacio a editar
                request.setAttribute("miobjest", objest);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "editar":
                // Enviar un objeto a editar pero con contenido
                id = Integer.parseInt(request.getParameter("id"));
                // Averiguar la posición del elemento en la lista
                pos = buscarPorIndice(request, id);
                // Obtener el objeto
                objest = lista.get(pos);
                request.setAttribute("miobjest", objest);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "eliminar":
                // Eliminar el registro de la colección segun el id
                id = Integer.parseInt(request.getParameter("id"));
                 // Averiguar la posición del elemento en la lista
                pos = buscarPorIndice(request, id);
                if (pos >= 0) {
                    lista.remove(pos);
                }
                request.setAttribute("listaper", lista);
                response.sendRedirect("index.jsp");
                break;
            default:

        }
    }
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          int id = Integer.parseInt(request.getParameter("id"));
    HttpSession ses = request.getSession();
    ArrayList<Estudiante> lista = (ArrayList<Estudiante>) ses.getAttribute("listaest");
    Estudiante objest;
    
    // Verificar si el objeto existe en la lista o es uno nuevo
    if (id != 0) {
        // Si es un objeto existente, buscarlo en la lista
        int pos = buscarPorIndice(request, id);
        objest = lista.get(pos);
    } else {
        // Si es un nuevo objeto, crear uno nuevo
        objest = new Estudiante();
        // Asignar un nuevo id
        id = obtenerId(request);
        objest.setId(id);
        // Agregar el objeto a la lista
        lista.add(objest);
    }
    
    // Actualizar los atributos del objeto
    objest.setFecha(request.getParameter("fecha"));
    objest.setNombre(request.getParameter("nombre"));
    objest.setApellidos(request.getParameter("apellidos"));
    objest.setTurno(request.getParameter("turno"));
    // Obtener los valores seleccionados de los checkboxes de seminario
String[] seminarioValues = request.getParameterValues("seminario");

// Verificar si hay valores seleccionados
if (seminarioValues != null && seminarioValues.length > 0) {
    // Concatenar los valores de seminario con comas
    StringBuilder seminarioConcatenado = new StringBuilder();
    for (int i = 0; i < seminarioValues.length; i++) {
        seminarioConcatenado.append(seminarioValues[i]);
        if (i < seminarioValues.length - 1) {
            seminarioConcatenado.append(", ");
        }
    }
    // Establecer los valores concatenados en el objeto Estudiante
    objest.setSeminario(seminarioConcatenado.toString());
} else {
    // Si no se selecciona ningún curso, establecer un mensaje vacío o predeterminado
    objest.setSeminario("");
}

    
    // Redireccionar a la página principal
    response.sendRedirect("index.jsp");
    }

    
    public int buscarPorIndice(HttpServletRequest request, int id) {
        HttpSession ses = request.getSession();
        ArrayList<Estudiante> lista = (ArrayList<Estudiante>) ses.getAttribute("listaest");
        int pos = -1;
        if (lista != null) {
            for (Estudiante est : lista) {
                ++pos;
                if (est.getId() == id) {
                    break;
                }
            }
        }
        return pos;
    }
    public int obtenerId(HttpServletRequest request) {
        HttpSession ses = request.getSession();
        ArrayList<Estudiante> lista = (ArrayList<Estudiante>) ses.getAttribute("listaest");
// Buscar el ultimo id
        int idn = 0;
        for (Estudiante est : lista) {
            idn = est.getId();
        }
        return idn + 1;
    }
}
