<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Persons</h2>

<c:url value="/person/add" var="addUrl" />
<a href="${ addUrl }" class="btn btn-default">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table id="personTable" class="table table-bordered table-striped table-hover">
    <%-- table filled by setDataTable call below --%>
</table>

<c:url value="/person/datatable" var="datatableUrl">
    <c:param name="display" value="list" />
</c:url>
<script type="text/javascript">
    var columns = [];
    columns.push({ "name": "urls", "title":"", "class":"", "sortable":false, "searchable": false });
    columns.push({ "name": "firstName", "title":"First Name",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "lastName", "title":"Last Name",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "username", "title":"Username",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "consent", "title":"Consent",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "deleted", "title":"Deleted",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "languageId", "title":"Language Id",	"class":"", "sortable":true, "searchable": true });
  //  columns.push({ "name": "password", "title":"Password",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "email", "title":"Email",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "personRoles", "title":"Person Roles",	"class":"", "sortable":false, "searchable": false });
    var table = setDataTable({
        id : 'personTable',
        url : '${ datatableUrl }',
        columns : columns,
        individualSearching : true 
    });
</script><jsp:include page="/WEB-INF/jsp/angular-grid-rest-api.jsp" ><jsp:param name="restApiUrl" value="/api"/><jsp:param name="resourceName" value="person"/><jsp:param name="resourceId" value="personId"/></jsp:include>