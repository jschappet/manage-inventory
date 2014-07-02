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
@RequestMapping("/inv/property/*")
public class PropertyController extends AbstractInvController {

    private static final Log log = LogFactory.getLog(PropertyController.class);

    @RequestMapping(value = "list_alt.html", method = RequestMethod.GET)
    public ModelAndView listNoScript() {
        ModelMap model = new ModelMap();
        model.addAttribute("propertyList",invDaoService.getPropertyService().list());
        return new ModelAndView("inv/property/list_alt", model);
    }

    @RequestMapping(value = "list.html", method = RequestMethod.GET)
    public ModelAndView list() {
        return new ModelAndView("inv/property/list");
    }

    @RequestMapping(value = "datatable.html", method = RequestMethod.GET)
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

            Integer count = invDaoService.getPropertyService().count( options );

            options.setLimit(limit);
            options.setStart(start);
            options.setSorts(sorts);

            List<Property> propertyList = invDaoService.getPropertyService().list( options );

            JSONObject ob = new JSONObject();
            ob.put("sEcho", echo);
            ob.put("iTotalDisplayRecords", count);
            ob.put("iTotalRecords", count);
            String urls;
            JSONArray jsonArray = new JSONArray();
            JSONArray tmp;
            for( Property property : propertyList ){
                tmp = new JSONArray();
                for(String column : colArr){
                    if( "propertyId".equals(column) ){
                        tmp.put(property.getPropertyId());
                    } else if( "name".equals(column) ){
                        tmp.put(property.getName());
                    } else if( "description".equals(column) ){
                        tmp.put(property.getDescription());
                    } else if( "location".equals(column) ){
                        tmp.put(property.getLocation());
                    } else if( "createdBy".equals(column) ){
                        tmp.put(property.getCreatedBy());
                    } else if( "created".equals(column) ){
                        tmp.put(property.getCreated());
                    } else if( "updatedBy".equals(column) ){
                        tmp.put(property.getUpdatedBy());
                    } else if( "updated".equals(column) ){
                        tmp.put(property.getUpdated());
                    } else if( "tasks".equals(column) ){
                        tmp.put(property.getTasks());
                    } else if( "urls".equals(column)) {
                        urls = "";
                        if("list".equals(display)){
                            urls += "<a href=\"show.html?"+"propertyId="+property.getPropertyId()+"\">[view]</a>";
                            urls += "<a href=\"edit.html?"+"propertyId="+property.getPropertyId()+"\">[edit]</a>";
                            urls += "<a href=\"delete.html?"+"propertyId="+property.getPropertyId()+"\">[delete]</a>";
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

    @RequestMapping(value = "add.html", method = RequestMethod.GET)
    public ModelAndView add() {
        ModelMap model = new ModelMap();
        Property property = new Property();
        model.addAttribute("property",property);
        return new ModelAndView("inv/property/edit",model);
    }

    @RequestMapping(value = "edit.html", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam("propertyId") Integer propertyId) {
        ModelMap model = new ModelMap();
        Property property = invDaoService.getPropertyService().findById(propertyId);
        model.addAttribute("property",property);
        return new ModelAndView("inv/property/edit",model);
    }

    @RequestMapping(value = "show.html", method = RequestMethod.GET)
    public ModelAndView show(@RequestParam("propertyId") Integer propertyId) {
        ModelMap model = new ModelMap();
        Property property = invDaoService.getPropertyService().findById(propertyId);
        model.addAttribute("property",property);
        return new ModelAndView("inv/property/show",model);
    }

    @RequestMapping(value = "save.html", method = RequestMethod.POST)
    public String save(@ModelAttribute("property") Property property) {
        invDaoService.getPropertyService().saveOrUpdate(property);
        return "redirect:/inv/property/list.html";
    }

    @RequestMapping(value = "delete.html", method = RequestMethod.GET)
    public String delete(@RequestParam("propertyId") Integer propertyId) {
        Property property = invDaoService.getPropertyService().findById(propertyId);
        invDaoService.getPropertyService().delete(property);
        return "redirect:/inv/property/list.html";
    }
}