package edu.uiowa.icts.inv.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Generated by Protogen
 * @since 10/16/2015 11:14:56 CDT
 */
@Component
public class InvDaoService {

	@Autowired
	private MessageService messageService;

    public MessageService getMessageService() {
        return messageService;
    }

	@Autowired
	private SystemSettingService systemSettingService;

    public SystemSettingService getSystemSettingService() {
        return systemSettingService;
    }

	@Autowired
	private PropertyService propertyService;

    public PropertyService getPropertyService() {
        return propertyService;
    }

	@Autowired
	private TaskService taskService;

    public TaskService getTaskService() {
        return taskService;
    }

	@Autowired
	private PersonService personService;

    public PersonService getPersonService() {
        return personService;
    }

	@Autowired
	private LocationService locationService;

    public LocationService getLocationService() {
        return locationService;
    }

	@Autowired
	private RoleService roleService;

    public RoleService getRoleService() {
        return roleService;
    }

	@Autowired
	private PersonRoleService personRoleService;

    public PersonRoleService getPersonRoleService() {
        return personRoleService;
    }

}
