package edu.uiowa.icts.util;

import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import edu.uiowa.icts.inv.dao.InvDaoService;
import edu.uiowa.icts.inv.domain.Task;
import edu.uiowa.icts.inv.domain.WorkLog;

public class WorkLogManager {
	
    private static final Log log = LogFactory.getLog( WorkLogManager.class );
    
    public WorkLogManager() { }
    

    static public WorkLog completeTask(Task t) {
    	String username = "DEFAULT";
        String notes = "THESE ARE DEFAULT NOTES";
        return completeTask(t, username, notes);	
    }

    
    static public WorkLog completeTask(Task t, String username, String notes) {
    	
    	WorkLog wl = new WorkLog();
    	wl.setAssignedTo(t.getAssignedTo());
    	wl.setCreated(new Date());
    	wl.setCreatedBy(username);
    	
    	wl.setTaskType(t.getTaskType());
    	wl.setProperty(t.getProperty());
    	wl.setDeadline(t.getDeadline());
    	wl.setName(t.getName());
    	
    	wl.setCompleted( new Date());
    	wl.setAssignedTo(username);
    	wl.setNote(notes);
    	//invDaoService.getWorkLogService().save(wl);
    	//invDaoService.getTaskService().delete(t);
    	return wl;
    	
    }
}

