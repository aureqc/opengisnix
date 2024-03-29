
package org.opengis.nix.domain;

import org.opengis.nix.enumerated.TipoUser;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import javax.persistence.Column;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooEntity(finders = { "findUsersByEmailAddress", "findUsersByNombreLike", "findUsersByApellidosLike",  "findUserByTipo", "findUsersByDni" })
public class User {
        
    @NotNull
    @Pattern(regexp = "[0-9]{8}[A-Za-z]")
    
    private String dni;

    @NotNull
    @Size(max = 30)
    private String nombre;

    @NotNull
    @Size(max = 30)
    private String apellidos;


    @Size(max = 15)
    private String alias;


    @NotNull
    @Pattern(regexp = "[0-9]+$")
    private String telefono;

    @NotNull
    @Size(max = 30)
    private String direccion;

    @NotNull
    @Size(max = 20)
    private String poblacion;

    @NotNull
    @Size(max = 20)
    private String provincia;
    
    @NotNull
    @Pattern(regexp = "[0-9]{5}")
    private String codPostal;

    //@Enumerated(EnumType.STRING)
    //private TipoUser tipo;
    
    @NotNull
    @Column(unique = true)
    @Size(min = 1)
    private String emailAddress;

    @NotNull
    @Size(min = 1)
    private String password;

    //@Temporal(TemporalType.TIMESTAMP)
    //@DateTimeFormat(style = "M-")
    //private Date activationDate;

    //private String activationKey;
    
    @Value("true")
    private Boolean enabled;

    //private Boolean locked;

        public void setUser(Object object) {
                // TODO Auto-generated method stub
                
        }
    public String getFullName(){
    	return nombre+" "+apellidos;
    }

	public static User findUser(Long id) {
        if (id == null) return null;
        return entityManager().find(User.class, id);
    }
	
   
}
