<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Work Logs</h2>

<c:url value="/worklog/add" var="addUrl" />
<a href="${ addUrl }" class="btn btn-default">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table id="worklogTable" class="table table-bordered table-striped table-hover">
    <%-- table filled by setDataTable call below --%>
</table>

<c:url value="/worklog/datatable" var="datatableUrl">
    <c:param name="display" value="list" />
</c:url>
<script type="text/javascript">
    var columns = [];
    columns.push({ "data": "urls", "name": "urls", "title":"", "class":"", "sortable":false, "searchable": false });
    columns.push({ "data": "taskType", "name": "taskType", "title":"Task Type", "class":"", "sortable":true, "searchable": true });
    columns.push({ "data": "name", "name": "name", "title":"Name", "class":"", "sortable":true, "searchable": true });
    columns.push({ "data": "created", "name": "created", "title":"Created", "class":"", "sortable":true, "searchable": true });
    columns.push({ "data": "createdBy", "name": "createdBy", "title":"Created By", "class":"", "sortable":true, "searchable": true });
    columns.push({ "data": "assignedTo", "name": "assignedTo", "title":"Assigned To", "class":"", "sortable":true, "searchable": true });
    columns.push({ "data": "deadline", "name": "deadline", "title":"Deadline", "class":"", "sortable":true, "searchable": true });
    columns.push({ "data": "completed", "name": "completed", "title":"Completed", "class":"", "sortable":true, "searchable": true });
    columns.push({ "data": "property", "name": "property", "title":"Property", "class":"", "sortable":false, "searchable": false });
    var table = setDataTable({
        id : 'worklogTable',
        url : '${ datatableUrl }',
        columns : columns,
        individualSearching : true 
    });
</script><jsp:include page="/WEB-INF/jsp/angular-grid-rest-api.jsp" ><jsp:param name="restApiUrl" value="/api"/><jsp:param name="resourceName" value="worklog"/><jsp:param name="resourceId" value="taskId"/></jsp:include>