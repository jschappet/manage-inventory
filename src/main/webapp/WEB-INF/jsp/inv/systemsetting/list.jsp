<%@ include file="/WEB-INF/include.jsp"  %>

<h2>System Settings</h2>

<c:url value="/systemsetting/add" var="addUrl" />
<a href="${ addUrl }" class="btn btn-default">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table id="systemsettingTable" class="table table-bordered table-striped table-hover">
    <%-- table filled by setDataTable call below --%>
</table>

<c:url value="/systemsetting/datatable" var="datatableUrl">
    <c:param name="display" value="list" />
</c:url>
<script type="text/javascript">
    var columns = [];
    columns.push({ "name": "urls", "title":"", "class":"", "sortable":false, "searchable": false });
    columns.push({ "name": "value", "title":"Value",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "active", "title":"Active",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "notes", "title":"Notes",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "lastUpdatedBy", "title":"Last Updated By",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "lastUpdated", "title":"Last Updated",	"class":"", "sortable":true, "searchable": true });
    var table = setDataTable({
        id : 'systemsettingTable',
        url : '${ datatableUrl }',
        columns : columns,
        individualSearching : true 
    });
</script><jsp:include page="/WEB-INF/jsp/angular-grid-rest-api.jsp" ><jsp:param name="restApiUrl" value="/api"/><jsp:param name="resourceName" value="systemsetting"/><jsp:param name="resourceId" value="name"/></jsp:include>