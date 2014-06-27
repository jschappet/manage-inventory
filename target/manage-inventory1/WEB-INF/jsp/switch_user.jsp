<%@ include file="/WEB-INF/include.jsp"%>

<su:isSwitched>
	<c:redirect url="/index.html"/>
</su:isSwitched>

<form name="f" action="<c:url value='/switch_user'/>" method="POST" class="form-horizontal">
	<fieldset>
		<legend>Switch User</legend>
		
		<div class="control-group">
			<label for="first" class="control-label">First Name</label>
			<div class="controls">
				<input id="first" type="text" size="20" />
			</div>
		</div>
		
		<div class="control-group">
			<label for="last" class="control-label">Last Name</label>
			<div class="controls">
				<input id="last" type="text" size="20" />
			</div>
		</div>

		<div class="control-group">
			<div id="results" class="controls">
				Enter a first and/or last to view results.
			</div>
		</div>

		<div class="control-group">
  				<div class="controls">
				<input type="submit" value="Switch" class="btn" />
			</div>
		</div>
		
		<c:if test="${not empty login_error}">
			<div class="alert alert-error">
				Your login attempt was not successful, try again.
				<c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />.
			</div>
		</c:if>
	</fieldset>
</form>

<c:url value="/get_names.html" var="auto_url"/>
<script type="text/javascript">
	$(function(){
		$('#first, #last').attr("autocomplete","off");
		$('#first').focus();
	});
	$('#first, #last').keyup(function(){
		nameAutoComplete('first','last','${auto_url}','j_username','results','Enter a first and/or last to view results.');
	});
</script>