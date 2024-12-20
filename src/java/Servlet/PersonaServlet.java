package Servlet;

import Controller.PersonaController;
import Model.PersonaModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PersonaServlet extends HttpServlet {

    PersonaController personaController;

    PersonaModel personaModel;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PersonaServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PersonaServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        personasLista(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("editar".equals(action)) {
            personaEditar(request, response);
        } else if ("eliminar".equals(action)) {
            personaEliminar(request, response);
        } else {
            personaCrear(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void personasLista(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        personaController = new PersonaController();

        List<PersonaModel> personas = personaController.getAllPersonas();
        request.setAttribute("personaslista", personas);
        request.getRequestDispatcher("/pages/Persona/persona.jsp").forward(request, response);
    }

    public void traerPersona(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        personaController = new PersonaController();

        personaModel = new PersonaModel();
    }

    public void personaCrear(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        personaController = new PersonaController();
        personaModel = new PersonaModel();

        personaModel.setTipoPersona(request.getParameter("tipoPersona"));
        personaModel.setNomPersona(request.getParameter("nomPersona"));
        personaModel.setTipoDocumento(request.getParameter("tipoDocumento"));
        personaModel.setNumDocumento(request.getParameter("numDocumento"));
        personaModel.setDireccion(request.getParameter("direccion"));
        personaModel.setTelefono(request.getParameter("telefono"));
        personaModel.setEmail(request.getParameter("email"));

        personaController.createPersona(personaModel);

        response.sendRedirect(request.getContextPath() + "/PersonaServlet");
    }

    public void personaEditar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        personaController = new PersonaController();
        personaModel = new PersonaModel();

        personaModel.setIdPersona(Integer.parseInt(request.getParameter("idPersona")));
        personaModel.setTipoPersona(request.getParameter("tipoPersona"));
        personaModel.setNomPersona(request.getParameter("nomPersona"));
        personaModel.setTipoDocumento(request.getParameter("tipoDocumento"));
        personaModel.setNumDocumento(request.getParameter("numDocumento"));
        personaModel.setDireccion(request.getParameter("direccion"));
        personaModel.setTelefono(request.getParameter("telefono"));
        personaModel.setEmail(request.getParameter("email"));

        personaController.editPersona(personaModel);

        response.sendRedirect(request.getContextPath() + "/PersonaServlet");
    }
    
     public void personaEliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        personaController = new PersonaController();

        int id = Integer.parseInt(request.getParameter("idPersona"));

        personaController.deletePersona(id);

        response.sendRedirect(request.getContextPath() + "/PersonaServlet");
    }
}
