<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Task Types</h2>

<c:url value="/tasktype/add" var="addUrl" />
<a href="${ addUrl }" class="btn btn-default">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table id="tasktypeTable" class="table table-bordered table-striped table-hover">
    <%-- table filled by setDataTable call below --%>
</table>

<c:url value="/tasktype/datatable" var="datatableUrl">
    <c:param name="display" value="list" />
</c:url>
<script type="text/javascript">
    var columns = [];
    columns.push({ "data": "urls", "name": "urls", "title":"", "class":"", "sortable":false, "searchable": false });
    columns.push({ "data": "name", "name": "name", "title":"Name", "class":"", "sortable":true, "searchable": true });
    var table = setDataTable({
        id : 'tasktypeTable',
        url : '${ datatableUrl }',
        columns : columns,
        individualSearching : true 
    });
</script><jsp:include page="/WEB-INF/jsp/angular-grid-rest-api.jsp" ><jsp:param name="restApiUrl" value="/api"/><jsp:param name="resourceName" value="tasktype"/><jsp:param name="resourceId" value="typeId"/></jsp:include>