// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.opengis.nix.domain;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.opengis.nix.domain.Role;
import org.opengis.nix.domain.RoleDataOnDemand;
import org.opengis.nix.domain.User;
import org.opengis.nix.domain.UserDataOnDemand;
import org.opengis.nix.domain.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect UserRoleDataOnDemand_Roo_DataOnDemand {
    
    declare @type: UserRoleDataOnDemand: @Component;
    
    private Random UserRoleDataOnDemand.rnd = new SecureRandom();
    
    private List<UserRole> UserRoleDataOnDemand.data;
    
    @Autowired
    private RoleDataOnDemand UserRoleDataOnDemand.roleDataOnDemand;
    
    @Autowired
    private UserDataOnDemand UserRoleDataOnDemand.userDataOnDemand;
    
    public UserRole UserRoleDataOnDemand.getNewTransientUserRole(int index) {
        UserRole obj = new UserRole();
        setRoleEntry(obj, index);
        setUserEntry(obj, index);
        return obj;
    }
    
    public void UserRoleDataOnDemand.setRoleEntry(UserRole obj, int index) {
        Role roleEntry = roleDataOnDemand.getRandomRole();
        obj.setRoleEntry(roleEntry);
    }
    
    public void UserRoleDataOnDemand.setUserEntry(UserRole obj, int index) {
        User userEntry = userDataOnDemand.getRandomUser();
        obj.setUserEntry(userEntry);
    }
    
    public UserRole UserRoleDataOnDemand.getSpecificUserRole(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        UserRole obj = data.get(index);
        return UserRole.findUserRole(obj.getId());
    }
    
    public UserRole UserRoleDataOnDemand.getRandomUserRole() {
        init();
        UserRole obj = data.get(rnd.nextInt(data.size()));
        return UserRole.findUserRole(obj.getId());
    }
    
    public boolean UserRoleDataOnDemand.modifyUserRole(UserRole obj) {
        return false;
    }
    
    public void UserRoleDataOnDemand.init() {
        data = UserRole.findUserRoleEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'UserRole' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<org.opengis.nix.domain.UserRole>();
        for (int i = 0; i < 10; i++) {
            UserRole obj = getNewTransientUserRole(i);
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
