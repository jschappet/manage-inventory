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
 * @since Fri Oct 16 11:14:56 CDT 2015
 */
public class TaskControllerMvcTest extends AbstractControllerMVCTests {
	
    private Task firstTask;
    
    @Before
    public void before() {
              // add 20 records to test database
        for(int x=1; x<21; x++){
        	Task task = new Task();
        	invDaoService.getTaskService().save(task);
	        if (x == 1){
	        	// use this ID for update, show, and delete assertions
	        	firstTask = task;
	        }
        }   
        this.invDaoService.getTaskService().getSession().flush();
        this.invDaoService.getTaskService().getSession().clear();
          }

    @Test
    public void addShouldDisplayNewTaskForm() throws Exception {
       mockMvc.perform(get("/task/add"))
       .andExpect(status().isOk())
       .andExpect(model().attributeExists("task")) 
       .andExpect(view().name("/inv/task/edit"));
    }
    
    @Test
    public void listShouldSimplyLoadPage() throws Exception {
       mockMvc.perform(get("/task/list"))
       .andExpect(status().isOk())
       .andExpect(view().name("/inv/task/list"));
    }
    
    @Test
    public void indexShouldDisplayListPage() throws Exception {
       mockMvc.perform(get("/task/"))
       .andExpect(status().isOk())
       .andExpect(view().name("/inv/task/list"));
    }
    
    @Test
    public void listAltShouldLoadListOfTasks() throws Exception {
       mockMvc.perform(get("/task/list_alt"))
       .andExpect(status().isOk())
       .andExpect(model().attributeExists("taskList")) 
       .andExpect(view().name("/inv/task/list_alt"));
    }
    
    
          	  
    @Test
    public void saveNewShouldPersistAndRedirectToListView() throws Exception {
       long count = invDaoService.getTaskService().count();
       
       mockMvc.perform(post("/task/save")).andExpect(status().is3xxRedirection()).andExpect(view().name("redirect:/task/list"));   
       
       assertEquals("count should increase by 1", count +1 , invDaoService.getTaskService().count());
	}
     
    @Test
    public void saveExistingShouldPersistAndRedirectToListView() throws Exception {
       long count = invDaoService.getTaskService().count();
         
       mockMvc.perform(post("/task/save").param("taskId", firstTask.getTaskId().toString())).andExpect(status().is3xxRedirection()).andExpect(view().name("redirect:/task/list"));   
         
       assertEquals("count NOT should increase", count , invDaoService.getTaskService().count());
  	}      
  
    @Test
    public void editShouldLoadObjectAndDisplayForm() throws Exception {
    	mockMvc.perform(get("/task/edit").param("taskId", firstTask.getTaskId().toString()))
         .andExpect(status().isOk())
         .andExpect(model().attributeExists("task")) 
         .andExpect(view().name("/inv/task/edit"));
    }
    
    @Test
    public void showShouldLoadAndDisplayObject() throws Exception {
    	mockMvc.perform(get("/task/show").param("taskId", firstTask.getTaskId().toString()))
         .andExpect(status().isOk())
         .andExpect(model().attributeExists("task")) 
         .andExpect(view().name("/inv/task/show"));
    }
    
    @Test
    public void deleteGetShouldLoadAndDisplayYesNoButtons() throws Exception {
    	mockMvc.perform(get("/task/delete").param("taskId", firstTask.getTaskId().toString()))
         .andExpect(status().isOk())
         .andExpect(model().attributeExists("task")) 
         .andExpect(view().name("/inv/task/delete"));
    }
    
    @Test
    public void deletePostSubmitYesShouldDeleteAndRedirectToListView() throws Exception {
        long count = invDaoService.getTaskService().count();

       mockMvc.perform(post("/task/delete").param("taskId", firstTask.getTaskId().toString())
       .param("submit", "Yes")).andExpect(status().is3xxRedirection()).andExpect(view().name("redirect:/task/list"));  
       
       assertEquals("count should decrease by 1", count - 1 , invDaoService.getTaskService().count());
    }
    
    @Test
    public void deletePostSubmitNoShouldNotDeleteAndRedirectToListView() throws Exception {
        long count = invDaoService.getTaskService().count();

       mockMvc.perform(post("/task/delete").param("taskId", firstTask.getTaskId().toString())
       .param("submit", "No")).andExpect(status().is3xxRedirection()).andExpect(view().name("redirect:/task/list"));  
       
       assertEquals("count should NOT decrease by 1", count , invDaoService.getTaskService().count());
    }
      
    @Test
    public void defaultDatatableShouldReturnJSONDataWith10Rows() throws Exception {
    	DataTableRequest dtr = getDataTableRequest( Arrays.asList("urls","assignedTo","completed","created","createdBy","deadline","name","property","taskId","taskType" ));
    	ObjectMapper mapper = new ObjectMapper();
    	
    	mockMvc.perform(post("/task/datatable").content(mapper.writeValueAsString(dtr))
			.param("display", "list")
			.accept(MediaType.APPLICATION_JSON).contentType(MediaType.APPLICATION_JSON))
    	.andExpect(status().isOk())
    	.andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
    	.andExpect(jsonPath("$.recordsTotal", is((int) invDaoService.getTaskService().count())))
    	.andExpect(jsonPath("$.recordsFiltered", is((int) invDaoService.getTaskService().count())))
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
    	DataTableRequest dtr = getDataTableRequest( Arrays.asList("urls","assignedTo","completed","created","createdBy","deadline","name","property","taskId","taskType" ));
    	ObjectMapper mapper = new ObjectMapper();
    	
    	mockMvc.perform(post("/task/datatable").content(mapper.writeValueAsString(dtr))
			.param("display", "alternateURLs")
			.accept(MediaType.APPLICATION_JSON).contentType(MediaType.APPLICATION_JSON))
    	.andExpect(status().isOk())
    	.andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
    	.andExpect(jsonPath("$.recordsTotal", is((int) invDaoService.getTaskService().count())))
    	.andExpect(jsonPath("$.recordsFiltered", is((int) invDaoService.getTaskService().count())))
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
    	
    	mockMvc.perform(post("/task/datatable").content(mapper.writeValueAsString(dtr))
			.param("display", "list")
			.accept(MediaType.APPLICATION_JSON).contentType(MediaType.APPLICATION_JSON))
    	.andExpect(status().isOk())
    	.andExpect(content().contentType("application/json"))
    	.andExpect(jsonPath("$.recordsTotal", is((int) invDaoService.getTaskService().count())))
    	.andExpect(jsonPath("$.recordsFiltered", is((int) invDaoService.getTaskService().count())))
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
    	
    	mockMvc.perform(post("/task/datatable").content(mapper.writeValueAsString(dtr))
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