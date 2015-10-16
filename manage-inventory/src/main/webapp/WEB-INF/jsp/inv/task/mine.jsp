<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Tasks</h2>

<c:url value="/task/add" var="addUrl" />
<a href="${ addUrl }" class="btn btn-default">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table id="taskTable" class="table table-bordered table-striped table-hover">
    <%-- table filled by setDataTable call below --%>
</table>

<c:url value="/task/datatable" var="datatableUrl">
    <c:param name="display" value="list" />
</c:url>
<script type="text/javascript">
    var columns = [];
    columns.push({ "name": "urls", "title":"", "class":"", "sortable":false, "searchable": false });
    columns.push({ "name": "taskType", "title":"Task Type",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "name", "title":"Name",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "created", "title":"Created",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "createdBy", "title":"Created By",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "assignedTo", "title":"Assigned To",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "deadline", "title":"Deadline",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "completed", "title":"Completed",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "property", "title":"Property",	"class":"", "sortable":false, "searchable": false });
    var table = setDataTable({
        id : 'taskTable',
        url : '${ datatableUrl }',
        columns : columns,
        individualSearching : true 
    });
</script>

<jsp:include page="/WEB-INF/jsp/angular-grid-rest-api.jsp" >
	<jsp:param name="restApiUrl" value="/api"/>
	<jsp:param name="resourceName" value="task/mine"/>
	<jsp:param name="resourceId" value="taskId"/>
</jsp:include>