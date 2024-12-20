package Model;

public class ArticuloModel {
    private int idArticulo;
    private int idCategoria;
    private String codigo;
    private String nomArticulo;
    private String precioVenta;
    private String stock;
    private String descripcion;
    private String estado;

    public ArticuloModel() {
    }

    public ArticuloModel(int idArticulo, int idCategoria, String codigo, String nomArticulo, String precioVenta, String stock, String descripcion, String estado) {
        this.idArticulo = idArticulo;
        this.idCategoria = idCategoria;
        this.codigo = codigo;
        this.nomArticulo = nomArticulo;
        this.precioVenta = precioVenta;
        this.stock = stock;
        this.descripcion = descripcion;
        this.estado = estado;
    }

    public int getIdArticulo() {
        return idArticulo;
    }

    public void setIdArticulo(int idArticulo) {
        this.idArticulo = idArticulo;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNomArticulo() {
        return nomArticulo;
    }

    public void setNomArticulo(String nomArticulo) {
        this.nomArticulo = nomArticulo;
    }

    public String getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(String precioVenta) {
        this.precioVenta = precioVenta;
    }

    public String getStock() {
        return stock;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "ArticuloModel{" + "idArticulo=" + idArticulo + ", idCategoria=" + idCategoria + ", codigo=" + codigo + ", nomArticulo=" + nomArticulo + ", precioVenta=" + precioVenta + ", stock=" + stock + ", descripcion=" + descripcion + ", estado=" + estado + '}';
    }
}
