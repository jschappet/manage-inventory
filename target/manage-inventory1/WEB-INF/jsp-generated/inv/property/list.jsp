<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Property List</h2>

<a href="add.html" class="btn">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table id="propertyTable" class="table table-bordered table-striped table-hover">
    <%-- table filled by setDataTable call below --%>
</table>

<c:url value="/inv/property/datatable.html" var="datatableUrl">
    <c:param name="display" value="list"/>
</c:url>
<script type="text/javascript">
    var cols = [];
    cols.push({ "sName": "propertyId", "sTitle":"PropertyId",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "name", "sTitle":"Name",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "description", "sTitle":"Description",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "location", "sTitle":"Location",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "createdBy", "sTitle":"CreatedBy",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "created", "sTitle":"Created",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "updatedBy", "sTitle":"UpdatedBy",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "updated", "sTitle":"Updated",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "tasks", "sTitle":"Tasks",	"sClass":"", "bSortable":false, "bSearchable": false });
    cols.push({ "sName": "urls", "sTitle":"", "sClass":"", "bSortable":false, "bSearchable": false });
    setDataTable({
        id : 'propertyTable',
        url : '${datatableUrl}',
        start : 0,
        limit : 10,
        columns : cols,
        includeSearches : false,
        sortable : true
    });
</script>