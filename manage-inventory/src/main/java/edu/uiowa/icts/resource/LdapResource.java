package edu.uiowa.icts.resource;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.apache.commons.collections.comparators.ComparatorChain;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import edu.uiowa.icts.spring.ldap.LDAPPerson;
import edu.uiowa.icts.spring.ldap.LDAPService;

/**
 * @author rrlorent
 * @since April 21, 2015
 */
@RestController
@RequestMapping( value = "/rest/ldap" )
public class LdapResource {

	@Autowired
	private LDAPService ldapService;

	@SuppressWarnings( "unchecked" )
	@RequestMapping( value = "search" )
	public String search( @RequestParam( "first" ) String first, @RequestParam( "last" ) String last,
		@RequestParam( value = "var_name" , required = false , defaultValue = "hawkId" ) String var_name ) {

		if ( ( first == null || StringUtils.isBlank( first ) ) && ( last == null || StringUtils.isBlank( last ) ) ) {
			return "";
		}

		List<LDAPPerson> list;
		if ( first == null || StringUtils.isBlank( first ) ) {
			list = ldapService.searchLastName( last );
		} else if ( last == null || StringUtils.isBlank( last ) ) {
			list = ldapService.searchFirstName( first );
		} else {
			list = ldapService.findByFullname( first, last );
		}

		ComparatorChain chain = new ComparatorChain();
		chain.addComparator( new Comparator<LDAPPerson>() {
			@Override
			public int compare( LDAPPerson o1, LDAPPerson o2 ) {
				return o1.getLastName().compareToIgnoreCase( o2.getLastName() );
			}
		} );
		chain.addComparator( new Comparator<LDAPPerson>() {
			@Override
			public int compare( LDAPPerson o1, LDAPPerson o2 ) {
				return o1.getGivenName().compareToIgnoreCase( o2.getGivenName() );
			}
		} );
		Collections.sort( list, chain );

		String results = "";
		for ( LDAPPerson person : list ) {
			results += "<div class=\"radio\">";
			results += "<label>";
			results += "<input type=\"radio\" name=\"" + var_name + "\" value=\"" + person.getUsername() + "\">&nbsp;&nbsp;";
			results += person.getGivenName() + " " + person.getLastName() + " - " + person.getUsername() + " : " + person.getDepartment();
			results += "</label>";
			results += "</div>";
		}
		return results;

	}

}