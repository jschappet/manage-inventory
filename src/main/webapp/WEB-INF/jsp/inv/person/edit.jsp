<%@ include file="/WEB-INF/include.jsp"  %>

<c:url value="/person/save" var="formActionUrl" />
<c:url value="/person/list" var="cancelUrl" />

<div class="row">
	<div class="col-xs-12 col-sm-8 col-md-6 col-lg-4">
		<form:form method="post" commandName="person" action="${ formActionUrl }" role="form">
    		<fieldset>
    		
    			<legend>Person</legend>
   
    
  				<form:hidden path="personId" />
      
    
      			<spring:bind path="firstName">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="firstName" class="control-label">First Name</label>
    					<form:input path="firstName"  class="form-control"/>
    				<form:errors path="firstName" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="lastName">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="lastName" class="control-label">Last Name</label>
    					<form:input path="lastName"  class="form-control"/>
    				<form:errors path="lastName" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="username">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="username" class="control-label">Username</label>
    					<form:input path="username"  class="form-control"/>
    				<form:errors path="username" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="consent">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="consent" class="control-label">Consent</label>
    					<form:input path="consent"  class="form-control"/>
    				<form:errors path="consent" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="deleted">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="deleted" class="control-label">Deleted</label>
    					<form:input path="deleted"  class="form-control"/>
    				<form:errors path="deleted" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="languageId">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="languageId" class="control-label">Language Id</label>
    					<form:input path="languageId"  class="form-control"/>
    				<form:errors path="languageId" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="password">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="password" class="control-label">Password</label>
    					<form:input path="password"  class="form-control"/>
    				<form:errors path="password" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
      			<spring:bind path="email">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="email" class="control-label">Email</label>
    					<form:input path="email"  class="form-control"/>
    				<form:errors path="email" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
         			
    			<input type="submit" value="Save" class="btn btn-primary" />
    			<a class="btn btn-default" href="${ cancelUrl }">Cancel</a>
    			
    		</fieldset>
		</form:form>
	</div>
</div>