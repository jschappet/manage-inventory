<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Task List</h2>

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
        <c:forEach items="${ taskList }" var="task"  varStatus="status">
            <tr>
                <td><a href="edit?taskId=${task.taskId}">${task.taskId}</a></td>
                <td>${task.taskType}</td>
                <td>${task.name}</td>
                <td>${task.created}</td>
                <td>${task.createdBy}</td>
                <td>${task.assignedTo}</td>
                <td>${task.deadline}</td>
                <td>${task.completed}</td>
                <td>${task.property.propertyId}</td>
                <td>
                    <a href="edit?taskId=${task.taskId}">edit</a> 
                    <a href="show?taskId=${task.taskId}">view</a>
                    <a href="delete?taskId=${task.taskId}">delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>