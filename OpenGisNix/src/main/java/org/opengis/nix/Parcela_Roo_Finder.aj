// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.opengis.nix;

import java.lang.String;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.opengis.nix.Parcela;
import org.opengis.nix.domain.User;

privileged aspect Parcela_Roo_Finder {
    
    public static TypedQuery<Parcela> Parcela.findParcelasByPartida(String Partida) {
        if (Partida == null || Partida.length() == 0) throw new IllegalArgumentException("The Partida argument is required");
        EntityManager em = Parcela.entityManager();
        TypedQuery<Parcela> q = em.createQuery("SELECT o FROM Parcela AS o WHERE o.Partida = :Partida", Parcela.class);
        q.setParameter("Partida", Partida);
        return q;
    }
    
    public static TypedQuery<Parcela> Parcela.findParcelasByPropietario(User Propietario) {
        if (Propietario == null) throw new IllegalArgumentException("The Propietario argument is required");
        EntityManager em = Parcela.entityManager();
        TypedQuery<Parcela> q = em.createQuery("SELECT o FROM Parcela AS o WHERE o.Propietario = :Propietario", Parcela.class);
        q.setParameter("Propietario", Propietario);
        return q;
    }
    
}
