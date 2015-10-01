<%@ include file="/WEB-INF/include.jsp"  %>


<form:form method="post" commandName="systemSetting" action="save.html" >
    <fieldset>
        <legend>SystemSetting</legend>
        
        <form:hidden path="name" />
        
        <label for="value">Value</label>
        <form:input path="value"  />
        <br/>
        
        <label for="active">Active</label>
        <form:input path="active"  />
        <br/>
        
        <label for="notes">Notes</label>
        <form:input path="notes"  />
        <br/>
        
        <label for="lastUpdatedBy">LastUpdatedBy</label>
        <form:input path="lastUpdatedBy"  />
        <br/>
        
        <label for="lastUpdated">LastUpdated</label>
        <form:input path="lastUpdated" cssClass="dateInput" />
        <br/>
        
        <input type="submit" value="Save" class="btn btn-primary" />
        <a class="btn" href="list.html">Cancel</a>
    </fieldset>
</form:form>