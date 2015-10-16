<%@ include file="/WEB-INF/include.jsp"  %>

<c:url value="/task/save" var="formActionUrl" />
<c:url value="/task/list" var="cancelUrl" />

<div class="row">
	<div class="col-xs-12 col-sm-8 col-md-6 col-lg-4">
		<form:form method="post" commandName="task" action="${ formActionUrl }" role="form">
    		<fieldset>
    		
    			<legend>Task</legend>
   
    
  				<form:hidden path="taskId" />
      
    
      			<spring:bind path="taskType">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="taskType" class="control-label">Task Type</label>
    					<form:input path="taskType"  class="form-control"/>
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
      
    
      			<spring:bind path="created">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="created" class="control-label">Created</label>
    					<form:input path="created"  class="form-control dateinput" data-provide="datepicker" data-date-format="yyyy-mm-dd" data-date-autoclose="true"/>
    				<form:errors path="created" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="createdBy">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="createdBy" class="control-label">Created By</label>
    					<form:input path="createdBy"  class="form-control"/>
    				<form:errors path="createdBy" class="help-block" element="span" />
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
      
    
      			<spring:bind path="completed">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="completed" class="control-label">Completed</label>
    					<form:input path="completed"  class="form-control dateinput" data-provide="datepicker" data-date-format="yyyy-mm-dd" data-date-autoclose="true"/>
    				<form:errors path="completed" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
        
    
      			<spring:bind path="property.propertyId">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="property.propertyId" class="control-label">Property</label>
    					<form:select path="property.propertyId" items="${propertyList}" itemValue="propertyId" itemLabel="propertyId" class="form-control"/>
					<form:errors path="property" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
       			
    			<input type="submit" value="Save" class="btn btn-primary" />
    			<a class="btn btn-default" href="${ cancelUrl }">Cancel</a>
    			
    		</fieldset>
		</form:form>
	</div>
</div>