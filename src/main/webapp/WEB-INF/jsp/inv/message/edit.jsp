<%@ include file="/WEB-INF/include.jsp"  %>

<c:url value="/message/save" var="formActionUrl" />
<c:url value="/message/list" var="cancelUrl" />

<div class="row">
	<div class="col-xs-12 col-sm-8 col-md-6 col-lg-4">
		<form:form method="post" commandName="message" action="${ formActionUrl }" role="form">
    		<fieldset>
    		
    			<legend>Message</legend>
   
    
  				<form:hidden path="messageId" />
      
    
      			<spring:bind path="messageName">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="messageName" class="control-label">Message Name</label>
    					<form:input path="messageName"  class="form-control"/>
    				<form:errors path="messageName" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="messageType">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="messageType" class="control-label">Message Type</label>
    					<form:input path="messageType"  class="form-control"/>
    				<form:errors path="messageType" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="version">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="version" class="control-label">Version</label>
    					<form:input path="version"  class="form-control"/>
    				<form:errors path="version" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="messageText">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="messageText" class="control-label">Message Text</label>
    					<form:input path="messageText"  class="form-control"/>
    				<form:errors path="messageText" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="irbApproval">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="irbApproval" class="control-label">Irb Approval</label>
    					<form:input path="irbApproval"  class="form-control"/>
    				<form:errors path="irbApproval" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="irbApprovalStartDate">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="irbApprovalStartDate" class="control-label">Irb Approval Start Date</label>
    					<form:input path="irbApprovalStartDate"  class="form-control dateinput" data-provide="datepicker" data-date-format="yyyy-mm-dd" data-date-autoclose="true"/>
    				<form:errors path="irbApprovalStartDate" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="irbApprovalEndDate">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="irbApprovalEndDate" class="control-label">Irb Approval End Date</label>
    					<form:input path="irbApprovalEndDate"  class="form-control dateinput" data-provide="datepicker" data-date-format="yyyy-mm-dd" data-date-autoclose="true"/>
    				<form:errors path="irbApprovalEndDate" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="description">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="description" class="control-label">Description</label>
    					<form:input path="description"  class="form-control"/>
    				<form:errors path="description" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
       			
    			<input type="submit" value="Save" class="btn btn-primary" />
    			<a class="btn btn-default" href="${ cancelUrl }">Cancel</a>
    			
    		</fieldset>
		</form:form>
	</div>
</div>