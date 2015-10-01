<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Delete Task</h2>

<form method="post" action="delete.html">
    <fieldset>
        <legend>Are you sure you want to delete this Task?</legend>
        <table class="table table-bordered table-hover">
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
        <input type="submit" name="submit" value="No" class="btn" />

        <input type="hidden" name="taskId" value="${ task.taskId }" />

    </fieldset>
</form>