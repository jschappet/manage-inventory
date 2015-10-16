package edu.uiowa.icts.inv.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import edu.uiowa.icts.datatable.DataTableColumn;
import edu.uiowa.icts.datatable.DataTableRequest;
import edu.uiowa.icts.datatable.DataTableSearch;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.*;
import edu.uiowa.icts.inv.dao.InvDaoService;

/**
 * Generated by Protogen
 * @since Fri Oct 16 11:14:57 CDT 2015
 */
@Transactional
@WebAppConfiguration
@RunWith( SpringJUnit4ClassRunner.class )
@ContextConfiguration( { "classpath:spring/dispatcher-servlet.xml" } )
public abstract class AbstractControllerMVCTests {
	
	protected final Log log = LogFactory.getLog( getClass() );
	
	@Autowired
	protected InvDaoService invDaoService;
	
	@Autowired
	protected WebApplicationContext wac;

	protected MockMvc mockMvc;
	
	@Before
	public final void setUpInvDaoServiceControllerMVCTests() {
		log.debug( "setting up mock MVC and loading security configuration" );
		this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).apply(springSecurity()).build();
	}
	
	protected DataTableRequest getDataTableRequest(List<String> columnNames) {

    	DataTableRequest dtr = new DataTableRequest();
    	dtr.setStart(1);
    	dtr.setDraw("1");
    	dtr.setLength(10);
    	dtr.setIndividualSearch(true);
    	List<DataTableColumn> columns = dtr.getColumns();
    	
    	int count = 0;
    	for (String colName : columnNames) {
    		DataTableColumn column = new DataTableColumn();
        	column.setSearchable(true);
        	column.setOrderable(true);
        	column.setName(colName);
        	column.setData("" + count++);
        	DataTableSearch columnSearch = new DataTableSearch();
        	columnSearch.setRegex(false);
        	columnSearch.setValue("");
        	column.setSearch(columnSearch);
        	columns.add(column);
        	dtr.setColumns(columns);	
    	}
    	return dtr;
    }
	
}