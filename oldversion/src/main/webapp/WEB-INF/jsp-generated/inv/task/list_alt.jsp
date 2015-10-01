<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Task List</h2>

<a href="add.html" class="btn">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table class="table table-bordered table-striped table-hover">
    <thead>
        <tr>
            <th>TaskId</th>
            <th>TaskType</th>
            <th>Name</th>
            <th>Created</th>
            <th>CreatedBy</th>
            <th>AssignedTo</th>
            <th>Deadline</th>
            <th>Completed</th>
            <th>Property</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${taskList}" var="task"  varStatus="status">
            <tr>
                <td><a href="edit.html?taskId=${task.taskId}">${task.taskId}</a></td>
                <td>${task.taskType}</td>
                <td>${task.name}</td>
                <td>${task.created}</td>
                <td>${task.createdBy}</td>
                <td>${task.assignedTo}</td>
                <td>${task.deadline}</td>
                <td>${task.completed}</td>
                <td>${task.property.propertyId}</td>
                <td>
                    <a href="edit.html?taskId=${task.taskId}">edit</a> 
                    <a href="show.html?taskId=${task.taskId}">view</a>
                    <a href="delete.html?taskId=${task.taskId}">delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>