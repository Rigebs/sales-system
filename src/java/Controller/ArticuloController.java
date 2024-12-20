package Controller;

import Config.Conexion;
import Model.ArticuloModel;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ArticuloController {

    Conexion conexion;
    Connection cn;
    PreparedStatement ps;
    ResultSet rs;

    String read = "SELECT * FROM ARTICULO";
    String readById = "SELECT * FROM ARTICULO WHERE IDARTICULO = ?";

    String create = "INSERT INTO ARTICULO (IDCATEGORIA, CODIGO, NOMBRE, PRECIO_VENTA, STOCK, DESCRIPCION, ESTADO) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?)";

    String delete = "UPDATE ARTICULO SET ESTADO = 'NO DISPONIBLE' WHERE IDARTICULO = ?";

    String update = "UPDATE ARTICULO SET IDCATEGORIA = ?, CODIGO = ?, NOMBRE = ?, PRECIO_VENTA = ?, STOCK = ?, DESCRIPCION = ?, ESTADO = ? WHERE IDARTICULO = ?";

    public List<ArticuloModel> getAllArticulos() {
        List<ArticuloModel> articulos = new ArrayList<>();
        try {
            conexion = new Conexion();
            cn = conexion.getConexion();
            ps = cn.prepareStatement(read);

            rs = ps.executeQuery();
            System.out.println("R S: ");
            while (rs.next()) {
                ArticuloModel articuloModel = new ArticuloModel();
                articuloModel.setIdArticulo(rs.getInt(1));
                articuloModel.setIdCategoria(rs.getInt(2));
                articuloModel.setCodigo(rs.getString(3));
                articuloModel.setNomArticulo(rs.getString(4));
                articuloModel.setPrecioVenta(rs.getString(5));
                articuloModel.setStock(rs.getString(6));
                articuloModel.setDescripcion(rs.getString(7));
                articuloModel.setEstado(rs.getString(8));

                articulos.add(articuloModel);
            }

        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return articulos;
    }

    public ArticuloModel getArticuloById(int id) {
        ArticuloModel articuloModel = new ArticuloModel();
        try {
            conexion = new Conexion();
            cn = conexion.getConexion();
            ps = cn.prepareStatement(readById);

            rs = ps.executeQuery();

            articuloModel.setIdArticulo(rs.getInt(1));
            articuloModel.setIdCategoria(rs.getInt(2));
            articuloModel.setCodigo(rs.getString(3));
            articuloModel.setNomArticulo(rs.getString(4));
            articuloModel.setPrecioVenta(rs.getString(5));
            articuloModel.setStock(rs.getString(6));
            articuloModel.setDescripcion(rs.getString(7));
            articuloModel.setEstado(rs.getString(8));

        } catch (SQLException e) {
            System.out.println(e.toString());
        }

        return articuloModel;
    }

    public void createArticulo(ArticuloModel articuloModel) {
        try {
            conexion = new Conexion();
            cn = conexion.getConexion();
            ps = cn.prepareStatement(create);

            ps.setInt(1, articuloModel.getIdCategoria());
            ps.setString(2, articuloModel.getCodigo());
            ps.setString(3, articuloModel.getNomArticulo());
            ps.setString(4, articuloModel.getPrecioVenta());
            ps.setString(5, articuloModel.getStock());
            ps.setString(6, articuloModel.getDescripcion());
            ps.setString(7, articuloModel.getEstado());

            ps.execute();

        } catch (SQLException e) {
            System.out.println(e.toString());
        }
    }

    public void deleteArticulo(int id) {
        try {
            conexion = new Conexion();
            cn = conexion.getConexion();
            ps = cn.prepareStatement(delete);

            ps.setInt(1, id);

            ps.execute();

        } catch (SQLException e) {
            System.out.println(e.toString());
        }
    }

    public void editArticulo(ArticuloModel articuloModel) {
        try {
            conexion = new Conexion();
            cn = conexion.getConexion();
            ps = cn.prepareStatement(update);

            ps.setInt(1, articuloModel.getIdCategoria());
            ps.setString(2, articuloModel.getCodigo());
            ps.setString(3, articuloModel.getNomArticulo());
            ps.setString(4, articuloModel.getPrecioVenta());
            ps.setString(5, articuloModel.getStock());
            ps.setString(6, articuloModel.getDescripcion());
            ps.setString(7, articuloModel.getEstado());
            ps.setInt(8, articuloModel.getIdArticulo());

            ps.execute();

        } catch (SQLException e) {
            System.out.println(e.toString());
        }
    }
}
