package Servlet;

import Controller.ArticuloController;
import Controller.DetalleVentaController;
import Controller.PersonaController;
import Controller.VentaController;
import Model.ArticuloModel;
import Model.DetalleVentaModel;
import Model.PersonaModel;
import Model.VentaModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VentaServlet extends HttpServlet {

    ArticuloController articuloController;

    VentaController ventaController;
    VentaModel ventaModel;

    DetalleVentaController detalleVentaController;
    DetalleVentaModel detalleVentaModel;

    PersonaController personaController;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VentaServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VentaServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        traerListaArticulos(request, response);

        traerListaClientes(request, response);

        interfazVenta(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idVenta = ventaRealizar(request, response);
        guardarDetalle(request, response, idVenta);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void interfazVenta(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/pages/Venta/venta.jsp").forward(request, response);
    }

    public int ventaRealizar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ventaController = new VentaController();
        ventaModel = new VentaModel();

        VentaModel venta;

        ventaModel.setIdCliente(Integer.parseInt(request.getParameter("idCliente")));
        ventaModel.setTipoComprobante(request.getParameter("tipoComprobante"));
        ventaModel.setSerieComprobante(request.getParameter("serieComprobante"));
        ventaModel.setNumComprobante(request.getParameter("numComprobante"));
        ventaModel.setImpuesto(request.getParameter("impuesto"));
        ventaModel.setTotal(request.getParameter("total"));

        venta = ventaController.generateVenta(ventaModel);

        int id = venta.getIdVenta();

        return id;
    }

    public void guardarDetalle(HttpServletRequest request, HttpServletResponse response, int idVenta)
            throws ServletException, IOException {
        String[] idArticulo = request.getParameterValues("idArticulo[]");
        String[] cantidad = request.getParameterValues("cantidad[]");
        String[] precio = request.getParameterValues("precio[]");

        for (int i = 0; i < idArticulo.length; i++) {

            detalleVentaController = new DetalleVentaController();
            detalleVentaModel = new DetalleVentaModel();

            detalleVentaModel.setIdVenta(idVenta);
            detalleVentaModel.setIdArticulo(Integer.parseInt(idArticulo[i]));
            detalleVentaModel.setCantidad(Integer.parseInt(cantidad[i]));
            detalleVentaModel.setPrecio(precio[i]);
            detalleVentaModel.setDescuento("0");

            detalleVentaController.generateDetalle(detalleVentaModel);
            System.out.println("detalle: "+detalleVentaModel);
        }
        response.sendRedirect(request.getContextPath() + "/VentaServlet");
    }

    public void traerListaArticulos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        articuloController = new ArticuloController();

        List<ArticuloModel> articulos = articuloController.getAllArticulos();
        request.setAttribute("articuloslista", articulos);
    }

    public void traerListaClientes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        personaController = new PersonaController();

        List<PersonaModel> personas = personaController.getAllPersonas();
        request.setAttribute("personaslista", personas);
    }

}
