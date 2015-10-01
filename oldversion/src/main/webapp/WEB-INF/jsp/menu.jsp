<%@ include file="/WEB-INF/include.jsp"  %>

<ul class="nav nav-list ">
	<li><a href="<c:url value="/index.html" />">Home</a></li>
	<li><a href="<c:url value="/inv/message/list.html" />" >Message List</a></li>
<li><a href="<c:url value="/inv/systemsetting/list.html" />" >SystemSetting List</a></li>
<li><a href="<c:url value="/inv/property/list.html" />" >Property List</a></li>
<li><a href="<c:url value="/inv/person/list.html" />" >Person List</a></li>
<li><a href="<c:url value="/inv/location/list.html" />" >Location List</a></li>
<li><a href="<c:url value="/inv/task/list.html" />" >Task List</a></li>
	<sec:authorize access="isAuthenticated()">
		
	</sec:authorize>
	<sec:authorize access="!isAuthenticated()">
		<li><a href="<c:url value="/login.html" />">Login</a></li>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<li><a href="<c:url value="/logout"/>" >Logout</a></li>
	</sec:authorize>
</ul>
