// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.opengis.nix.domain;

import java.lang.Boolean;
import java.lang.String;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.opengis.nix.domain.User;
import org.springframework.stereotype.Component;

privileged aspect UserDataOnDemand_Roo_DataOnDemand {
    
    declare @type: UserDataOnDemand: @Component;
    
    private Random UserDataOnDemand.rnd = new SecureRandom();
    
    private List<User> UserDataOnDemand.data;
    
    public User UserDataOnDemand.getNewTransientUser(int index) {
        User obj = new User();
        setAlias(obj, index);
        setApellidos(obj, index);
        setCodPostal(obj, index);
        setDireccion(obj, index);
        setDni(obj, index);
        setEmailAddress(obj, index);
        setEnabled(obj, index);
        setNombre(obj, index);
        setPassword(obj, index);
        setPoblacion(obj, index);
        setProvincia(obj, index);
        setTelefono(obj, index);
        return obj;
    }
    
    public void UserDataOnDemand.setAlias(User obj, int index) {
        String alias = "alias_" + index;
        if (alias.length() > 15) {
            alias = alias.substring(0, 15);
        }
        obj.setAlias(alias);
    }
    
    public void UserDataOnDemand.setApellidos(User obj, int index) {
        String apellidos = "apellidos_" + index;
        if (apellidos.length() > 30) {
            apellidos = apellidos.substring(0, 30);
        }
        obj.setApellidos(apellidos);
    }
    
    public void UserDataOnDemand.setCodPostal(User obj, int index) {
        String codPostal = "codPostal_" + index;
        obj.setCodPostal(codPostal);
    }
    
    public void UserDataOnDemand.setDireccion(User obj, int index) {
        String direccion = "direccion_" + index;
        if (direccion.length() > 30) {
            direccion = direccion.substring(0, 30);
        }
        obj.setDireccion(direccion);
    }
    
    public void UserDataOnDemand.setDni(User obj, int index) {
        String dni = "dni_" + index;
        obj.setDni(dni);
    }
    
    public void UserDataOnDemand.setEmailAddress(User obj, int index) {
        String emailAddress = "emailAddress_" + index;
        obj.setEmailAddress(emailAddress);
    }
    
    public void UserDataOnDemand.setEnabled(User obj, int index) {
        Boolean enabled = Boolean.TRUE;
        obj.setEnabled(enabled);
    }
    
    public void UserDataOnDemand.setNombre(User obj, int index) {
        String nombre = "nombre_" + index;
        if (nombre.length() > 30) {
            nombre = nombre.substring(0, 30);
        }
        obj.setNombre(nombre);
    }
    
    public void UserDataOnDemand.setPassword(User obj, int index) {
        String password = "password_" + index;
        obj.setPassword(password);
    }
    
    public void UserDataOnDemand.setPoblacion(User obj, int index) {
        String poblacion = "poblacion_" + index;
        if (poblacion.length() > 20) {
            poblacion = poblacion.substring(0, 20);
        }
        obj.setPoblacion(poblacion);
    }
    
    public void UserDataOnDemand.setProvincia(User obj, int index) {
        String provincia = "provincia_" + index;
        if (provincia.length() > 20) {
            provincia = provincia.substring(0, 20);
        }
        obj.setProvincia(provincia);
    }
    
    public void UserDataOnDemand.setTelefono(User obj, int index) {
        String telefono = "telefono_" + index;
        obj.setTelefono(telefono);
    }
    
    public User UserDataOnDemand.getSpecificUser(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        User obj = data.get(index);
        return User.findUser(obj.getId());
    }
    
    public User UserDataOnDemand.getRandomUser() {
        init();
        User obj = data.get(rnd.nextInt(data.size()));
        return User.findUser(obj.getId());
    }
    
    public boolean UserDataOnDemand.modifyUser(User obj) {
        return false;
    }
    
    public void UserDataOnDemand.init() {
        data = User.findUserEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'User' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<org.opengis.nix.domain.User>();
        for (int i = 0; i < 10; i++) {
            User obj = getNewTransientUser(i);
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
