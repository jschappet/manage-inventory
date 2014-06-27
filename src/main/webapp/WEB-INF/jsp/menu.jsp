<%@ include file="/WEB-INF/include.jsp"  %>

<ul class="nav nav-list">
	<li><a href="<c:url value="/index.html" />">Home</a></li>
	<sec:authorize access="isAuthenticated()">
		
	</sec:authorize>
	<sec:authorize access="!isAuthenticated()">
		<li><a href="<c:url value="/login.html" />">Login</a></li>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<li><a href="<c:url value="/logout"/>" >Logout</a></li>
	</sec:authorize>
</ul>
