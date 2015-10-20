<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Work Log List</h2>

<a href="add" class="btn btn-default">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table class="table table-bordered table-striped table-hover table-datatable">
    <thead>
        <tr>
            <th>Task Id</th>
            <th>Task Type</th>
            <th>Name</th>
            <th>Created</th>
            <th>Created By</th>
            <th>Assigned To</th>
            <th>Deadline</th>
            <th>Completed</th>
            <th>Property</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${ workLogList }" var="workLog"  varStatus="status">
            <tr>
                <td><a href="edit?taskId=${workLog.taskId}">${workLog.taskId}</a></td>
                <td>${workLog.taskType}</td>
                <td>${workLog.name}</td>
                <td>${workLog.created}</td>
                <td>${workLog.createdBy}</td>
                <td>${workLog.assignedTo}</td>
                <td>${workLog.deadline}</td>
                <td>${workLog.completed}</td>
                <td>${workLog.property.propertyId}</td>
                <td>
                    <a href="edit?taskId=${workLog.taskId}">edit</a> 
                    <a href="show?taskId=${workLog.taskId}">view</a>
                    <a href="delete?taskId=${workLog.taskId}">delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>