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
@RequestMapping( "/api/systemsetting" )
public class SystemSettingResource extends AbstractInvApiResource {

    private static final Log log = LogFactory.getLog( SystemSettingResource.class );
    
    @RequestMapping( value = { "{systemSettingId}" }, method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE )
    public SystemSetting get(@PathVariable( "systemSettingId" ) String systemSettingId ) {
    	 SystemSetting systemSetting = invDaoService.getSystemSettingService().findById( systemSettingId );
		 if (systemSetting == null){
			 throw new EntityNotFoundException();
		 } 
	     return systemSetting;
    }
    
    @RequestMapping( method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE  )
    public SystemSetting create(@RequestBody @Valid SystemSetting systemSetting ) {
		 invDaoService.getSystemSettingService().save( systemSetting );
		 return systemSetting;
    }
    
    @RequestMapping( value = { "{systemSettingId}" }, method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE  )
    public SystemSetting update(@PathVariable( "systemSettingId" ) String systemSettingId, @RequestBody @Valid SystemSetting systemSetting ) {
    	SystemSetting systemSettingRecord = invDaoService.getSystemSettingService().findById( systemSettingId );
    	if (systemSettingRecord == null || !systemSettingRecord.getName().equals(systemSetting.getName())){
			 throw new EntityNotFoundException(); 
		 } 
    	 invDaoService.getSystemSettingService().getSession().flush();
         invDaoService.getSystemSettingService().getSession().clear();
		 invDaoService.getSystemSettingService().update( systemSetting );
		 return systemSetting;
    }
    
    @RequestMapping( value = { "{systemSettingId}" }, method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE )
    public String delete(@PathVariable( "systemSettingId" ) String systemSettingId ) {
    	SystemSetting systemSetting = invDaoService.getSystemSettingService().findById( systemSettingId );
		 if (systemSetting == null){
			 throw new EntityNotFoundException();
		 } 
		 invDaoService.getSystemSettingService().delete(systemSetting);
	     return "";
    }
    
    @RequestMapping( value = {  "", "/"  }, method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE )
    public List<SystemSetting> list() {
    	 return invDaoService.getSystemSettingService().list();
    }

}