<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Locations</h2>

<c:url value="/location/add" var="addUrl" />
<a href="${ addUrl }" class="btn btn-default">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table id="locationTable" class="table table-bordered table-striped table-hover">
    <%-- table filled by setDataTable call below --%>
</table>

<c:url value="/location/datatable" var="datatableUrl">
    <c:param name="display" value="list" />
</c:url>
<script type="text/javascript">
    var columns = [];
    columns.push({ "name": "urls", "title":"", "class":"", "sortable":false, "searchable": false });
    columns.push({ "name": "name", "title":"Name",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "description", "title":"Description",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "address1", "title":"Address1",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "address2", "title":"Address2",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "city", "title":"City",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "state", "title":"State",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "zipCode", "title":"Zip Code",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "propertys", "title":"Propertys",	"class":"", "sortable":false, "searchable": false });
    var table = setDataTable({
        id : 'locationTable',
        url : '${ datatableUrl }',
        columns : columns,
        individualSearching : true 
    });
</script><jsp:include page="/WEB-INF/jsp/angular-grid-rest-api.jsp" ><jsp:param name="restApiUrl" value="/api"/><jsp:param name="resourceName" value="location"/><jsp:param name="resourceId" value="locationId"/></jsp:include>