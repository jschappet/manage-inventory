<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Task</h2>

<h2> ${task.taskId} </h2>

<table class="table table-bordered table-hover">
    <tr>
        <th>Task Id</th>
        <td>
            ${task.taskId}
        </td>
    </tr>
    <tr>
        <th>Task Type</th>
        <td>
            ${task.taskType}
        </td>
    </tr>
    <tr>
        <th>Name</th>
        <td>
            ${task.name}
        </td>
    </tr>
    <tr>
        <th>Created</th>
        <td>
            ${task.created}
        </td>
    </tr>
    <tr>
        <th>Created By</th>
        <td>
            ${task.createdBy}
        </td>
    </tr>
    <tr>
        <th>Assigned To</th>
        <td>
            ${task.assignedTo}
        </td>
    </tr>
    <tr>
        <th>Deadline</th>
        <td>
            ${task.deadline}
        </td>
    </tr>
    <tr>
        <th>Completed</th>
        <td>
            ${task.completed}
        </td>
    </tr>
    <tr>
        <th>Property</th>
        <td>
            ${task.property}
        </td>
    </tr>
</table>