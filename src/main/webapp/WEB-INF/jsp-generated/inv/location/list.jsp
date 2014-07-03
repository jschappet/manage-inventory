<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Location List</h2>

<a href="add.html" class="btn">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table id="locationTable" class="table table-bordered table-striped table-hover">
    <%-- table filled by setDataTable call below --%>
</table>

<c:url value="/inv/location/datatable.html" var="datatableUrl">
    <c:param name="display" value="list"/>
</c:url>
<script type="text/javascript">
    var cols = [];
    cols.push({ "sName": "locationId", "sTitle":"LocationId",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "name", "sTitle":"Name",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "description", "sTitle":"Description",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "address1", "sTitle":"Address1",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "address2", "sTitle":"Address2",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "city", "sTitle":"City",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "state", "sTitle":"State",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "zipCode", "sTitle":"ZipCode",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "urls", "sTitle":"", "sClass":"", "bSortable":false, "bSearchable": false });
    setDataTable({
        id : 'locationTable',
        url : '${datatableUrl}',
        start : 0,
        limit : 10,
        columns : cols,
        includeSearches : false,
        sortable : true
    });
</script>