package Model;

public class VentaModel {  
    private int idVenta;
    private int idCliente;
    private int idUsuario;
    private String tipoComprobante;
    private String serieComprobante;
    private String numComprobante;
    private String fechaHora;
    private String impuesto;
    private String total;
    private String estado;

    public VentaModel() {
    }

    public VentaModel(int idVenta, int idCliente, int idUsuario, String tipoComprobante, String serieComprobante, String numComprobante, String fechaHora, String impuesto, String total, String estado) {
        this.idVenta = idVenta;
        this.idCliente = idCliente;
        this.idUsuario = idUsuario;
        this.tipoComprobante = tipoComprobante;
        this.serieComprobante = serieComprobante;
        this.numComprobante = numComprobante;
        this.fechaHora = fechaHora;
        this.impuesto = impuesto;
        this.total = total;
        this.estado = estado;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getTipoComprobante() {
        return tipoComprobante;
    }

    public void setTipoComprobante(String tipoComprobante) {
        this.tipoComprobante = tipoComprobante;
    }

    public String getSerieComprobante() {
        return serieComprobante;
    }

    public void setSerieComprobante(String serieComprobante) {
        this.serieComprobante = serieComprobante;
    }

    public String getNumComprobante() {
        return numComprobante;
    }

    public void setNumComprobante(String numComprobante) {
        this.numComprobante = numComprobante;
    }

    public String getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(String fechaHora) {
        this.fechaHora = fechaHora;
    }

    public String getImpuesto() {
        return impuesto;
    }

    public void setImpuesto(String impuesto) {
        this.impuesto = impuesto;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "VentaModel{" + "idVenta=" + idVenta + ", idCliente=" + idCliente + ", idUsuario=" + idUsuario + ", tipoComprobante=" + tipoComprobante + ", serieComprobante=" + serieComprobante + ", numComprobante=" + numComprobante + ", fechaHora=" + fechaHora + ", impuesto=" + impuesto + ", total=" + total + ", estado=" + estado + '}';
    }
    
    
}
