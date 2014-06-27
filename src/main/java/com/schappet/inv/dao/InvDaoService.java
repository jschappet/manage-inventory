package com.schappet.inv.dao;

import edu.uiowa.icts.spring.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.schappet.inv.dao.*;

/**
 * Generated by Protogen
 * Fri Jun 27 07:27:13 CDT 2014
 */

@Component
public class InvDaoService {





    /*********** messageService ****************/
    private MessageService messageService; 

    public MessageService getMessageService() {
        return messageService;
    }

    @Autowired 
    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }




    /*********** systemSettingService ****************/
    private SystemSettingService systemSettingService; 

    public SystemSettingService getSystemSettingService() {
        return systemSettingService;
    }

    @Autowired 
    public void setSystemSettingService(SystemSettingService systemSettingService) {
        this.systemSettingService = systemSettingService;
    }




    /*********** propertyService ****************/
    private PropertyService propertyService; 

    public PropertyService getPropertyService() {
        return propertyService;
    }

    @Autowired 
    public void setPropertyService(PropertyService propertyService) {
        this.propertyService = propertyService;
    }




    /*********** taskService ****************/
    private TaskService taskService; 

    public TaskService getTaskService() {
        return taskService;
    }

    @Autowired 
    public void setTaskService(TaskService taskService) {
        this.taskService = taskService;
    }


}
