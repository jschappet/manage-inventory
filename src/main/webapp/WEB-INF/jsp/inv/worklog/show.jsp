<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Work Log</h2>

<h2> ${workLog.taskId} </h2>

<table class="table table-bordered table-hover">
    <tr>
        <th>Task Id</th>
        <td>
            ${workLog.taskId}
        </td>
    </tr>
    <tr>
        <th>Task Type</th>
        <td>
            ${workLog.taskType}
        </td>
    </tr>
    <tr>
        <th>Name</th>
        <td>
            ${workLog.name}
        </td>
    </tr>
    <tr>
        <th>Created</th>
        <td>
            ${workLog.created}
        </td>
    </tr>
    <tr>
        <th>Created By</th>
        <td>
            ${workLog.createdBy}
        </td>
    </tr>
    <tr>
        <th>Assigned To</th>
        <td>
            ${workLog.assignedTo}
        </td>
    </tr>
    <tr>
        <th>Deadline</th>
        <td>
            ${workLog.deadline}
        </td>
    </tr>
    <tr>
        <th>Completed</th>
        <td>
            ${workLog.completed}
        </td>
    </tr>
    <tr>
        <th>Property</th>
        <td>
            ${workLog.property}
        </td>
    </tr>
</table>