<%--
  #%L
  Protogen
  %%
  Copyright (C) 2009 - 2015 University of Iowa Institute for Clinical and Translational Science (ICTS)
  %%
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
  
       http://www.apache.org/licenses/LICENSE-2.0
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
  #L%
  --%>
<%@ include file="/WEB-INF/include.jsp"  %>

<c:url value="/worklog/save" var="formActionUrl" />
<c:url value="/worklog/list" var="cancelUrl" />

<div class="row">
	<div class="col-xs-12 col-sm-8 col-md-6 col-lg-4">
		<form:form method="post" commandName="workLog" action="${ formActionUrl }" role="form">
    		<fieldset>
    		
    			<legend>Work Log</legend>
   
    
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