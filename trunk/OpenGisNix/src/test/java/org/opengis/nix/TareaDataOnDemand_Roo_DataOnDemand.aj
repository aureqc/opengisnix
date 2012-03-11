// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.opengis.nix;

import java.lang.String;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.opengis.nix.Tarea;
import org.springframework.stereotype.Component;

privileged aspect TareaDataOnDemand_Roo_DataOnDemand {
    
    declare @type: TareaDataOnDemand: @Component;
    
    private Random TareaDataOnDemand.rnd = new SecureRandom();
    
    private List<Tarea> TareaDataOnDemand.data;
    
    public Tarea TareaDataOnDemand.getNewTransientTarea(int index) {
        Tarea obj = new Tarea();
        setDescripcion(obj, index);
        setNombre(obj, index);
        return obj;
    }
    
    public void TareaDataOnDemand.setDescripcion(Tarea obj, int index) {
        String descripcion = "descripcion_" + index;
        obj.setDescripcion(descripcion);
    }
    
    public void TareaDataOnDemand.setNombre(Tarea obj, int index) {
        String nombre = "nombre_" + index;
        obj.setNombre(nombre);
    }
    
    public Tarea TareaDataOnDemand.getSpecificTarea(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Tarea obj = data.get(index);
        return Tarea.findTarea(obj.getId());
    }
    
    public Tarea TareaDataOnDemand.getRandomTarea() {
        init();
        Tarea obj = data.get(rnd.nextInt(data.size()));
        return Tarea.findTarea(obj.getId());
    }
    
    public boolean TareaDataOnDemand.modifyTarea(Tarea obj) {
        return false;
    }
    
    public void TareaDataOnDemand.init() {
        data = Tarea.findTareaEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Tarea' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<org.opengis.nix.Tarea>();
        for (int i = 0; i < 10; i++) {
            Tarea obj = getNewTransientTarea(i);
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
