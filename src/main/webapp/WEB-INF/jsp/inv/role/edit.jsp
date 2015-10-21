<%@ include file="/WEB-INF/include.jsp"  %>

<c:url value="/role/save" var="formActionUrl" />
<c:url value="/role/list" var="cancelUrl" />

<div class="row">
	<div class="col-xs-12 col-sm-8 col-md-6 col-lg-4">
		<form:form method="post" commandName="role" action="${ formActionUrl }" role="form">
    		<fieldset>
    		
    			<legend>Role</legend>
   
    
  				<form:hidden path="roleId" />
      
    
      			<spring:bind path="roleName">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="roleName" class="control-label">Role Name</label>
    					<form:input path="roleName"  class="form-control"/>
    				<form:errors path="roleName" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
      
    
         			
    			<input type="submit" value="Save" class="btn btn-primary" />
    			<a class="btn btn-default" href="${ cancelUrl }">Cancel</a>
    			
    		</fieldset>
		</form:form>
	</div>
</div>