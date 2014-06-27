<%@ include file="/WEB-INF/include.jsp"  %>


<form:form method="post" commandName="message" action="save.html" >
    <fieldset>
        <legend>Message</legend>
        
        <form:hidden path="messageId" />
        
        <label for="messageName">MessageName</label>
        <form:input path="messageName"  />
        <br/>
        
        <label for="messageType">MessageType</label>
        <form:input path="messageType"  />
        <br/>
        
        <label for="version">Version</label>
        <form:input path="version"  />
        <br/>
        
        <label for="messageText">MessageText</label>
        <form:input path="messageText"  />
        <br/>
        
        <label for="irbApproval">IrbApproval</label>
        <form:input path="irbApproval"  />
        <br/>
        
        <label for="irbApprovalStartDate">IrbApprovalStartDate</label>
        <form:input path="irbApprovalStartDate" cssClass="dateInput" />
        <br/>
        
        <label for="irbApprovalEndDate">IrbApprovalEndDate</label>
        <form:input path="irbApprovalEndDate" cssClass="dateInput" />
        <br/>
        
        <label for="description">Description</label>
        <form:input path="description"  />
        <br/>
        
        <input type="submit" value="Save" class="btn btn-primary" />
        <a class="btn" href="list.html">Cancel</a>
    </fieldset>
</form:form>