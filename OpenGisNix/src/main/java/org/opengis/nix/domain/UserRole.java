package org.opengis.nix.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.opengis.nix.domain.User;
import javax.validation.constraints.NotNull;
import javax.persistence.ManyToOne;
import org.opengis.nix.domain.Role;

@RooJavaBean
@RooToString
@RooEntity(finders = { "findUserRolesByUsuario" })
public class UserRole {

    @NotNull
    @ManyToOne
    private User usuario;

    @NotNull
    @ManyToOne
    private Role rol;
}
