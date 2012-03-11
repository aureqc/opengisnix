// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.opengis.nix;

import java.lang.Boolean;
import java.lang.String;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.opengis.nix.Producto;
import org.opengis.nix.domain.User;
import org.opengis.nix.domain.UserDataOnDemand;
import org.opengis.nix.enumerated.Tipo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ProductoDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ProductoDataOnDemand: @Component;
    
    private Random ProductoDataOnDemand.rnd = new SecureRandom();
    
    private List<Producto> ProductoDataOnDemand.data;
    
    @Autowired
    private UserDataOnDemand ProductoDataOnDemand.userDataOnDemand;
    
    public Producto ProductoDataOnDemand.getNewTransientProducto(int index) {
        Producto obj = new Producto();
        setActivo(obj, index);
        setDescripcion(obj, index);
        setDosis(obj, index);
        setPropietario(obj, index);
        setTipo(obj, index);
        return obj;
    }
    
    public void ProductoDataOnDemand.setActivo(Producto obj, int index) {
        Boolean Activo = Boolean.TRUE;
        obj.setActivo(Activo);
    }
    
    public void ProductoDataOnDemand.setDescripcion(Producto obj, int index) {
        String descripcion = "descripcion_" + index;
        if (descripcion.length() > 120) {
            descripcion = descripcion.substring(0, 120);
        }
        obj.setDescripcion(descripcion);
    }
    
    public void ProductoDataOnDemand.setDosis(Producto obj, int index) {
        int dosis = index;
        if (dosis > 999) {
            dosis = 999;
        }
        obj.setDosis(dosis);
    }
    
    public void ProductoDataOnDemand.setPropietario(Producto obj, int index) {
        User propietario = userDataOnDemand.getRandomUser();
        obj.setPropietario(propietario);
    }
    
    public void ProductoDataOnDemand.setTipo(Producto obj, int index) {
        Tipo tipo = Tipo.class.getEnumConstants()[0];
        obj.setTipo(tipo);
    }
    
    public Producto ProductoDataOnDemand.getSpecificProducto(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Producto obj = data.get(index);
        return Producto.findProducto(obj.getId());
    }
    
    public Producto ProductoDataOnDemand.getRandomProducto() {
        init();
        Producto obj = data.get(rnd.nextInt(data.size()));
        return Producto.findProducto(obj.getId());
    }
    
    public boolean ProductoDataOnDemand.modifyProducto(Producto obj) {
        return false;
    }
    
    public void ProductoDataOnDemand.init() {
        data = Producto.findProductoEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Producto' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<org.opengis.nix.Producto>();
        for (int i = 0; i < 10; i++) {
            Producto obj = getNewTransientProducto(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> it = e.getConstraintViolations().iterator(); it.hasNext();) {
                    ConstraintViolation<?> cv = it.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
