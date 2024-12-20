package Controller;

import Config.Conexion;
import Model.DetalleVentaModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DetalleVentaController {
    Conexion conexion;
    Connection cn;
    PreparedStatement ps;
    ResultSet rs;

    String read = "SELECT * FROM DETALLE_VENTA";
    String create = "INSERT INTO DETALLE_VENTA (IDVENTA, IDARTICULO, CANTIDAD, PRECIO, DESCUENTO) "
            + "VALUES (?, ?, ?, ?, ?)";

    public void generateDetalle(DetalleVentaModel detalleVentaModel) {
        try {
            conexion = new Conexion();
            cn = conexion.getConexion();
            ps = cn.prepareStatement(create);

            ps.setInt(1, detalleVentaModel.getIdVenta());
            ps.setInt(2, detalleVentaModel.getIdArticulo());
            ps.setInt(3, detalleVentaModel.getCantidad());
            ps.setString(4, detalleVentaModel.getPrecio());
            ps.setString(5, detalleVentaModel.getDescuento());
            
            ps.execute();
            
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
    }
}
