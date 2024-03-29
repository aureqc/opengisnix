// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.opengis.nix.web;

import java.lang.String;
import org.opengis.nix.domain.User;
import org.opengis.nix.domain.UserRole;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect UserRoleController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByUsuario", "form" }, method = RequestMethod.GET)
    public String UserRoleController.findUserRolesByUsuarioForm(Model uiModel) {
        uiModel.addAttribute("users", User.findAllUsers());
        return "userroles/findUserRolesByUsuario";
    }
    
    @RequestMapping(params = "find=ByUsuario", method = RequestMethod.GET)
    public String UserRoleController.findUserRolesByUsuario(@RequestParam("usuario") User usuario, Model uiModel) {
        uiModel.addAttribute("userroles", UserRole.findUserRolesByUsuario(usuario).getResultList());
        return "userroles/list";
    }
    
}
