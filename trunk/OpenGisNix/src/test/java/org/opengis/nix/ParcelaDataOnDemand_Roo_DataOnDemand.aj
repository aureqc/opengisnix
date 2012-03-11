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
import org.opengis.nix.Parcela;
import org.opengis.nix.domain.User;
import org.opengis.nix.domain.UserDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ParcelaDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ParcelaDataOnDemand: @Component;
    
    private Random ParcelaDataOnDemand.rnd = new SecureRandom();
    
    private List<Parcela> ParcelaDataOnDemand.data;
    
    @Autowired
    private UserDataOnDemand ParcelaDataOnDemand.userDataOnDemand;
    
    public Parcela ParcelaDataOnDemand.getNewTransientParcela(int index) {
        Parcela obj = new Parcela();
        setActiva(obj, index);
        setAlias(obj, index);
        setNumParcela(obj, index);
        setNumPoblacion(obj, index);
        setNumPoligono(obj, index);
        setNumProvincia(obj, index);
        setPartida(obj, index);
        setPropietario(obj, index);
        return obj;
    }
    
    public void ParcelaDataOnDemand.setActiva(Parcela obj, int index) {
        Boolean activa = Boolean.TRUE;
        obj.setActiva(activa);
    }
    
    public void ParcelaDataOnDemand.setAlias(Parcela obj, int index) {
        String alias = "alias_" + index;
        if (alias.length() > 20) {
            alias = alias.substring(0, 20);
        }
        obj.setAlias(alias);
    }
    
    public void ParcelaDataOnDemand.setNumParcela(Parcela obj, int index) {
        int numParcela = index;
        if (numParcela > 999) {
            numParcela = 999;
        }
        obj.setNumParcela(numParcela);
    }
    
    public void ParcelaDataOnDemand.setNumPoblacion(Parcela obj, int index) {
        int numPoblacion = index;
        if (numPoblacion > 999) {
            numPoblacion = 999;
        }
        obj.setNumPoblacion(numPoblacion);
    }
    
    public void ParcelaDataOnDemand.setNumPoligono(Parcela obj, int index) {
        int numPoligono = index;
        if (numPoligono > 999) {
            numPoligono = 999;
        }
        obj.setNumPoligono(numPoligono);
    }
    
    public void ParcelaDataOnDemand.setNumProvincia(Parcela obj, int index) {
        int numProvincia = index;
        if (numProvincia > 999) {
            numProvincia = 999;
        }
        obj.setNumProvincia(numProvincia);
    }
    
    public void ParcelaDataOnDemand.setPartida(Parcela obj, int index) {
        String Partida = "Partida_" + index;
        if (Partida.length() > 10) {
            Partida = Partida.substring(0, 10);
        }
        obj.setPartida(Partida);
    }
    
    public void ParcelaDataOnDemand.setPropietario(Parcela obj, int index) {
        User Propietario = userDataOnDemand.getRandomUser();
        obj.setPropietario(Propietario);
    }
    
    public Parcela ParcelaDataOnDemand.getSpecificParcela(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Parcela obj = data.get(index);
        return Parcela.findParcela(obj.getId());
    }
    
    public Parcela ParcelaDataOnDemand.getRandomParcela() {
        init();
        Parcela obj = data.get(rnd.nextInt(data.size()));
        return Parcela.findParcela(obj.getId());
    }
    
    public boolean ParcelaDataOnDemand.modifyParcela(Parcela obj) {
        return false;
    }
    
    public void ParcelaDataOnDemand.init() {
        data = Parcela.findParcelaEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Parcela' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<org.opengis.nix.Parcela>();
        for (int i = 0; i < 10; i++) {
            Parcela obj = getNewTransientParcela(i);
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
