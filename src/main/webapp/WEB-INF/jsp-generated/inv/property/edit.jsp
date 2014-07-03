<%@ include file="/WEB-INF/include.jsp"  %>


<form:form method="post" commandName="property" action="save.html" >
    <fieldset>
        <legend>Property</legend>
        
        <form:hidden path="propertyId" />
        
        <label for="name">Name</label>
        <form:input path="name"  />
        <br/>
        
        <label for="description">Description</label>
        <form:input path="description"  />
        <br/>
        
        <label for="createdBy">CreatedBy</label>
        <form:input path="createdBy"  />
        <br/>
        
        <label for="created">Created</label>
        <form:input path="created" cssClass="dateInput" />
        <br/>
        
        <label for="updatedBy">UpdatedBy</label>
        <form:input path="updatedBy"  />
        <br/>
        
        <label for="updated">Updated</label>
        <form:input path="updated" cssClass="dateInput" />
        <br/>
        

        
        <label for="location.locationId">Location</label>
        <form:select path="location.locationId" items="${locationList}" itemValue="locationId" itemLabel="name"/>
        <br/>

        
        <input type="submit" value="Save" class="btn btn-primary" />
        <a class="btn" href="list.html">Cancel</a>
    </fieldset>
</form:form>