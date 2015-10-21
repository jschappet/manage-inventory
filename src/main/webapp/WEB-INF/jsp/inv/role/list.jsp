<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Roles</h2>

<c:url value="/role/add" var="addUrl" />
<a href="${ addUrl }" class="btn btn-default">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table id="roleTable" class="table table-bordered table-striped table-hover">
    <%-- table filled by setDataTable call below --%>
</table>

<c:url value="/role/datatable" var="datatableUrl">
    <c:param name="display" value="list" />
</c:url>
<script type="text/javascript">
    var columns = [];
    columns.push({ "name": "urls", "title":"", "class":"", "sortable":false, "searchable": false });
    columns.push({ "name": "roleName", "title":"Role Name",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "personRoles", "title":"Person Roles",	"class":"", "sortable":false, "searchable": false });
    var table = setDataTable({
        id : 'roleTable',
        url : '${ datatableUrl }',
        columns : columns,
        individualSearching : true 
    });
</script><jsp:include page="/WEB-INF/jsp/angular-grid-rest-api.jsp" ><jsp:param name="restApiUrl" value="/api"/><jsp:param name="resourceName" value="role"/><jsp:param name="resourceId" value="roleId"/></jsp:include>