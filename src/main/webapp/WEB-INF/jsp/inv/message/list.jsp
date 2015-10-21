<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Messages</h2>

<c:url value="/message/add" var="addUrl" />
<a href="${ addUrl }" class="btn btn-default">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table id="messageTable" class="table table-bordered table-striped table-hover">
    <%-- table filled by setDataTable call below --%>
</table>

<c:url value="/message/datatable" var="datatableUrl">
    <c:param name="display" value="list" />
</c:url>
<script type="text/javascript">
    var columns = [];
    columns.push({ "name": "urls", "title":"", "class":"", "sortable":false, "searchable": false });
    columns.push({ "name": "messageName", "title":"Message Name",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "messageType", "title":"Message Type",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "version", "title":"Version",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "messageText", "title":"Message Text",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "irbApproval", "title":"Irb Approval",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "irbApprovalStartDate", "title":"Irb Approval Start Date",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "irbApprovalEndDate", "title":"Irb Approval End Date",	"class":"", "sortable":true, "searchable": true });
    columns.push({ "name": "description", "title":"Description",	"class":"", "sortable":true, "searchable": true });
    var table = setDataTable({
        id : 'messageTable',
        url : '${ datatableUrl }',
        columns : columns,
        individualSearching : true 
    });
</script><jsp:include page="/WEB-INF/jsp/angular-grid-rest-api.jsp" ><jsp:param name="restApiUrl" value="/api"/><jsp:param name="resourceName" value="message"/><jsp:param name="resourceId" value="messageId"/></jsp:include>