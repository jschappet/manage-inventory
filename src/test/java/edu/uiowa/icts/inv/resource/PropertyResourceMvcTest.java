package edu.uiowa.icts.inv.resource;




import java.util.List;

import org.hamcrest.core.IsNull;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.Arrays;

import edu.uiowa.icts.datatable.DataTableColumn;
import edu.uiowa.icts.datatable.DataTableRequest;
import edu.uiowa.icts.datatable.DataTableSearch;
import edu.uiowa.icts.inv.dao.*;
import edu.uiowa.icts.inv.domain.*;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertThat;
import static org.hamcrest.Matchers.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import edu.uiowa.icts.inv.controller.AbstractControllerMVCTests;

/**
 * Generated by Protogen
 * @see <a href="https://github.com/ui-icts/protogen">https://github.com/ui-icts/protogen</a>
 * @since Sun Oct 18 08:25:38 CDT 2015
 */
public class PropertyResourceMvcTest extends AbstractControllerMVCTests {
	
    private Property firstProperty;
    private ObjectMapper mapper;
    
    @Before
    public void before() { 
        // add 20 records to test database
        for(int x=1; x<21; x++){
        	Property property = new Property();
        	invDaoService.getPropertyService().save(property);
	        if (x == 1){
	        	// use this ID for update, show, and delete assertions
	        	firstProperty = property;
	        }
        }   
        this.mapper = new ObjectMapper();
        // fix NonUniqueObjectException
        this.invDaoService.getPropertyService().getSession().flush();
        this.invDaoService.getPropertyService().getSession().clear();
    }    
      
    @Test
    public void getByPathVariableIdShouldLoadAndReturnObject() throws Exception {
    	mockMvc.perform(get("/api/property/"+firstProperty.getPropertyId().toString()))
         .andExpect(status().isOk())
         .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
        .andExpect(jsonPath("$.propertyId", is(firstProperty.getPropertyId())))
        ;
    }
  
    @Test
    public void getByPathVariableIdShouldReturn404ForBogusId() throws Exception {
    	mockMvc.perform(get("/api/property/-123")).andExpect(status().isNotFound()).andExpect(jsonPath("$.message", is("/api/property/-123 could not be found.")));
    }
    
    @Test
    public void restMappingNotFoundShouldReturn404() throws Exception {
    	mockMvc.perform(get("/api/property/asdfasdf/asdfasdf"))
    	.andExpect(status().isNotFound())
    	 .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
        .andExpect(jsonPath("$.message", is("/api/property/asdfasdf/asdfasdf could not be found.")))
    	;
    }
    
    @Test
    public void createShouldPersistAndReturnObject() throws Exception {
	   long count = invDaoService.getPropertyService().count();	       
	   Property property = new Property(); 
       
       mockMvc.perform(post("/api/property/").content(this.mapper.writeValueAsString(property))
	   .accept(MediaType.APPLICATION_JSON).contentType(MediaType.APPLICATION_JSON))
       .andExpect(status().isOk())
       .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
       .andExpect(jsonPath("$.propertyId").value(IsNull.notNullValue()))  
       ;
       
       assertEquals("count should increase by 1", count +1 , invDaoService.getPropertyService().count());
	}
     
    @Test
    public void updateShouldPersistExistingAndReturnObject() throws Exception {
       long count = invDaoService.getPropertyService().count();

       mockMvc.perform(post("/api/property/"+ firstProperty.getPropertyId().toString())
    		   .content(this.mapper.writeValueAsString(firstProperty))
    		   .accept(MediaType.APPLICATION_JSON).contentType(MediaType.APPLICATION_JSON))
       .andExpect(status().isOk())
       .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
       .andExpect(jsonPath("$.propertyId", is(firstProperty.getPropertyId())))
       ;
         
       assertEquals("count NOT should increase", count , invDaoService.getPropertyService().count());
  	}  
    
    @Test
    public void updateByPathVariableIdShouldReturn404ForMismatchBetweenPathIdAndObjectId() throws Exception {	       
       String correctId =  firstProperty.getPropertyId().toString();
       // this ID manipulation should be overwritten with path variable id
       firstProperty.setPropertyId(-123);
       
       mockMvc.perform(post("/api/property/"+correctId)
    		   .content(this.mapper.writeValueAsString(firstProperty))
    		   .accept(MediaType.APPLICATION_JSON).contentType(MediaType.APPLICATION_JSON))
       .andExpect(status().isNotFound())
       .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
       .andExpect(jsonPath("$.message", is("/api/property/" +correctId +" could not be found.")))
       ;
  	} 
    
    @Test
    public void updateByPathVariableIdShouldReturn404ForBogusPathId() throws Exception {
    	mockMvc.perform(post("/api/property/-123")
    			.content(this.mapper.writeValueAsString(firstProperty))
    		   .accept(MediaType.APPLICATION_JSON).contentType(MediaType.APPLICATION_JSON))
    	.andExpect(status().isNotFound())
    	.andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
	    .andExpect(jsonPath("$.message", is("/api/property/-123 could not be found.")));
    }
    
    @Test
    public void deleteShouldDeleteAndReturnStatusOk() throws Exception {
        long count = invDaoService.getPropertyService().count();

        mockMvc.perform(delete("/api/property/"+ firstProperty.getPropertyId().toString()))
       .andExpect(status().isOk());  
       
       assertEquals("count should decrease by 1", count - 1 , invDaoService.getPropertyService().count());
    }
    
    @Test
    public void deleteShouldFailWithBogusId() throws Exception {
        long count = invDaoService.getPropertyService().count();

        mockMvc.perform(delete("/api/property/-123"))
       .andExpect(status().isNotFound())
       .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
       .andExpect(jsonPath("$.message", is("/api/property/-123 could not be found.")));  
       
       assertEquals("count should NOT decrease by 1", count , invDaoService.getPropertyService().count());
    }

    @Test
    public void listShouldReturnAllByDefault() throws Exception {
    	mockMvc.perform(get("/api/property/"))
         .andExpect(status().isOk())
         .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
         .andExpect(jsonPath("$.", hasSize(is(20))))
        .andExpect(jsonPath("$.[0].propertyId", is(firstProperty.getPropertyId())))
        ;
    }
    
    @Test
    public void listShouldReturnAllByDefaultWithoutTrailUrlSlash() throws Exception {
    	mockMvc.perform(get("/api/property"))
         .andExpect(status().isOk())
         .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
         .andExpect(jsonPath("$.", hasSize(is(20))))
        .andExpect(jsonPath("$.[0].propertyId", is(firstProperty.getPropertyId())))
        ;
    }
}