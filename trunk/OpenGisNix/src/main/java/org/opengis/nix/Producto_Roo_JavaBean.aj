// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.opengis.nix;

import java.lang.Boolean;
import java.lang.String;
import org.opengis.nix.domain.User;
import org.opengis.nix.enumerated.Tipo;

privileged aspect Producto_Roo_JavaBean {
    
    public User Producto.getPropietario() {
        return this.propietario;
    }
    
    public void Producto.setPropietario(User propietario) {
        this.propietario = propietario;
    }
    
    public String Producto.getDescripcion() {
        return this.descripcion;
    }
    
    public void Producto.setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public Tipo Producto.getTipo() {
        return this.tipo;
    }
    
    public void Producto.setTipo(Tipo tipo) {
        this.tipo = tipo;
    }
    
    public int Producto.getDosis() {
        return this.dosis;
    }
    
    public void Producto.setDosis(int dosis) {
        this.dosis = dosis;
    }
    
    public Boolean Producto.getActivo() {
        return this.Activo;
    }
    
    public void Producto.setActivo(Boolean Activo) {
        this.Activo = Activo;
    }
    
}
