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
@RequestMapping( "/api/message" )
public class MessageResource extends AbstractInvApiResource {

    private static final Log log = LogFactory.getLog( MessageResource.class );
    
    @RequestMapping( value = { "{messageId}" }, method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE )
    public Message get(@PathVariable( "messageId" ) Integer messageId ) {
    	 Message message = invDaoService.getMessageService().findById( messageId );
		 if (message == null){
			 throw new EntityNotFoundException();
		 } 
	     return message;
    }
    
    @RequestMapping( method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE  )
    public Message create(@RequestBody @Valid Message message ) {
		 invDaoService.getMessageService().save( message );
		 return message;
    }
    
    @RequestMapping( value = { "{messageId}" }, method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE  )
    public Message update(@PathVariable( "messageId" ) Integer messageId, @RequestBody @Valid Message message ) {
    	Message messageRecord = invDaoService.getMessageService().findById( messageId );
    	if (messageRecord == null || !messageRecord.getMessageId().equals(message.getMessageId())){
			 throw new EntityNotFoundException(); 
		 } 
    	 invDaoService.getMessageService().getSession().flush();
         invDaoService.getMessageService().getSession().clear();
		 invDaoService.getMessageService().update( message );
		 return message;
    }
    
    @RequestMapping( value = { "{messageId}" }, method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE )
    public String delete(@PathVariable( "messageId" ) Integer messageId ) {
    	Message message = invDaoService.getMessageService().findById( messageId );
		 if (message == null){
			 throw new EntityNotFoundException();
		 } 
		 invDaoService.getMessageService().delete(message);
	     return "";
    }
    
    @RequestMapping( value = {  "", "/"  }, method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE )
    public List<Message> list() {
    	 return invDaoService.getMessageService().list();
    }

}