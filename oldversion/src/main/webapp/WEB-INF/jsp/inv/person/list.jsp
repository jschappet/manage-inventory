<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Person List</h2>

<a href="add.html" class="btn">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table id="personTable" class="table table-bordered table-striped table-hover">
    <%-- table filled by setDataTable call below --%>
</table>

<c:url value="/inv/person/datatable.html" var="datatableUrl">
    <c:param name="display" value="list"/>
</c:url>
<script type="text/javascript">
    var cols = [];
    cols.push({ "sName": "personId", "sTitle":"PersonId",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "firstName", "sTitle":"FirstName",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "lastName", "sTitle":"LastName",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "username", "sTitle":"Username",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "urls", "sTitle":"", "sClass":"", "bSortable":false, "bSearchable": false });
    setDataTable({
        id : 'personTable',
        url : '${datatableUrl}',
        start : 0,
        limit : 10,
        columns : cols,
        includeSearches : false,
        sortable : true
    });
</script>