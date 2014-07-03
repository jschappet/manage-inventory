<%@ include file="/WEB-INF/include.jsp"  %>


<form:form method="post" commandName="location" action="save.html" >
    <fieldset>
        <legend>Location</legend>
        
        <form:hidden path="locationId" />
        
        <label for="name">Name</label>
        <form:input path="name"  />
        <br/>
        
        <label for="description">Description</label>
        <form:input path="description"  />
        <br/>
        
        <label for="address1">Address1</label>
        <form:input path="address1"  />
        <br/>
        
        <label for="address2">Address2</label>
        <form:input path="address2"  />
        <br/>
        
        <label for="city">City</label>
        <form:input path="city"  />
        <br/>
        
        <label for="state">State</label>
        <form:input path="state"  />
        <br/>
        
        <label for="zipCode">ZipCode</label>
        <form:input path="zipCode"  />
        <br/>
        

        
        <input type="submit" value="Save" class="btn btn-primary" />
        <a class="btn" href="list.html">Cancel</a>
    </fieldset>
</form:form>