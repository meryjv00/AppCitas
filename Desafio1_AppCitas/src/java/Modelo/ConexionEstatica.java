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
                        + " WHERE asignacionrol.Email = '" + email + "' AND roles.Id = asignacionrol.Id";
                ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
                while (Conj_Registros.next()) {
                    String rol = Conj_Registros.getString("roles.Descripcion");
                    existe.addRol(rol);
                }
                //Le añadimos las preferencias
                if (existe.isHaIniciado()) {
                    Object preferencias[] = (Object[]) obtenerPreferenciasUsuario(existe);
                    existe.setRelacion((String) preferencias[0]);
                    existe.setDeporte((int) preferencias[1]);
                    existe.setArte((int) preferencias[2]);
                    existe.setPolitica((int) preferencias[3]);
                    existe.setTieneHijos((boolean) preferencias[4]);
                    existe.setQuiereHijos((boolean) preferencias[5]);
                    existe.setInteresMujeres((boolean) preferencias[6]);
                    existe.setInteresHombres((boolean) preferencias[7]);
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
                    + " WHERE asignacionrol.Email = '" + email + "' AND roles.Id = asignacionrol.Id";
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

    public static Object obtenerPreferenciasUsuario(Usuario u) {
        String sentencia = "";
        Object preferencias[] = new Object[8];
        //Add relacion
        try {
            sentencia = "SELECT valoracion FROM " + Constantes.tabla_asignacion_preferencias + " WHERE Email='" + u.getEmail() + "' AND IdPref=1";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (Conj_Registros.next()) {
                String relacion = Conj_Registros.getString("Valoracion");
                preferencias[0] = relacion;
            }
            //Add deporte
            sentencia = "SELECT valoracion FROM " + Constantes.tabla_asignacion_preferencias + " WHERE Email='" + u.getEmail() + "' AND idPref=2";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (Conj_Registros.next()) {
                int deporte = Integer.parseInt(Conj_Registros.getString("Valoracion"));
                preferencias[1] = deporte;
            }
            //Add arte
            sentencia = "SELECT valoracion FROM " + Constantes.tabla_asignacion_preferencias + " WHERE Email='" + u.getEmail() + "' AND idPref=3";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (Conj_Registros.next()) {
                int arte = Integer.parseInt(Conj_Registros.getString("Valoracion"));
                preferencias[2] = arte;
            }
            //Add politica
            sentencia = "SELECT valoracion FROM " + Constantes.tabla_asignacion_preferencias + " WHERE Email='" + u.getEmail() + "' AND idPref=4";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (Conj_Registros.next()) {
                int politica = Integer.parseInt(Conj_Registros.getString("Valoracion"));
                preferencias[3] = politica;
            }
            //Add tiene hijos
            sentencia = "SELECT valoracion FROM " + Constantes.tabla_asignacion_preferencias + " WHERE Email='" + u.getEmail() + "' AND idPref=5";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (Conj_Registros.next()) {
                boolean tieneHijos = Boolean.parseBoolean(Conj_Registros.getString("Valoracion"));
                preferencias[4] = tieneHijos;
            }
            //Add quiere hijos
            sentencia = "SELECT valoracion FROM " + Constantes.tabla_asignacion_preferencias + " WHERE Email='" + u.getEmail() + "' AND idPref=6";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (Conj_Registros.next()) {
                boolean quiereHijos = Boolean.parseBoolean(Conj_Registros.getString("Valoracion"));
                preferencias[5] = quiereHijos;
            }
            //Add interes mujeres
            sentencia = "SELECT valoracion FROM " + Constantes.tabla_asignacion_preferencias + " WHERE Email='" + u.getEmail() + "' AND idPref=7";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (Conj_Registros.next()) {
                boolean interesMujeres = Boolean.parseBoolean(Conj_Registros.getString("Valoracion"));
                preferencias[6] = interesMujeres;
            }
            //Add interes hombres
            sentencia = "SELECT valoracion FROM " + Constantes.tabla_asignacion_preferencias + " WHERE Email='" + u.getEmail() + "' AND idPref=8";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (Conj_Registros.next()) {
                boolean interesHombres = Boolean.parseBoolean(Conj_Registros.getString("Valoracion"));
                preferencias[7] = interesHombres;
            }
        } catch (SQLException ex) {
        }
        return preferencias;
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

    public static boolean insertarAdmin(Usuario u) {
        boolean correcto = false;
        try {
            String sentencia = "INSERT INTO " + Constantes.tabla_usuarios + " VALUES('" + u.getEmail() + "','" + u.getDni() + "','" + u.getApodo() + "','" + u.getClave()
                    + "','" + u.getTelefono() + "'," + u.getEdad() + "," + u.isActivado() + "," + u.isHaIniciado() + ")";
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);
            sentencia = "INSERT INTO " + Constantes.tabla_asignacion_roles + " VALUES('" + u.getEmail() + "',1)";
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);
            sentencia = "INSERT INTO " + Constantes.tabla_asignacion_roles + " VALUES('" + u.getEmail() + "',0)";
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);

            correcto = true;
        } catch (SQLException ex) {
            System.out.println("Error en el acceso a la BD.");
        }
        return correcto;
    }

    public static boolean eliminarUsuario(Usuario u) {
        boolean correcto = false;
        try {
            String Sentencia = "DELETE FROM " + Constantes.tabla_usuarios + " WHERE Email = '" + u.getEmail() + "'";
            ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
            //Borrar de + sitios
            Sentencia = "DELETE FROM " + Constantes.tabla_asignacion_roles + " WHERE Email = '" + u.getEmail() + "'";
            ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
            correcto = true;
        } catch (SQLException ex) {
        }
        return correcto;
    }

    public static void editarUsuario(Usuario u) {
        try {
            String sentencia = "UPDATE " + Constantes.tabla_usuarios + " set Activado = " + u.isActivado() + " WHERE Email = '" + u.getEmail() + "'";
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);

        } catch (SQLException ex) {
        }
    }

    public static void hacerAdmin(Usuario u) {
        try {
            String sentencia = "INSERT INTO " + Constantes.tabla_asignacion_roles + " VALUES('" + u.getEmail() + "',1)";
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);

        } catch (SQLException ex) {
        }
    }

    public static boolean esAdmin(Usuario u) {
        boolean esAdmin = false;
        try {
            String sentencia = "SELECT * FROM " + Constantes.tabla_asignacion_roles + " WHERE Email = '" + u.getEmail() + "' AND id=1";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (Conj_Registros.next()) {
                esAdmin = true;
            }

        } catch (SQLException ex) {
        }
        return esAdmin;
    }

    public static void quitarAdmin(Usuario u) {
        try {
            String Sentencia = "DELETE FROM " + Constantes.tabla_asignacion_roles + " WHERE Email = '" + u.getEmail() + "' and id=1";
            ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
        } catch (SQLException ex) {
        }

    }

    public static void encuestaRealizada(Usuario u) {
        try {
            String Sentencia = "UPDATE " + Constantes.tabla_usuarios + " SET HaIniciado = true WHERE Email = '" + u.getEmail() + "'";
            ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);
        } catch (SQLException ex) {
        }
    }

    public static void rellenarPreferencias(Usuario u) {
        try {
            String Sentencia = "INSERT INTO " + Constantes.tabla_asignacion_preferencias + " VALUES('" + u.getEmail() + "',1,'" + u.getRelacion() + "')";
            ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);

            Sentencia = "INSERT INTO " + Constantes.tabla_asignacion_preferencias + " VALUES('" + u.getEmail() + "',2,'" + u.getDeporte() + "')";
            ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);

            Sentencia = "INSERT INTO " + Constantes.tabla_asignacion_preferencias + " VALUES('" + u.getEmail() + "',3,'" + u.getArte() + "')";
            ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);

            Sentencia = "INSERT INTO " + Constantes.tabla_asignacion_preferencias + " VALUES('" + u.getEmail() + "',4,'" + u.getPolitica() + "')";
            ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);

            Sentencia = "INSERT INTO " + Constantes.tabla_asignacion_preferencias + " VALUES('" + u.getEmail() + "',5,'" + u.isTieneHijos() + "')";
            ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);

            Sentencia = "INSERT INTO " + Constantes.tabla_asignacion_preferencias + " VALUES('" + u.getEmail() + "',6,'" + u.isQuiereHijos() + "')";
            ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);

            Sentencia = "INSERT INTO " + Constantes.tabla_asignacion_preferencias + " VALUES('" + u.getEmail() + "',7,'" + u.isInteresMujeres() + "')";
            ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);

            Sentencia = "INSERT INTO " + Constantes.tabla_asignacion_preferencias + " VALUES('" + u.getEmail() + "',8,'" + u.isInteresHombres() + "')";
            ConexionEstatica.Sentencia_SQL.executeUpdate(Sentencia);

        } catch (SQLException ex) {
        }
    }

    public static void modificarClave(String email, int az) {
        try {
            String sentencia = "UPDATE " + Constantes.tabla_usuarios + " SET Clave='" + az + "' WHERE Email like '" + email + "'";
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);
        } catch (SQLException ex) {
        }

    }

    public static void meGusta(String emailmio, String emailusu) {
        try {
            String sentencia = "INSERT INTO " + Constantes.tabla_amigos + " VALUES('" + emailmio + "','" + emailusu + "')";
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);

        } catch (SQLException ex) {
        }
    }

    public static void noMeGusta(String emailmio, String emailusu) {
        try {
            String sentencia = "DELETE FROM " + Constantes.tabla_amigos + " WHERE Email1 like '" + emailmio + "' AND Email2 like '" + emailusu + "'";
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);
        } catch (SQLException ex) {
        }
    }

    public static boolean comprobarMeGusta(String emailmio, String emailusu) {
        boolean amigos = false;
        try {
            String sentencia = "SELECT * FROM " + Constantes.tabla_amigos + " WHERE Email1 = '" + emailmio + "' AND Email2 = '" + emailusu + "'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (Conj_Registros.next()) {
                amigos = true;
            }
        } catch (SQLException ex) {
        }
        return amigos;
    }

    public static boolean sonAmigos(String emailmio, String emailusu) {
        boolean amigos = false;
        try {
            String sentencia = "SELECT * FROM " + Constantes.tabla_amigos + " WHERE Email1 = '" + emailmio + "' AND Email2 = '" + emailusu + "'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            if (Conj_Registros.next()) {
                sentencia = "SELECT * FROM " + Constantes.tabla_amigos + " WHERE Email1 = '" + emailusu + "' AND Email2 = '" + emailmio + "'";
                ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
                if (Conj_Registros.next()) {
                    amigos = true;
                }
            }
        } catch (SQLException ex) {
        }

        return amigos;
    }

    public static void editarDatosUsuario(Usuario u) {
        try {
            String sentencia = "UPDATE " + Constantes.tabla_usuarios + " SET Apodo='" + u.getApodo() + "', "
                    + "Telefono='" + u.getTelefono() + "', Edad = " + u.getEdad() + " WHERE Email = '" + u.getEmail() + "'";
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);
        } catch (SQLException ex) {
        }
    }

    public static void editarPreferenciasUsuario(Usuario u) {
        try {
            //MODIFICAR relacion
            String sentencia = "UPDATE " + Constantes.tabla_asignacion_preferencias + " SET Valoracion ='"
                    + u.getRelacion() + "' WHERE IdPref=1 AND Email='" + u.getEmail() + "'";
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);
            //MODIFICAR deporte
            sentencia = "UPDATE " + Constantes.tabla_asignacion_preferencias + " SET Valoracion ='"
                    + u.getDeporte() + "' WHERE IdPref=2 AND Email='" + u.getEmail() + "'";
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);
            //MODIFICAR arte
            sentencia = "UPDATE " + Constantes.tabla_asignacion_preferencias + " SET Valoracion ='"
                    + u.getArte() + "' WHERE IdPref=3 AND Email='" + u.getEmail() + "'";
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);
            //MODIFICAR politica
            sentencia = "UPDATE " + Constantes.tabla_asignacion_preferencias + " SET Valoracion ='"
                    + u.getPolitica() + "' WHERE IdPref=4 AND Email='" + u.getEmail() + "'";
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);
            //MODIFICAR tiene hijos
            sentencia = "UPDATE " + Constantes.tabla_asignacion_preferencias + " SET Valoracion ='"
                    + u.isTieneHijos() + "' WHERE IdPref=5 AND Email='" + u.getEmail() + "'";
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);
            //MODIFICAR quiere hijos
            sentencia = "UPDATE " + Constantes.tabla_asignacion_preferencias + " SET Valoracion ='"
                    + u.isQuiereHijos() + "' WHERE IdPref=6 AND Email='" + u.getEmail() + "'";
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);
            //MODIFICAR interes en mujeres
            sentencia = "UPDATE " + Constantes.tabla_asignacion_preferencias + " SET Valoracion ='"
                    + u.isInteresMujeres() + "' WHERE IdPref=7 AND Email='" + u.getEmail() + "'";
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);
            //MODIFICAR interes en hombres
            sentencia = "UPDATE " + Constantes.tabla_asignacion_preferencias + " SET Valoracion ='"
                    + u.isInteresHombres() + "' WHERE IdPref=8 AND Email='" + u.getEmail() + "'";
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);
        } catch (SQLException ex) {
        }
    }

    public static void enviarMensaje(Mensaje m) {
        try {
            String sentencia = "INSERT INTO " + Constantes.tabla_mensajes + " VALUES(DEFAULT,'"
                    + m.getAsunto() + "','" + m.getCuerpo() + "','" + m.getEmisor() + "','" + m.getReceptor() + "','"
                    + m.getFecha() + "', false)";
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);
        } catch (SQLException ex) {
        }
    }

    public static LinkedList mensajesParaMi(Usuario u) {
        LinkedList mensajesParaMi = new LinkedList();
        try {
            String sentencia = "SELECT * FROM " + Constantes.tabla_mensajes + " WHERE Receptor='"
                    + u.getEmail() + "'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                Mensaje m = new Mensaje(Conj_Registros.getInt("Id"), Conj_Registros.getString("Asunto"),
                        Conj_Registros.getString("Cuerpo"), Conj_Registros.getString("Emisor"),
                        Conj_Registros.getString("Receptor"), Conj_Registros.getString("Fecha"),
                        Conj_Registros.getBoolean("Leido"));
                mensajesParaMi.add(m);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConexionEstatica.class.getName()).log(Level.SEVERE, null, ex);
        }
        return mensajesParaMi;
    }

    public static LinkedList mensajesParaMiNoLeidos(Usuario u) {
        LinkedList mensajesParaMi = new LinkedList();
        try {
            String sentencia = "SELECT * FROM " + Constantes.tabla_mensajes + " WHERE Receptor='"
                    + u.getEmail() + "' AND Leido=false";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                Mensaje m = new Mensaje(Conj_Registros.getInt("Id"), Conj_Registros.getString("Asunto"),
                        Conj_Registros.getString("Cuerpo"), Conj_Registros.getString("Emisor"),
                        Conj_Registros.getString("Receptor"), Conj_Registros.getString("Fecha"),
                        Conj_Registros.getBoolean("Leido"));
                mensajesParaMi.add(m);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConexionEstatica.class.getName()).log(Level.SEVERE, null, ex);
        }
        return mensajesParaMi;
    }

    public static LinkedList mensajesEnviados(Usuario u) {
        LinkedList mensajesParaMi = new LinkedList();
        try {
            String sentencia = "SELECT * FROM " + Constantes.tabla_mensajes + " WHERE Emisor='" + u.getEmail() + "'";
            ConexionEstatica.Conj_Registros = ConexionEstatica.Sentencia_SQL.executeQuery(sentencia);
            while (Conj_Registros.next()) {
                Mensaje m = new Mensaje(Conj_Registros.getInt("Id"), Conj_Registros.getString("Asunto"),
                        Conj_Registros.getString("Cuerpo"), Conj_Registros.getString("Emisor"),
                        Conj_Registros.getString("Receptor"), Conj_Registros.getString("Fecha"),
                        Conj_Registros.getBoolean("Leido"));
                mensajesParaMi.add(m);
            }
        } catch (SQLException ex) {
        }
        return mensajesParaMi;
    }

    public static void marcarLeido(Mensaje m) {
        try {
            String sentencia = "UPDATE " + Constantes.tabla_mensajes + " SET Leido=true WHERE Id=" + m.getId();
            ConexionEstatica.Sentencia_SQL.executeUpdate(sentencia);
        } catch (SQLException ex) {
        }
    }
}
