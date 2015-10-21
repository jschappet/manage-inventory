<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Delete Task</h2>

<c:url value="/task/delete" var="formActionUrl" />

<form method="post" action="${ formActionUrl }">
    <fieldset>
        <legend>Are you sure you want to delete this task?</legend>
        <table class="table table-bordered table-hover">
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
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        ${ task.taskId }
                    </td>
                    <td>
                        ${ task.taskType }
                    </td>
                    <td>
                        ${ task.name }
                    </td>
                    <td>
                        ${ task.created }
                    </td>
                    <td>
                        ${ task.createdBy }
                    </td>
                    <td>
                        ${ task.assignedTo }
                    </td>
                    <td>
                        ${ task.deadline }
                    </td>
                    <td>
                        ${ task.completed }
                    </td>
                    <td>
                        ${ task.property }
                    </td>
                </tr>
            </tbody>
        </table>

        <input type="submit" name="submit" value="Yes" class="btn btn-danger" />
        <input type="submit" name="submit" value="No" class="btn btn-default" />

        <input type="hidden" name="taskId" value="${ task.taskId }" />

    </fieldset>
</form>