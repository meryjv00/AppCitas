/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.LinkedList;

/**
 *
 * @author Mery
 */
public class Usuario {

    //Esenciales
    private String email;
    private String dni;
    private String apodo;
    private String clave;
    private String telefono;
    private int edad;
    private boolean activado;
    private boolean haIniciado;
    //Preferencias
    private String relacion;
    private int deporte;
    private int arte;
    private int politica;
    private boolean tieneHijos;
    private boolean quiereHijos;
    private boolean interesMujeres;
    private boolean interesHombres;
    //Roles
    private LinkedList roles;

    public Usuario() {
    }

    public Usuario(String email, String dni, String apodo, String clave, String telefono, int edad, boolean activado, boolean haIniciado) {
        this.email = email;
        this.dni = dni;
        this.apodo = apodo;
        this.clave = clave;
        this.telefono = telefono;
        this.edad = edad;
        this.activado = activado;
        this.haIniciado = haIniciado;
        roles = new LinkedList();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getApodo() {
        return apodo;
    }

    public void setApodo(String apodo) {
        this.apodo = apodo;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public boolean isActivado() {
        return activado;
    }

    public void setActivado(boolean activado) {
        this.activado = activado;
    }

    public boolean isHaIniciado() {
        return haIniciado;
    }

    public void setHaIniciado(boolean haIniciado) {
        this.haIniciado = haIniciado;
    }

    public String getRelacion() {
        return relacion;
    }

    public void setRelacion(String relacion) {
        this.relacion = relacion;
    }

    public int getDeporte() {
        return deporte;
    }

    public void setDeporte(int deporte) {
        this.deporte = deporte;
    }

    public int getArte() {
        return arte;
    }

    public void setArte(int arte) {
        this.arte = arte;
    }

    public int getPolitica() {
        return politica;
    }

    public void setPolitica(int politica) {
        this.politica = politica;
    }

    public boolean isTieneHijos() {
        return tieneHijos;
    }

    public void setTieneHijos(boolean tieneHijos) {
        this.tieneHijos = tieneHijos;
    }

    public boolean isQuiereHijos() {
        return quiereHijos;
    }

    public void setQuiereHijos(boolean quiereHijos) {
        this.quiereHijos = quiereHijos;
    }

    public boolean isInteresMujeres() {
        return interesMujeres;
    }

    public void setInteresMujeres(boolean interesMujeres) {
        this.interesMujeres = interesMujeres;
    }

    public boolean isInteresHombres() {
        return interesHombres;
    }

    public void setInteresHombres(boolean interesHombres) {
        this.interesHombres = interesHombres;
    }

    //Métodos para manejo de los roles
    public void addRol(String rol) {
        this.roles.add(rol);
    }

    public String getRol(int i) {
        return (String) this.roles.get(i);
    }

    public int sizeRoles() {
        return this.roles.size();
    }
}
