package edu.uiowa.icts.util;

import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import edu.uiowa.icts.inv.dao.InvDaoService;
import edu.uiowa.icts.inv.domain.Task;
import edu.uiowa.icts.inv.domain.WorkLog;

@Component
public class WorkLogManager {
	
    private static final Log log = LogFactory.getLog( WorkLogManager.class );
    
    @Autowired
	protected InvDaoService invDaoService;

    private String username = "DEFAULT";
    private String notes = "THESE ARE DEFAULT NOTES";
    
    private WorkLog wl;
    private Task t ;
    
    public WorkLogManager() { }
    
    
    public void setTask(Task t) {
    	this.t = t;
    	this.wl = new WorkLog();
    	wl.setAssignedTo(t.getAssignedTo());
    	wl.setCreated(new Date());
    	wl.setCreatedBy(username);
    	wl.setTaskType(t.getTaskType());
    	wl.setProperty(t.getProperty());
    	wl.setDeadline(t.getDeadline());
    	wl.setName(t.getName());
    }

    public void completeTask() {
    	wl.setCompleted( new Date());
    	wl.setAssignedTo(username);
    	wl.setNote(notes);
    	invDaoService.getWorkLogService().save(wl);
    	invDaoService.getTaskService().delete(t);
    	
    }

    
    public void completeTask(String username, String notes) {
    	this.username = username;
    	this.notes = notes;
    	completeTask();
    }
}

