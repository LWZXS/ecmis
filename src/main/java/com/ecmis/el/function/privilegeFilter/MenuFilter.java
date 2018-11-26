package com.ecmis.el.function.privilegeFilter;

import com.ecmis.pojo.Role;
import com.ecmis.pojo.User;


public class MenuFilter {

	public static boolean filterMenu(User user){
		if(user!=null && user.getRoles()!=null){
			for (Role role : user.getRoles()) {
				if(role.getRoleId()==2){
					return true;
				}
			}
		}
		return false;
	}
}
