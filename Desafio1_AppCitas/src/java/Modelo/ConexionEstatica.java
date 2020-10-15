/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Auxiliar.Constantes;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author Mery
 */
public class ConexionEstatica {

    //********************* Atributos *************************
    private static java.sql.Connection Conex;
    //Atributo a través del cual hacemos la conexión física.
    private static java.sql.Statement Sentencia_SQL;
    //Atributo que nos permite ejecutar una sentencia SQL
    private static java.sql.ResultSet Conj_Registros;

    public static void nueva() {
        try {
            //Cargar el driver/controlador
            //String controlador = "com.mysql.jdbc.Driver";
            //String controlador = "com.mysql.cj.jdbc.Driver";
            //String controlador = "oracle.jdbc.driver.OracleDriver";
            //String controlador = "sun.jdbc.odbc.JdbcOdbcDriver"; 
            String controlador = "org.mariadb.jdbc.Driver"; // MariaDB la version libre de MySQL (requiere incluir la librería jar correspondiente).
            //Class.forName("org.mariadb.jdbc.Driver");              
            //Class.forName(controlador).newInstance();
            Class.forName(controlador);
            //Class.forName("com.mysql.jdbc.Driver"); 

            //String URL_BD = "jdbc:mysql://localhost:3306/" + Constantes.BBDD;
            //String URL_BD = "jdbc:mariadb://"+"localhost:3306"+"/"+Constantes.BBDD;
            //String URL_BD = "jdbc:oracle:oci:@REPASO";
            //String URL_BD = "jdbc:oracle:oci:@REPASO";
            //String URL_BD = "jdbc:odbc:REPASO";
            //String connectionString = "jdbc:mysql://localhost:3306/" + Constantes.BBDD + "?user=" + Constantes.usuario + "&password=" + Constantes.password + "&useUnicode=true&characterEncoding=UTF-8";
            //Realizamos la conexión a una BD con un usuario y una clave.
            //Conex = java.sql.DriverManager.getConnection(connectionString);
            //Conex = java.sql.DriverManager.getConnection(URL_BD, Constantes.usuario, Constantes.password);
            Conex = DriverManager.getConnection(
                    "jdbc:mariadb://localhost:3306/" + Constantes.BBDD, Constantes.usuario, Constantes.password);
            Sentencia_SQL = Conex.createStatement();
            System.out.println("Conexion realizada con éxito");
        } catch (Exception e) {
            System.err.println("Exception: " + e.getMessage());
        }
    }

    public static void cerrarBD() {
        try {
            // resultado.close();
            Conex.close();
            System.out.println("Desconectado de la Base de Datos"); // Opcional para seguridad
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error de Desconexion", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static Usuario existeUsuario(String email, String Clave) {
        Usuario existe = null;
        try {
            String sentencia = "SELECT * FROM " + Constantes.tabla_usuarios + " WHERE Email='" + email + "' AND "
                    + "Clave='" + Clave + "'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (ConexionEstatica.Conj_Registros.next()) {
                existe = new Usuario(Conj_Registros.getString("Email"), Conj_Registros.getString("Dni"), Conj_Registros.getString("Apodo"),
                        Conj_Registros.getString("Clave"), Conj_Registros.getString("Telefono"), Conj_Registros.getInt("Edad"), Conj_Registros.getBoolean("Activado"),
                        Conj_Registros.getBoolean("HaIniciado"));
                //Le añadimos el rol/es
                sentencia = "SELECT * FROM " + Constantes.tabla_roles + "," + Constantes.tabla_asignacion_roles
                        + " WHERE asignacionRol.Email = '" + email + "' AND roles.Id = asignacionRol.Id";
                ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
                while (Conj_Registros.next()) {
                    String rol = Conj_Registros.getString("roles.Descripcion");
                    existe.addRol(rol);
                }
            }
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return existe;//Si devolvemos null el usuario no existe.
    }

    /**
     * Usando una LinkedList.
     *
     * @return
     */
    public static LinkedList obtenerUsuarios() {
        LinkedList usuarios = new LinkedList<>();
        Usuario u = null;
        try {
            String sentencia = "SELECT * FROM " + Constantes.tabla_usuarios;
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                u = new Usuario(Conj_Registros.getString("Email"), Conj_Registros.getString("Dni"), Conj_Registros.getString("Apodo"),
                        Conj_Registros.getString("Clave"), Conj_Registros.getString("Telefono"), Conj_Registros.getInt("Edad"), Conj_Registros.getBoolean("Activado"),
                        Conj_Registros.getBoolean("HaIniciado"));
                //Le añadimos el rol/es
                /*
                LinkedList roles = ConexionEstatica.obtenerRolesUsuario(u.getEmail());
                for (int i = 0; i < roles.size(); i++) {
                    String rol = (String) roles.get(i);
                    u.addRol(rol);
                }
                 */
                //Añadimos usuario a la LK
                usuarios.add(u);
            }
        } catch (SQLException ex) {
        }
        return usuarios;
    }

    public static LinkedList obtenerRolesUsuario(String email) {
        LinkedList roles = new LinkedList();
        try {
            String sentencia = "SELECT * FROM " + Constantes.tabla_roles + "," + Constantes.tabla_asignacion_roles
                    + " WHERE asignacionRol.Email = '" + email + "' AND roles.Id = asignacionRol.Id";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                String rol = Conj_Registros.getString("Descripcion");
                roles.add(rol);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConexionEstatica.class.getName()).log(Level.SEVERE, null, ex);
        }
        return roles;

    }

    public static boolean insertarUsuario(Usuario u) {
        boolean correcto = false;
        try {
            String sentencia = "INSERT INTO " + Constantes.tabla_usuarios + " VALUES('" + u.getEmail() + "','" + u.getDni() + "','" + u.getApodo() + "','" + u.getClave()
                    + "','" + u.getTelefono() + "'," + u.getEdad() + "," + u.isActivado() + "," + u.isHaIniciado() + ")";
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);
            sentencia = "INSERT INTO " + Constantes.tabla_asignacion_roles + " VALUES('" + u.getEmail() + "',0)";
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);

            correcto = true;
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return correcto;
    }
}
