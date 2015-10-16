<%@ include file="/WEB-INF/include.jsp"  %>

<c:url value="/location/save" var="formActionUrl" />
<c:url value="/location/list" var="cancelUrl" />

<div class="row">
	<div class="col-xs-12 col-sm-8 col-md-6 col-lg-4">
		<form:form method="post" commandName="location" action="${ formActionUrl }" role="form">
    		<fieldset>
    		
    			<legend>Location</legend>
   
    
  				<form:hidden path="locationId" />
      
    
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
      
    
      			<spring:bind path="address1">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="address1" class="control-label">Address1</label>
    					<form:input path="address1"  class="form-control"/>
    				<form:errors path="address1" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="address2">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="address2" class="control-label">Address2</label>
    					<form:input path="address2"  class="form-control"/>
    				<form:errors path="address2" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="city">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="city" class="control-label">City</label>
    					<form:input path="city"  class="form-control"/>
    				<form:errors path="city" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="state">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="state" class="control-label">State</label>
    					<form:input path="state"  class="form-control"/>
    				<form:errors path="state" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="zipCode">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="zipCode" class="control-label">Zip Code</label>
    					<form:input path="zipCode"  class="form-control"/>
    				<form:errors path="zipCode" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
         			
    			<input type="submit" value="Save" class="btn btn-primary" />
    			<a class="btn btn-default" href="${ cancelUrl }">Cancel</a>
    			
    		</fieldset>
		</form:form>
	</div>
</div>