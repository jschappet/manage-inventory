<%@ include file="/WEB-INF/include.jsp"  %>

<c:url value="/personrole/save" var="formActionUrl" />
<c:url value="/personrole/list" var="cancelUrl" />

<div class="row">
	<div class="col-xs-12 col-sm-8 col-md-6 col-lg-4">
		<form:form method="post" commandName="personRole" action="${ formActionUrl }" role="form">
    		<fieldset>
    		
    			<legend>Person Role</legend>
   
    
  				<form:hidden path="personRoleId" />
        
    
      			<spring:bind path="role.roleId">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="role.roleId" class="control-label">Role</label>
    					<form:select path="role.roleId" items="${roleList}" itemValue="roleId" itemLabel="roleId" class="form-control"/>
					<form:errors path="role" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
        
    
      			<spring:bind path="person.personId">        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="person.personId" class="control-label">Person</label>
    					<form:select path="person.personId" items="${personList}" itemValue="personId" itemLabel="personId" class="form-control"/>
					<form:errors path="person" class="help-block" element="span" />
    	     			</div>
				</spring:bind>	
       			
    			<input type="submit" value="Save" class="btn btn-primary" />
    			<a class="btn btn-default" href="${ cancelUrl }">Cancel</a>
    			
    		</fieldset>
		</form:form>
	</div>
</div>