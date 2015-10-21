<%@ include file="/WEB-INF/include.jsp"  %>

<h2>My Tasks</h2>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>


<jsp:include page="/WEB-INF/jsp/angular-task.jsp" >
	<jsp:param name="restApiUrl" value="/api"/>
	<jsp:param name="resourceName" value="task"/>
	<jsp:param name="resourceId" value="taskId"/>
</jsp:include>

<c:url value="/task/add" var="addUrl" />
<a href="${ addUrl }" class="btn btn-default">Add</a>



<div class="modal fade" role="dialog" id="add_task">
  <div class="modal-dialog">
  
	
	<form:form method="post" commandName="task" action="${ addUrl }" role="form">
	<div class="modal-content">
        
	
		<div class="modal-header">
			<h3>Add New Task</h3>
		</div>
		<div class="modal-body">

		
    		<fieldset>
    		
    			<legend>Task</legend>
   
    
  				<form:hidden path="taskId" />
      
    
    			<spring:bind path="property.propertyId">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="property.propertyId" class="control-label">Property</label>
    					<form:select path="property.propertyId" items="${propertyList}" itemValue="propertyId" itemLabel="name" class="form-control"/>
					<form:errors path="property" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
       			
      			<spring:bind path="taskType">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="taskType" class="control-label">Task Type</label>
    					<form:select path="taskType" items="${taskTypeList}" itemValue="name" itemLabel="name" class="form-control"/>
    					<form:errors path="taskType" class="help-block" element="span" />
    	     		</div>
				</spring:bind>	
      
    
      			<spring:bind path="name">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="name" class="control-label">Name</label>
    					<form:input path="name"  class="form-control"/>
    				<form:errors path="name" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
      
    
      			<spring:bind path="assignedTo">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="assignedTo" class="control-label">Assigned To</label>
    					<form:input path="assignedTo"  class="form-control"/>
    				<form:errors path="assignedTo" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="deadline">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="deadline" class="control-label">Deadline</label>
    					<form:input path="deadline"  class="form-control dateinput" data-provide="datepicker" data-date-format="yyyy-mm-dd" data-date-autoclose="true"/>
    				<form:errors path="deadline" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
    
      			
    		</fieldset>
		
		</div>
	
		<div class="modal-footer">
			<input type="submit" name="submit" value="Save" class="btn btn-success" />
			<a class="btn btn-primary" data-dismiss="modal">Cancel</a>
		</div>
		</div>
	</form:form>
	</div>
</div>
