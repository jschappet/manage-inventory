package edu.uiowa.icts.spring;

import java.util.Collection;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

public class Security {

	public static boolean hasRole( String role ) {
		Authentication currentAuth = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority> currentAuthorities = currentAuth.getAuthorities();
		for ( GrantedAuthority ga : currentAuthorities ) {
			if ( ga.getAuthority().equals( role ) ) {
				return true;
			}
		}
		return false;
	}
}
