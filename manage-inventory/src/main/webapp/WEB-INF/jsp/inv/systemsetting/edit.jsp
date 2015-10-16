<%@ include file="/WEB-INF/include.jsp"  %>

<c:url value="/systemsetting/save" var="formActionUrl" />
<c:url value="/systemsetting/list" var="cancelUrl" />

<div class="row">
	<div class="col-xs-12 col-sm-8 col-md-6 col-lg-4">
		<form:form method="post" commandName="systemSetting" action="${ formActionUrl }" role="form">
    		<fieldset>
    		
    			<legend>System Setting</legend>
   
    
  				<form:hidden path="name" />
      
    
      			<spring:bind path="value">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="value" class="control-label">Value</label>
    					<form:input path="value"  class="form-control"/>
    				<form:errors path="value" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="active">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="active" class="control-label">Active</label>
    					<form:input path="active"  class="form-control"/>
    				<form:errors path="active" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="notes">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="notes" class="control-label">Notes</label>
    					<form:input path="notes"  class="form-control"/>
    				<form:errors path="notes" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="lastUpdatedBy">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="lastUpdatedBy" class="control-label">Last Updated By</label>
    					<form:input path="lastUpdatedBy"  class="form-control"/>
    				<form:errors path="lastUpdatedBy" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="lastUpdated">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="lastUpdated" class="control-label">Last Updated</label>
    					<form:input path="lastUpdated"  class="form-control dateinput" data-provide="datepicker" data-date-format="yyyy-mm-dd" data-date-autoclose="true"/>
    				<form:errors path="lastUpdated" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
       			
    			<input type="submit" value="Save" class="btn btn-primary" />
    			<a class="btn btn-default" href="${ cancelUrl }">Cancel</a>
    			
    		</fieldset>
		</form:form>
	</div>
</div>