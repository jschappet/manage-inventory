<%@ include file="/WEB-INF/include.jsp"%>

<div id="mainmenu" class="list-group">
	
	<sec:authorize access="!isAuthenticated()">
		<a class="list-group-item" href="<c:url value="/login" />">Login</a>
	</sec:authorize>

	<sec:authorize access="isAuthenticated()">
	<a class="list-group-item" href="<c:url value="/task/list" />" >Tasks</a>

		<a class="list-group-item" href="<c:url value="/task/mine" />" >My Tasks</a>
		<a class="list-group-item" href="<c:url value="/worklog/list" />" >Work Log</a>
		
		<a class="list-group-item" href="<c:url value="/property/list" />" >Properties</a>
		<a class="list-group-item" href="<c:url value="/person/list" />" >People</a>
		<a class="list-group-item" href="<c:url value="/location/list" />" >Locations</a>
		<a class="list-group-item" href="<c:url value="/logout" />">Logout</a>
		<a class="list-group-item" href="<c:url value="/message/list" />" >Messages</a>
		<a class="list-group-item" href="<c:url value="/systemsetting/list" />" >System Settings</a>
		<a class="list-group-item" href="<c:url value="/role/list" />" >Roles</a>
		
	</sec:authorize>
	
</div>