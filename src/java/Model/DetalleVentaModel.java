package Model;

public class DetalleVentaModel {
    private int idDetalleVenta;
    private int idVenta;
    private int idArticulo;
    private int cantidad;
    private String precio;
    private String descuento;

    public DetalleVentaModel() {
    }

    public DetalleVentaModel(int idDetalleVenta, int idVenta, int idArticulo, int cantidad, String precio, String descuento) {
        this.idDetalleVenta = idDetalleVenta;
        this.idVenta = idVenta;
        this.idArticulo = idArticulo;
        this.cantidad = cantidad;
        this.precio = precio;
        this.descuento = descuento;
    }

    public int getIdDetalleVenta() {
        return idDetalleVenta;
    }

    public void setIdDetalleVenta(int idDetalleVenta) {
        this.idDetalleVenta = idDetalleVenta;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public int getIdArticulo() {
        return idArticulo;
    }

    public void setIdArticulo(int idArticulo) {
        this.idArticulo = idArticulo;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getPrecio() {
        return precio;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }

    public String getDescuento() {
        return descuento;
    }

    public void setDescuento(String descuento) {
        this.descuento = descuento;
    }
}
