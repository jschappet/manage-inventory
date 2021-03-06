package edu.uiowa.icts.inv.resource;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.validation.Valid;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.NonUniqueObjectException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.http.*;

import edu.uiowa.icts.inv.domain.*;
import edu.uiowa.icts.exception.EntityNotFoundException;
import edu.uiowa.icts.spring.GenericDaoListOptions;

/**
 * Generated by Protogen 
 * @since ${date}
 */
@RestController
@RequestMapping( "/api/location" )
public class LocationResource extends AbstractInvApiResource {

    private static final Log log = LogFactory.getLog( LocationResource.class );
    
    @RequestMapping( value = { "{locationId}" }, method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE )
    public Location get(@PathVariable( "locationId" ) Integer locationId ) {
    	 Location location = invDaoService.getLocationService().findById( locationId );
		 if (location == null){
			 throw new EntityNotFoundException();
		 } 
	     return location;
    }
    
    @RequestMapping( method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE  )
    public Location create(@RequestBody @Valid Location location ) {
		 invDaoService.getLocationService().save( location );
		 return location;
    }
    
    @RequestMapping( value = { "{locationId}" }, method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE  )
    public Location update(@PathVariable( "locationId" ) Integer locationId, @RequestBody @Valid Location location ) {
    	Location locationRecord = invDaoService.getLocationService().findById( locationId );
    	if (locationRecord == null || !locationRecord.getLocationId().equals(location.getLocationId())){
			 throw new EntityNotFoundException(); 
		 } 
    	 invDaoService.getLocationService().getSession().flush();
         invDaoService.getLocationService().getSession().clear();
		 invDaoService.getLocationService().update( location );
		 return location;
    }
    
    @RequestMapping( value = { "{locationId}" }, method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE )
    public String delete(@PathVariable( "locationId" ) Integer locationId ) {
    	Location location = invDaoService.getLocationService().findById( locationId );
		 if (location == null){
			 throw new EntityNotFoundException();
		 } 
		 invDaoService.getLocationService().delete(location);
	     return "";
    }
    
    @RequestMapping( value = {  "", "/"  }, method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE )
    public List<Location> list() {
    	 return invDaoService.getLocationService().list();
    }

}