<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Task List</h2>

<a href="add.html" class="btn">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table id="taskTable" class="table table-bordered table-striped table-hover">
    <%-- table filled by setDataTable call below --%>
</table>

<c:url value="/inv/task/datatable.html" var="datatableUrl">
    <c:param name="display" value="list"/>
</c:url>
<script type="text/javascript">
    var cols = [];
    cols.push({ "sName": "taskId", "sTitle":"TaskId",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "taskType", "sTitle":"TaskType",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "name", "sTitle":"Name",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "created", "sTitle":"Created",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "createdBy", "sTitle":"CreatedBy",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "assignedTo", "sTitle":"AssignedTo",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "deadline", "sTitle":"Deadline",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "completed", "sTitle":"Completed",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "property", "sTitle":"Property",	"sClass":"", "bSortable":false, "bSearchable": false });
    cols.push({ "sName": "urls", "sTitle":"", "sClass":"", "bSortable":false, "bSearchable": false });
    setDataTable({
        id : 'taskTable',
        url : '${datatableUrl}',
        start : 0,
        limit : 10,
        columns : cols,
        includeSearches : false,
        sortable : true
    });
</script>