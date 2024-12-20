package Controller;

import Config.Conexion;
import Model.VentaModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class VentaController {

    Conexion conexion;
    Connection cn;
    PreparedStatement ps;
    ResultSet rs;

    String read = "SELECT * FROM VENTA";
    String create = "INSERT INTO VENTA (IDCLIENTE, IDUSUARIO, TIPO_COMPROBANTE, SERIE_COMPROBANTE, NUM_COMPROBANTE, FECHA_HORA, IMPUESTO, TOTAL, ESTADO) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

    public VentaModel generateVenta(VentaModel ventaModel) {
        VentaModel ventaCreada = null;
        try {
            conexion = new Conexion();
            cn = conexion.getConexion();
            ps = cn.prepareStatement(create, Statement.RETURN_GENERATED_KEYS);

            ventaModel.setIdUsuario(1);

            LocalDateTime fechaHoraActual = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
            String fechaHoraFormateada = fechaHoraActual.format(formatter);
            ventaModel.setFechaHora(fechaHoraFormateada);

            ventaModel.setEstado("CERRADA");

            ps.setInt(1, ventaModel.getIdCliente());
            ps.setInt(2, ventaModel.getIdUsuario());
            ps.setString(3, ventaModel.getTipoComprobante());
            ps.setString(4, ventaModel.getSerieComprobante());
            ps.setString(5, ventaModel.getNumComprobante());
            ps.setString(6, ventaModel.getFechaHora());
            ps.setString(7, ventaModel.getImpuesto());
            ps.setString(8, ventaModel.getTotal());
            ps.setString(9, ventaModel.getEstado());

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                // Obtener el ID generado de la venta
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int idVentaGenerado = generatedKeys.getInt(1);
                    ventaModel.setIdVenta(idVentaGenerado);

                    // Crear el objeto VentaModel con la venta creada
                    ventaCreada = new VentaModel(
                            ventaModel.getIdVenta(),
                            ventaModel.getIdCliente(),
                            ventaModel.getIdUsuario(),
                            ventaModel.getTipoComprobante(),
                            ventaModel.getSerieComprobante(),
                            ventaModel.getNumComprobante(),
                            ventaModel.getFechaHora(),
                            ventaModel.getImpuesto(),
                            ventaModel.getTotal(),
                            ventaModel.getEstado()
                    );
                }
            }

        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        
        System.out.println(ventaCreada);

        return ventaCreada;
    }
    
    public List<VentaModel> getAllVentas(){
        List<VentaModel> ventas = new ArrayList<>();
        try {
            conexion = new Conexion();
            cn = conexion.getConexion();
            ps = cn.prepareStatement(read);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                VentaModel ventaModel = new VentaModel();
                
                ventaModel.setIdVenta(rs.getInt(1));
                ventaModel.setIdCliente(rs.getInt(2));
                ventaModel.setIdUsuario(rs.getInt(3));
                ventaModel.setTipoComprobante(rs.getString(4));
                ventaModel.setSerieComprobante(rs.getString(5));
                ventaModel.setNumComprobante(rs.getString(6));
                ventaModel.setFechaHora(rs.getString(7));
                ventaModel.setImpuesto(rs.getString(8));
                ventaModel.setTotal(rs.getString(9));
                ventaModel.setEstado(rs.getString(10));
                
                ventas.add(ventaModel);
            }
            
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return ventas;
    }
}
