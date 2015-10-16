package edu.uiowa.icts.inv.controller;


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

/**
 * Generated by Protogen
 * @since Fri Oct 16 11:14:57 CDT 2015
 */
public class LocationControllerMvcTest extends AbstractControllerMVCTests {
	
    private Location firstLocation;
    
    @Before
    public void before() {
              // add 20 records to test database
        for(int x=1; x<21; x++){
        	Location location = new Location();
        	invDaoService.getLocationService().save(location);
	        if (x == 1){
	        	// use this ID for update, show, and delete assertions
	        	firstLocation = location;
	        }
        }   
        this.invDaoService.getLocationService().getSession().flush();
        this.invDaoService.getLocationService().getSession().clear();
          }

    @Test
    public void addShouldDisplayNewLocationForm() throws Exception {
       mockMvc.perform(get("/location/add"))
       .andExpect(status().isOk())
       .andExpect(model().attributeExists("location")) 
       .andExpect(view().name("/inv/location/edit"));
    }
    
    @Test
    public void listShouldSimplyLoadPage() throws Exception {
       mockMvc.perform(get("/location/list"))
       .andExpect(status().isOk())
       .andExpect(view().name("/inv/location/list"));
    }
    
    @Test
    public void indexShouldDisplayListPage() throws Exception {
       mockMvc.perform(get("/location/"))
       .andExpect(status().isOk())
       .andExpect(view().name("/inv/location/list"));
    }
    
    @Test
    public void listAltShouldLoadListOfLocations() throws Exception {
       mockMvc.perform(get("/location/list_alt"))
       .andExpect(status().isOk())
       .andExpect(model().attributeExists("locationList")) 
       .andExpect(view().name("/inv/location/list_alt"));
    }
    
    
          	  
    @Test
    public void saveNewShouldPersistAndRedirectToListView() throws Exception {
       long count = invDaoService.getLocationService().count();
       
       mockMvc.perform(post("/location/save")).andExpect(status().is3xxRedirection()).andExpect(view().name("redirect:/location/list"));   
       
       assertEquals("count should increase by 1", count +1 , invDaoService.getLocationService().count());
	}
     
    @Test
    public void saveExistingShouldPersistAndRedirectToListView() throws Exception {
       long count = invDaoService.getLocationService().count();
         
       mockMvc.perform(post("/location/save").param("locationId", firstLocation.getLocationId().toString())).andExpect(status().is3xxRedirection()).andExpect(view().name("redirect:/location/list"));   
         
       assertEquals("count NOT should increase", count , invDaoService.getLocationService().count());
  	}      
  
    @Test
    public void editShouldLoadObjectAndDisplayForm() throws Exception {
    	mockMvc.perform(get("/location/edit").param("locationId", firstLocation.getLocationId().toString()))
         .andExpect(status().isOk())
         .andExpect(model().attributeExists("location")) 
         .andExpect(view().name("/inv/location/edit"));
    }
    
    @Test
    public void showShouldLoadAndDisplayObject() throws Exception {
    	mockMvc.perform(get("/location/show").param("locationId", firstLocation.getLocationId().toString()))
         .andExpect(status().isOk())
         .andExpect(model().attributeExists("location")) 
         .andExpect(view().name("/inv/location/show"));
    }
    
    @Test
    public void deleteGetShouldLoadAndDisplayYesNoButtons() throws Exception {
    	mockMvc.perform(get("/location/delete").param("locationId", firstLocation.getLocationId().toString()))
         .andExpect(status().isOk())
         .andExpect(model().attributeExists("location")) 
         .andExpect(view().name("/inv/location/delete"));
    }
    
    @Test
    public void deletePostSubmitYesShouldDeleteAndRedirectToListView() throws Exception {
        long count = invDaoService.getLocationService().count();

       mockMvc.perform(post("/location/delete").param("locationId", firstLocation.getLocationId().toString())
       .param("submit", "Yes")).andExpect(status().is3xxRedirection()).andExpect(view().name("redirect:/location/list"));  
       
       assertEquals("count should decrease by 1", count - 1 , invDaoService.getLocationService().count());
    }
    
    @Test
    public void deletePostSubmitNoShouldNotDeleteAndRedirectToListView() throws Exception {
        long count = invDaoService.getLocationService().count();

       mockMvc.perform(post("/location/delete").param("locationId", firstLocation.getLocationId().toString())
       .param("submit", "No")).andExpect(status().is3xxRedirection()).andExpect(view().name("redirect:/location/list"));  
       
       assertEquals("count should NOT decrease by 1", count , invDaoService.getLocationService().count());
    }
      
    @Test
    public void defaultDatatableShouldReturnJSONDataWith10Rows() throws Exception {
    	DataTableRequest dtr = getDataTableRequest( Arrays.asList("urls","address1","address2","city","description","locationId","name","propertys","state","zipCode" ));
    	ObjectMapper mapper = new ObjectMapper();
    	
    	mockMvc.perform(post("/location/datatable").content(mapper.writeValueAsString(dtr))
			.param("display", "list")
			.accept(MediaType.APPLICATION_JSON).contentType(MediaType.APPLICATION_JSON))
    	.andExpect(status().isOk())
    	.andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
    	.andExpect(jsonPath("$.recordsTotal", is((int) invDaoService.getLocationService().count())))
    	.andExpect(jsonPath("$.recordsFiltered", is((int) invDaoService.getLocationService().count())))
    	.andExpect(jsonPath("$.draw", is("1")))
    	// max # of returned data rows should be 10 per "length" value
    	.andExpect(jsonPath("$.data", hasSize(is(10))))
    	.andExpect(jsonPath("$.data[0][0]", containsString("show?")))
		.andExpect(jsonPath("$.data[0][0]", containsString("edit?")))
		.andExpect(jsonPath("$.data[0][0]", containsString("delete?")))
        ;
    }
    	  
    @Test
    public void defaultDatatableShouldReturnJSONDataWith10RowsAndDisplayAltnerateGlyphiconURLsAsEmptyByDefault() throws Exception {
    	DataTableRequest dtr = getDataTableRequest( Arrays.asList("urls","address1","address2","city","description","locationId","name","propertys","state","zipCode" ));
    	ObjectMapper mapper = new ObjectMapper();
    	
    	mockMvc.perform(post("/location/datatable").content(mapper.writeValueAsString(dtr))
			.param("display", "alternateURLs")
			.accept(MediaType.APPLICATION_JSON).contentType(MediaType.APPLICATION_JSON))
    	.andExpect(status().isOk())
    	.andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
    	.andExpect(jsonPath("$.recordsTotal", is((int) invDaoService.getLocationService().count())))
    	.andExpect(jsonPath("$.recordsFiltered", is((int) invDaoService.getLocationService().count())))
    	.andExpect(jsonPath("$.draw", is("1")))
    	// max # of returned data rows should be 10 per "length" value
    	.andExpect(jsonPath("$.data", hasSize(is(10))))
    	.andExpect(jsonPath("$.data[0][0]", is("")))
        ;
    }
    
    @Test
    public void defaultDatatableShouldReturnErrorTextForBogusColumnName() throws Exception {
    	DataTableRequest dtr = new DataTableRequest();
    	dtr.setStart(1);
    	dtr.setDraw("1");
    	dtr.setLength(10);
    	dtr.setIndividualSearch(true);
    	
    	List<DataTableColumn> columns = dtr.getColumns();
    	DataTableColumn column = new DataTableColumn("0", "asdfasdf", null, true, true, true);
    	DataTableSearch columnSearch = new DataTableSearch("", false);
    	column.setSearch(columnSearch);
    	columns.add(column);
    	dtr.setColumns(columns);
    	
    	ObjectMapper mapper = new ObjectMapper();
    	
    	mockMvc.perform(post("/location/datatable").content(mapper.writeValueAsString(dtr))
			.param("display", "list")
			.accept(MediaType.APPLICATION_JSON).contentType(MediaType.APPLICATION_JSON))
    	.andExpect(status().isOk())
    	.andExpect(content().contentType("application/json"))
    	.andExpect(jsonPath("$.recordsTotal", is((int) invDaoService.getLocationService().count())))
    	.andExpect(jsonPath("$.recordsFiltered", is((int) invDaoService.getLocationService().count())))
    	.andExpect(jsonPath("$.draw", is("1")))
    	.andExpect(jsonPath("$.data", hasSize(is(10))))
    	.andExpect(jsonPath("$.data[0].error", is("[error: column asdfasdf not supported]")))
    	;
    }    
    	  
    @Test
    public void defaultDatatableShouldReturnExceptionBecauseCantSearchColumnThatDoesntExist() throws Exception {			
		DataTableRequest dtr = new DataTableRequest();
    	dtr.setStart(1);
    	dtr.setDraw("1");
    	dtr.setLength(10);
    	dtr.setIndividualSearch(true);
    	
    	List<DataTableColumn> columns = dtr.getColumns();
    	DataTableColumn column = new DataTableColumn("0", "asdfasdf", null, true, true, true);
    	DataTableSearch columnSearch = new DataTableSearch("epic fail", false);
    	column.setSearch(columnSearch);
    	columns.add(column);
    	dtr.setColumns(columns);
    	
    	ObjectMapper mapper = new ObjectMapper();
    	
    	mockMvc.perform(post("/location/datatable").content(mapper.writeValueAsString(dtr))
			.param("display", "list")
			.accept(MediaType.APPLICATION_JSON).contentType(MediaType.APPLICATION_JSON))	
    	.andExpect(status().isOk())
    	.andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
    	.andExpect(jsonPath("$.recordsTotal", is(0)))
    	.andExpect(jsonPath("$.recordsFiltered", is(0)))
    	.andExpect(jsonPath("$.draw", is("1")))
    	.andExpect(jsonPath("$.data", hasSize(is(0))))
    	.andExpect(jsonPath("$.error", IsNull.notNullValue()))
    	;
    }      
          
    
}