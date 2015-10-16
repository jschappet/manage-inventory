<%@ include file="/WEB-INF/include.jsp"  %>

<c:url value="/property/save" var="formActionUrl" />
<c:url value="/property/list" var="cancelUrl" />

<div class="row">
	<div class="col-xs-12 col-sm-8 col-md-6 col-lg-4">
		<form:form method="post" commandName="property" action="${ formActionUrl }" role="form">
    		<fieldset>
    		
    			<legend>Property</legend>
   
    
  				<form:hidden path="propertyId" />
      
    
      			<spring:bind path="name">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="name" class="control-label">Name</label>
    					<form:input path="name"  class="form-control"/>
    				<form:errors path="name" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="description">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="description" class="control-label">Description</label>
    					<form:input path="description"  class="form-control"/>
    				<form:errors path="description" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    <!-- 
      			<spring:bind path="createdBy">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="createdBy" class="control-label">Created By</label>
    					<form:input path="createdBy"  class="form-control"/>
    				<form:errors path="createdBy" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="created">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="created" class="control-label">Created</label>
    					<form:input path="created"  class="form-control dateinput" data-provide="datepicker" data-date-format="yyyy-mm-dd" data-date-autoclose="true"/>
    				<form:errors path="created" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="updatedBy">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="updatedBy" class="control-label">Updated By</label>
    					<form:input path="updatedBy"  class="form-control"/>
    				<form:errors path="updatedBy" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="updated">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="updated" class="control-label">Updated</label>
    					<form:input path="updated"  class="form-control dateinput" data-provide="datepicker" data-date-format="yyyy-mm-dd" data-date-autoclose="true"/>
    				<form:errors path="updated" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
     -->
          
    
      			<spring:bind path="location.locationId">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="location.locationId" class="control-label">Location</label>
    					<form:select path="location.locationId" items="${locationList}" itemValue="locationId" itemLabel="Name" class="form-control"/>
					<form:errors path="location" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
       			
    			<input type="submit" value="Save" class="btn btn-primary" />
    			<a class="btn btn-default" href="${ cancelUrl }">Cancel</a>
    			
    		</fieldset>
		</form:form>
	</div>
</div>