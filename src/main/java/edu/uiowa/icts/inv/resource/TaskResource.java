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
@RequestMapping( "/api/task" )
public class TaskResource extends AbstractInvApiResource {

    private static final Log log = LogFactory.getLog( TaskResource.class );
    
    @RequestMapping( value = { "{taskId}" }, method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE )
    public Task get(@PathVariable( "taskId" ) Integer taskId ) {
    	 Task task = invDaoService.getTaskService().findById( taskId );
		 if (task == null){
			 throw new EntityNotFoundException();
		 } 
	     return task;
    }
    
    @RequestMapping( method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE  )
    public Task create(@RequestBody @Valid Task task ) {
		 invDaoService.getTaskService().save( task );
		 return task;
    }
    
    @RequestMapping( value = { "{taskId}" }, method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE  )
    public Task update(@PathVariable( "taskId" ) Integer taskId, @RequestBody @Valid Task task ) {
    	Task taskRecord = invDaoService.getTaskService().findById( taskId );
    	if (taskRecord == null || !taskRecord.getTaskId().equals(task.getTaskId())){
			 throw new EntityNotFoundException(); 
		 } 
    	 invDaoService.getTaskService().getSession().flush();
         invDaoService.getTaskService().getSession().clear();
		 invDaoService.getTaskService().update( task );
		 return task;
    }
    
    @RequestMapping( value = { "{taskId}" }, method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE )
    public String delete(@PathVariable( "taskId" ) Integer taskId ) {
    	Task task = invDaoService.getTaskService().findById( taskId );
		 if (task == null){
			 throw new EntityNotFoundException();
		 } 
		 invDaoService.getTaskService().delete(task);
	     return "";
    }
    
    @RequestMapping( value = {  "", "/"  }, method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE )
    public List<Task> list() {
    	log.debug("Username: " + getUsername());
    	 return invDaoService.getTaskService().listByPerson(getUsername());
    	//return invDaoService.getTaskService().list();
    }
    
    @RequestMapping( value = {  "mine"  }, method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE )
    public List<Task> myList() {
    	 return invDaoService.getTaskService().listByPerson(getUsername());
    }

}