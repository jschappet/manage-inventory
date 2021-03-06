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
 * @see <a href="https://github.com/ui-icts/protogen">https://github.com/ui-icts/protogen</a>
 * @since 10/26/2015 17:44:58 CDT
 */
@RestController( value = "edu_uiowa_icts_inv_resource_worklog_resource" )
@RequestMapping( "/api/worklog" )
public class WorkLogResource extends AbstractInvApiResource {

    private static final Log log = LogFactory.getLog( WorkLogResource.class );
    
    @RequestMapping( value = { "{workLogId}" }, method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE )
    public WorkLog get( @PathVariable( "workLogId" ) Integer workLogId ) {
    	 WorkLog workLog = invDaoService.getWorkLogService().findById( workLogId );
		 if (workLog == null){
			 throw new EntityNotFoundException();
		 } 
	     return workLog;
    }
    
    @RequestMapping( method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE  )
    public WorkLog create( @RequestBody @Valid WorkLog workLog ) {
		 invDaoService.getWorkLogService().save( workLog );
		 return workLog;
    }
    
    @RequestMapping( value = { "{workLogId}" }, method = { RequestMethod.POST, RequestMethod.PUT }, produces = MediaType.APPLICATION_JSON_VALUE  )
    public WorkLog update( @PathVariable( "workLogId" ) Integer workLogId, @RequestBody @Valid WorkLog workLog ) {
    	WorkLog workLogRecord = invDaoService.getWorkLogService().findById( workLogId );
    	if ( workLogRecord == null || !workLogRecord.getTaskId().equals(workLog.getTaskId())){
			 throw new EntityNotFoundException(); 
		 } 
    	 invDaoService.getWorkLogService().getSession().flush();
         invDaoService.getWorkLogService().getSession().clear();
		 invDaoService.getWorkLogService().update( workLog );
		 return workLog;
    }
    
    @RequestMapping( value = { "{workLogId}" }, method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE )
    public String delete( @PathVariable( "workLogId" ) Integer workLogId ) {
    	WorkLog workLog = invDaoService.getWorkLogService().findById( workLogId );
		 if ( workLog == null ){
			 throw new EntityNotFoundException();
		 } 
		 invDaoService.getWorkLogService().delete(workLog);
	     return "";
    }
    
    @RequestMapping( value = {  "", "/"  }, method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE )
    public List<WorkLog> list() {
    	 return invDaoService.getWorkLogService().list();
    }

}