<%@ include file="/WEB-INF/include.jsp"  %>

<h2>SystemSetting List</h2>

<a href="add.html" class="btn">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table id="systemsettingTable" class="table table-bordered table-striped table-hover">
    <%-- table filled by setDataTable call below --%>
</table>

<c:url value="/inv/systemsetting/datatable.html" var="datatableUrl">
    <c:param name="display" value="list"/>
</c:url>
<script type="text/javascript">
    var cols = [];
    cols.push({ "sName": "name", "sTitle":"Name",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "value", "sTitle":"Value",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "active", "sTitle":"Active",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "notes", "sTitle":"Notes",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "lastUpdatedBy", "sTitle":"LastUpdatedBy",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "lastUpdated", "sTitle":"LastUpdated",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "urls", "sTitle":"", "sClass":"", "bSortable":false, "bSearchable": false });
    setDataTable({
        id : 'systemsettingTable',
        url : '${datatableUrl}',
        start : 0,
        limit : 10,
        columns : cols,
        includeSearches : false,
        sortable : true
    });
</script>