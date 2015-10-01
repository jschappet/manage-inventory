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
        
        <label for="assignedTo">AssignedTo</label>
        <form:select path="assignedTo" items="${personList}" itemValue="username" itemLabel="username"/>
        <br/>
        
        <label for="deadline">Deadline</label>
        <form:input path="deadline" cssClass="dateInput" />
        <br/>
        
        <label for="property.propertyId">Property</label>
        <form:select path="property.propertyId" items="${propertyList}" itemValue="propertyId" itemLabel="name"/>
        <br/>

        
        <input type="submit" value="Save" class="btn btn-primary" />
        <a class="btn" href="list.html">Cancel</a>
    </fieldset>
</form:form>