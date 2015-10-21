<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Propertys</h2>

<c:url value="/property/add" var="addUrl" />
<a href="${ addUrl }" class="btn btn-default">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table id="propertyTable" class="table table-bordered table-striped table-hover">
    <%-- table filled by setDataTable call below --%>
</table>

<c:url value="/property/datatable" var="datatableUrl">
    <c:param name="display" value="list" />
</c:url>
<script type="text/javascript">
    var columns = [];
    columns.push({ "data": "urls", "name": "urls", "title":"", "class":"", "sortable":false, "searchable": false });
    columns.push({ "data": "name", "name": "name", "title":"Name", "class":"", "sortable":true, "searchable": true });
    columns.push({ "data": "description", "name": "description", "title":"Description", "class":"", "sortable":true, "searchable": true });
    columns.push({ "data": "createdBy", "name": "createdBy", "title":"Created By", "class":"", "sortable":true, "searchable": true });
    columns.push({ "data": "created", "name": "created", "title":"Created", "class":"", "sortable":true, "searchable": true });
    columns.push({ "data": "updatedBy", "name": "updatedBy", "title":"Updated By", "class":"", "sortable":true, "searchable": true });
    columns.push({ "data": "updated", "name": "updated", "title":"Updated", "class":"", "sortable":true, "searchable": true });
    columns.push({ "data": "tasks", "name": "tasks", "title":"Tasks", "class":"", "sortable":false, "searchable": false });
    columns.push({ "data": "workLogs", "name": "workLogs", "title":"Work Logs", "class":"", "sortable":false, "searchable": false });
    columns.push({ "data": "location", "name": "location", "title":"Location", "class":"", "sortable":false, "searchable": false });
    var table = setDataTable({
        id : 'propertyTable',
        url : '${ datatableUrl }',
        columns : columns,
        individualSearching : true 
    });
</script><jsp:include page="/WEB-INF/jsp/angular-grid-rest-api.jsp" ><jsp:param name="restApiUrl" value="/api"/><jsp:param name="resourceName" value="property"/><jsp:param name="resourceId" value="propertyId"/></jsp:include>