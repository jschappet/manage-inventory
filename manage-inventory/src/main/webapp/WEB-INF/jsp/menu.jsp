<%@ include file="/WEB-INF/include.jsp"%>

<div id="mainmenu" class="list-group">
	
	<sec:authorize access="!isAuthenticated()">
		<a class="list-group-item" href="<c:url value="/login" />">Login</a>
	</sec:authorize>

	<sec:authorize access="isAuthenticated()">
		<a class="list-group-item" href="<c:url value="/logout" />">Logout</a>
	</sec:authorize>
	
</div>