<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Message List</h2>

<a href="add.html" class="btn">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table id="messageTable" class="table table-bordered table-striped table-hover">
    <%-- table filled by setDataTable call below --%>
</table>

<c:url value="/inv/message/datatable.html" var="datatableUrl">
    <c:param name="display" value="list"/>
</c:url>
<script type="text/javascript">
    var cols = [];
    cols.push({ "sName": "messageId", "sTitle":"MessageId",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "messageName", "sTitle":"MessageName",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "messageType", "sTitle":"MessageType",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "version", "sTitle":"Version",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "messageText", "sTitle":"MessageText",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "irbApproval", "sTitle":"IrbApproval",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "irbApprovalStartDate", "sTitle":"IrbApprovalStartDate",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "irbApprovalEndDate", "sTitle":"IrbApprovalEndDate",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "description", "sTitle":"Description",	"sClass":"", "bSortable":true, "bSearchable": true });
    cols.push({ "sName": "urls", "sTitle":"", "sClass":"", "bSortable":false, "bSearchable": false });
    setDataTable({
        id : 'messageTable',
        url : '${datatableUrl}',
        start : 0,
        limit : 10,
        columns : cols,
        includeSearches : false,
        sortable : true
    });
</script>