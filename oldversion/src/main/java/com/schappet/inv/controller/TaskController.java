package com.schappet.inv.controller;

import com.schappet.inv.domain.*;
import com.schappet.inv.dao.*;
import edu.uiowa.icts.spring.*;
import edu.uiowa.icts.util.SortColumn;
import edu.uiowa.icts.spring.GenericDaoListOptions;
import java.io.IOException;
import java.io.StringReader;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import java.util.HashMap;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.apache.commons.io.IOUtils;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.logging.Log;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Generated by Protogen
 * Fri Jun 27 07:27:13 CDT 2014
 */
@Controller
@RequestMapping("/inv/task/*")
public class TaskController extends AbstractInvController {

    private static final Log log = LogFactory.getLog(TaskController.class);

    @RequestMapping(value = "list_alt", method = RequestMethod.GET)
    public ModelAndView listNoScript() {
        ModelMap model = new ModelMap();
        model.addAttribute("taskList",invDaoService.getTaskService().list());
        return new ModelAndView("inv/task/list_alt", model);
    }
    
    
    @RequestMapping(value = "mylist", method = RequestMethod.GET)
    public ModelAndView myTasks() {
        ModelMap model = new ModelMap();
        model.addAttribute("taskList",invDaoService.getTaskService().listByUsername(getUsername()));
        return new ModelAndView("/inv/task/mylist", model);
    }

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public ModelAndView list() {
        return new ModelAndView("inv/task/list");
    }

    @RequestMapping(value = "datatable", method = RequestMethod.GET)
    public void datatable( HttpServletRequest request, HttpServletResponse response, 
        @RequestParam(value="iDisplayLength") Integer limit, 
        @RequestParam(value="iDisplayStart") Integer start, 
        @RequestParam(value="iColumns") Integer numberColumns, 
        @RequestParam(value="iColumns") Integer columnCount, 
        @RequestParam(value="sColumns") String columns, 
        @RequestParam(value="sEcho") String echo, 
        @RequestParam(value="bFilter") String bFilter, 
        @RequestParam(value="iSortingCols", required=false) Integer sortingColsCount, 
        @RequestParam(value="sSearch", required=false) String search, 
        @RequestParam(value="display", required=false, defaultValue="list") String display ) {

        ArrayList<SortColumn> sorts = new ArrayList<SortColumn>();
        try {

            response.setContentType("application/json");

            String[] colArr = columns.split(",");

            if( sortingColsCount != null ){
                for( int i = 0; i < sortingColsCount; i++){
                    if( i < colArr.length ){
                        Integer colnum = null;
                        String col = request.getParameter("iSortCol_"+i);
                        if(col != null){
                            try {
                                colnum = Integer.parseInt(col);
                            } catch (NumberFormatException e) {
                                continue;
                            }
                            if(colnum != null){
                                sorts.add(new SortColumn(colArr[colnum], request.getParameter("sSortDir_"+i)));
                            }
                        }
                    }
                }
            }

            Boolean searchable;
            Boolean filtered = Boolean.valueOf(bFilter);
            ArrayList<String> searchColumns = new ArrayList<String>();
            HashMap<String,Object> likes = new HashMap<String, Object>();
            if( filtered ){
                for( int i = 0; i < numberColumns; i++ ){
                    searchable = Boolean.valueOf(request.getParameter("bSearchable_"+i));
                    if( searchable ){
                        searchColumns.add(colArr[i]);
                    }
                }
            } else {
                for(String column : colArr){
                    String columnValue = request.getParameter( column );
                    if( columnValue != null ){
                        likes.put(column, columnValue);
                    }
                }
            }

            GenericDaoListOptions options = new GenericDaoListOptions();
            options.setIndividualLikes(likes);
            options.setSearch(search);
            options.setSearchColumns(searchColumns);

            Integer count = invDaoService.getTaskService().count( options );

            options.setLimit(limit);
            options.setStart(start);
            options.setSorts(sorts);

            List<Task> taskList = invDaoService.getTaskService().list( options );

            JSONObject ob = new JSONObject();
            ob.put("sEcho", echo);
            ob.put("iTotalDisplayRecords", count);
            ob.put("iTotalRecords", count);
            String urls;
            JSONArray jsonArray = new JSONArray();
            JSONArray tmp;
            for( Task task : taskList ){
                tmp = new JSONArray();
                for(String column : colArr){
                    if( "taskId".equals(column) ){
                        tmp.put(task.getTaskId());
                    } else if( "taskType".equals(column) ){
                        tmp.put(task.getTaskType());
                    } else if( "name".equals(column) ){
                        tmp.put(task.getName());
                    } else if( "created".equals(column) ){
                        tmp.put(task.getCreated());
                    } else if( "createdBy".equals(column) ){
                        tmp.put(task.getCreatedBy());
                    } else if( "assignedTo".equals(column) ){
                        tmp.put(task.getAssignedTo());
                    } else if( "deadline".equals(column) ){
                        tmp.put(task.getDeadline());
                    } else if( "completed".equals(column) ){
                        tmp.put(task.getCompleted());
                    } else if( "property".equals(column) ){
                        tmp.put(task.getProperty().getName());
                    } else if( "urls".equals(column)) {
                        urls = "";
                        if("list".equals(display)){
                            urls += "<a href=\"show?"+"taskId="+task.getTaskId()+"\">[view]</a>";
                            urls += "<a href=\"edit?"+"taskId="+task.getTaskId()+"\">[edit]</a>";
                            urls += "<a href=\"delete?"+"taskId="+task.getTaskId()+"\">[delete]</a>";
                        } else {

                        }
                        tmp.put(urls);
                    } else {
                        tmp.put("[error column "+column+" not supported]");
                    }
                }
                jsonArray.put(tmp);
            }
            ob.put("aaData", jsonArray);

            StringReader reader = new StringReader(ob.toString());
            IOUtils.copy(reader, response.getOutputStream());
            reader.close();
        } catch (Exception e) {
            try {
                log.error("error builing datatable json object",e);
                String stackTrace = "";
                for( StackTraceElement ste : e.getStackTrace() ){
                    stackTrace += ste.toString()+"<br/>";
                }
                JSONObject ob = new JSONObject();
                ob.put("sEcho", echo);
                ob.put("iTotalDisplayRecords", 0);
                ob.put("iTotalRecords", 0);
                ob.put("error", e.getMessage());
                ob.put("stackTrace", stackTrace);
                StringReader reader = new StringReader(ob.toString());
                IOUtils.copy(reader, response.getOutputStream());
                reader.close();
                return;
            } catch (JSONException je) {
                log.error("error writing json error to page", je);
            } catch (IOException ioe) {
                log.error("error writing json error to page", ioe);
            }
        }
    }

    @RequestMapping(value = "add", method = RequestMethod.GET)
    public ModelAndView add() {
        ModelMap model = new ModelMap();
        Task task = new Task();
        model.addAttribute("task",task);
        model.addAttribute("propertyList",invDaoService.getPropertyService().list());
        model.addAttribute("personList",invDaoService.getPersonService().list());
        return new ModelAndView("inv/task/edit",model);
    }

    @RequestMapping(value = "edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam("taskId") Integer taskId) {
        ModelMap model = new ModelMap();
        model.addAttribute("propertyList",invDaoService.getPropertyService().list());
        Task task = invDaoService.getTaskService().findById(taskId);
        model.addAttribute("task",task);
        return new ModelAndView("inv/task/edit",model);
    }

    @RequestMapping(value = "show", method = RequestMethod.GET)
    public ModelAndView show(@RequestParam("taskId") Integer taskId) {
        ModelMap model = new ModelMap();
        Task task = invDaoService.getTaskService().findById(taskId);
        model.addAttribute("task",task);
        return new ModelAndView("inv/task/show",model);
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(@RequestParam("property.propertyId") Integer property_propertyId, @ModelAttribute("task") Task task) {
    	task.setCreated(new Date());
    	task.setCreatedBy(getUsername());
    	
    	task.setProperty(invDaoService.getPropertyService().findById(property_propertyId));
        invDaoService.getTaskService().saveOrUpdate(task);
        return "redirect:/inv/task/list";
    }

    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String delete(@RequestParam("taskId") Integer taskId) {
        Task task = invDaoService.getTaskService().findById(taskId);
        invDaoService.getTaskService().delete(task);
        return "redirect:/inv/task/list";
    }
}