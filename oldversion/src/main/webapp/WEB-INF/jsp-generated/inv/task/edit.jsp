<%@ include file="/WEB-INF/include.jsp"  %>


<form:form method="post" commandName="task" action="save.html" >
    <fieldset>
        <legend>Task</legend>
        
        <form:hidden path="taskId" />
        
        <label for="taskType">TaskType</label>
        <form:input path="taskType"  />
        <br/>
        
        <label for="name">Name</label>
        <form:input path="name"  />
        <br/>
        
        <label for="created">Created</label>
        <form:input path="created" cssClass="dateInput" />
        <br/>
        
        <label for="createdBy">CreatedBy</label>
        <form:input path="createdBy"  />
        <br/>
        
        <label for="assignedTo">AssignedTo</label>
        <form:input path="assignedTo"  />
        <br/>
        
        <label for="deadline">Deadline</label>
        <form:input path="deadline" cssClass="dateInput" />
        <br/>
        
        <label for="completed">Completed</label>
        <form:input path="completed" cssClass="dateInput" />
        <br/>
        
        <label for="property.propertyId">Property</label>
        <form:select path="property.propertyId" items="${propertyList}" itemValue="propertyId" itemLabel="propertyId"/>
        <br/>

        
        <input type="submit" value="Save" class="btn btn-primary" />
        <a class="btn" href="list.html">Cancel</a>
    </fieldset>
</form:form>