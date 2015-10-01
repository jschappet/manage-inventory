<%@ include file="/WEB-INF/include.jsp"%>

<div class="row-fluid">
	<div class="span4 offset4">
		<form name="f" action="<c:url value='j_spring_security_check'/>" method="POST" class="form-horizontal">
			<fieldset>
				<legend>Login</legend>
				
				<div class="control-group">
					<label for="username" class="control-label">Username</label>
					<div class="controls">
						<input type="text" id="username" name="j_username" size="20" placeholder="username"  autocapitalize="off"/>
					</div>
				</div>
				
				<div class="control-group">
					<label for="password" class="control-label">Password</label>
					<div class="controls">
						<input id="password" type="password" name="j_password" size="20" placeholder="password" autocapitalize="off" />
					</div>
				</div>
	
				<div class="control-group">
    				<div class="controls">
						<input type="submit" value="Login" class="btn" />
					</div>
				</div>
				
				<c:if test="${not empty error}">
					<div class="alert alert-error">
						Your login attempt was not successful, try again.
						<c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />.
					</div>
				</c:if>
			</fieldset>
		</form>
	</div>
</div>