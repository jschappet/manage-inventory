<%@ include file="/WEB-INF/include.jsp"  %>

<h2>My Tasks</h2>

<a href="add.html" class="btn">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table class="table table-bordered table-striped table-hover">
    <thead>
        <tr>
            <th>TaskType</th>
            <th>Name</th>
            <th>Deadline</th>
            <th>Property</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${taskList}" var="task"  varStatus="status">
            <tr>
                
                <td>${task.taskType}</td>
                <td>${task.name}</td>
                <td>${task.deadline}</td>
                <td>${task.property.name}</td>
                <!-- <td>
                    <a href="edit.html?taskId=${task.taskId}">edit</a> 
                    <a href="show.html?taskId=${task.taskId}">view</a>
                    <a href="delete.html?taskId=${task.taskId}">delete</a>
                </td>
                 -->
            </tr>
        </c:forEach>
    </tbody>
</table>