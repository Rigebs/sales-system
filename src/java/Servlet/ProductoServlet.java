package Servlet;

import Controller.ArticuloController;
import Model.ArticuloModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductoServlet extends HttpServlet {

    ArticuloController articuloController;
    ArticuloModel articuloModel;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductoServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductoServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        articulosLista(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("editar".equals(action)) {
            articuloEditar(request, response);
        } else if ("eliminar".equals(action)) {
            articuloEliminar(request, response);
            System.out.println("QUEEEEEEE");
        } else {
            articuloCrear(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    public void articulosLista(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        articuloController = new ArticuloController();

        List<ArticuloModel> articulos = articuloController.getAllArticulos();
        request.setAttribute("articuloslista", articulos);
        request.getRequestDispatcher("/pages/Producto/producto.jsp").forward(request, response);
    }

    public void articuloCrear(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        articuloController = new ArticuloController();
        articuloModel = new ArticuloModel();

        articuloModel.setIdCategoria(1);
        articuloModel.setCodigo(request.getParameter("codigo"));
        articuloModel.setNomArticulo(request.getParameter("nomArticulo"));
        articuloModel.setPrecioVenta(request.getParameter("precioVenta"));
        articuloModel.setStock(request.getParameter("stock"));
        articuloModel.setDescripcion(request.getParameter("descripcion"));
        articuloModel.setEstado(request.getParameter("estado"));

        articuloController.createArticulo(articuloModel);

        response.sendRedirect(request.getContextPath() + "/ProductoServlet");
    }

    public void articuloEditar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        articuloController = new ArticuloController();
        articuloModel = new ArticuloModel();

        articuloModel.setIdArticulo(Integer.parseInt(request.getParameter("idArticulo")));
        articuloModel.setIdCategoria(1);
        articuloModel.setCodigo(request.getParameter("codigo"));
        articuloModel.setNomArticulo(request.getParameter("nomArticulo"));
        articuloModel.setPrecioVenta(request.getParameter("precioVenta"));
        articuloModel.setStock(request.getParameter("stock"));
        articuloModel.setDescripcion(request.getParameter("descripcion"));
        articuloModel.setEstado(request.getParameter("estado"));

        articuloController.editArticulo(articuloModel);

        response.sendRedirect(request.getContextPath() + "/ProductoServlet");
    }

    public void articuloEliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        articuloController = new ArticuloController();

        int id = Integer.parseInt(request.getParameter("idArticulo"));

        articuloController.deleteArticulo(id);

        response.sendRedirect(request.getContextPath() + "/ProductoServlet");
    }
}
