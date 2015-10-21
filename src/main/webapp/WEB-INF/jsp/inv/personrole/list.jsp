<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Person Roles</h2>

<c:url value="/personrole/add" var="addUrl" />
<a href="${ addUrl }" class="btn btn-default">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table id="personroleTable" class="table table-bordered table-striped table-hover">
    <%-- table filled by setDataTable call below --%>
</table>

<c:url value="/personrole/datatable" var="datatableUrl">
    <c:param name="display" value="list" />
</c:url>
<script type="text/javascript">
    var columns = [];
    columns.push({ "name": "urls", "title":"", "class":"", "sortable":false, "searchable": false });
    columns.push({ "name": "role", "title":"Role",	"class":"", "sortable":false, "searchable": false });
    columns.push({ "name": "person", "title":"Person",	"class":"", "sortable":false, "searchable": false });
    var table = setDataTable({
        id : 'personroleTable',
        url : '${ datatableUrl }',
        columns : columns,
        individualSearching : true 
    });
</script><jsp:include page="/WEB-INF/jsp/angular-grid-rest-api.jsp" ><jsp:param name="restApiUrl" value="/api"/><jsp:param name="resourceName" value="personrole"/><jsp:param name="resourceId" value="personRoleId"/></jsp:include>