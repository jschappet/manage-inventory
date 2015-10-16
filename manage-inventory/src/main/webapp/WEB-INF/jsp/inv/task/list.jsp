<%@ include file="/WEB-INF/include.jsp"  %>

<h2>My Tasks</h2>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>


<jsp:include page="/WEB-INF/jsp/angular-grid-rest-api.jsp" >
	<jsp:param name="restApiUrl" value="/api"/>
	<jsp:param name="resourceName" value="task"/>
	<jsp:param name="resourceId" value="taskId"/>
</jsp:include>

<c:url value="/task/add" var="addUrl" />
<a href="${ addUrl }" class="btn btn-default">Add</a>
