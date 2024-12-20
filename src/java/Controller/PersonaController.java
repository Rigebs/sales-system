package Controller;

import Config.Conexion;
import Model.PersonaModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PersonaController {
    Conexion conexion;
    Connection cn;
    PreparedStatement ps;
    ResultSet rs;
    
    String read = "SELECT * FROM PERSONA";
    String create = "INSERT INTO PERSONA (TIPO_PERSONA, NOMBRE, TIPO_DOCUMENTO, NUM_DOCUMENTO, DIRECCION, TELEFONO, EMAIL) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?)";
    
    String delete = "DELETE FROM PERSONA WHERE IDPERSONA = ?";
    
    String update = "UPDATE PERSONA SET TIPO_PERSONA = ?, NOMBRE = ?, TIPO_DOCUMENTO = ?, NUM_DOCUMENTO = ?, DIRECCION = ?, TELEFONO = ?, EMAIL = ? WHERE IDPERSONA = ?";
    
    public List<PersonaModel> getAllPersonas(){
        List<PersonaModel> personas = new ArrayList<>();
        try {
            conexion = new Conexion();
            cn = conexion.getConexion();
            ps = cn.prepareStatement(read);
            
            rs = ps.executeQuery();
            while(rs.next()){
                PersonaModel personaModel = new PersonaModel();
                personaModel.setIdPersona(rs.getInt(1));
                personaModel.setTipoPersona(rs.getString(2));
                personaModel.setNomPersona(rs.getString(3));
                personaModel.setTipoDocumento(rs.getString(4));
                personaModel.setNumDocumento(rs.getString(5));
                personaModel.setDireccion(rs.getString(6));
                personaModel.setTelefono(rs.getString(7));
                personaModel.setEmail(rs.getString(8));
                
                personas.add(personaModel);
            }
            
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return personas;
    }
    
    public void createPersona(PersonaModel personaModel){
        try {
            conexion = new Conexion();
            cn = conexion.getConexion();
            ps = cn.prepareStatement(create);
            
            ps.setString(1, personaModel.getTipoPersona());
            ps.setString(2, personaModel.getNomPersona());
            ps.setString(3, personaModel.getTipoDocumento());
            ps.setString(4, personaModel.getNumDocumento());
            ps.setString(5, personaModel.getDireccion());
            ps.setString(6, personaModel.getTelefono());
            ps.setString(7, personaModel.getEmail());
            
            ps.execute();
            
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
    }
    
    public void deletePersona(int id){
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
    
    public void editPersona(PersonaModel personaModel){
        try {
            conexion = new Conexion();
            cn = conexion.getConexion();
            ps = cn.prepareStatement(update);
            
            ps.setString(1, personaModel.getTipoPersona());
            ps.setString(2, personaModel.getNomPersona());
            ps.setString(3, personaModel.getTipoDocumento());
            ps.setString(4, personaModel.getNumDocumento());
            ps.setString(5, personaModel.getDireccion());
            ps.setString(6, personaModel.getTelefono());
            ps.setString(7, personaModel.getEmail());
            ps.setInt(8, personaModel.getIdPersona());
            
            ps.execute();
            
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
    }
}
