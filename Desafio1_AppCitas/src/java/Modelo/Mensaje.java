/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.Calendar;
import java.util.GregorianCalendar;

/**
 *
 * @author Mery
 */
public class Mensaje {

    private int id;
    private String asunto;
    private String cuerpo;
    private String emisor;
    private String receptor;
    private String fecha;
    private boolean leido;

    public Mensaje() {
    }

    public Mensaje(int id, String asunto, String cuerpo, String emisor, String receptor, String fecha, boolean leido) {
        this.id = id;
        this.asunto = asunto;
        this.cuerpo = cuerpo;
        this.emisor = emisor;
        this.receptor = receptor;
        this.fecha = fecha;
        this.leido = leido;
    }

    public Mensaje(String asunto, String cuerpo, String emisor, String receptor) {
        this.asunto = asunto;
        this.cuerpo = cuerpo;
        this.emisor = emisor;
        this.receptor = receptor;
        this.fecha = fechaActual();
        this.leido = false;
    }


    private String fechaActual() {
        String fecha = "";
        Calendar f = new GregorianCalendar();
        int dia = f.get(Calendar.DAY_OF_MONTH);
        int mes = f.get(Calendar.MONTH);
        int annio = f.get(Calendar.YEAR);
        fecha = dia + "/" + mes + "/" + annio;
        return fecha;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAsunto() {
        return asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    public String getCuerpo() {
        return cuerpo;
    }

    public void setCuerpo(String cuerpo) {
        this.cuerpo = cuerpo;
    }

    public String getEmisor() {
        return emisor;
    }

    public void setEmisor(String emisor) {
        this.emisor = emisor;
    }

    public String getReceptor() {
        return receptor;
    }

    public void setReceptor(String receptor) {
        this.receptor = receptor;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public boolean isLeido() {
        return leido;
    }

    public void setLeido(boolean leido) {
        this.leido = leido;
    }

}
