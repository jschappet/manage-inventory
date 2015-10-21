<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Delete Work Log</h2>

<c:url value="/worklog/delete" var="formActionUrl" />

<form method="post" action="${ formActionUrl }">
    <fieldset>
        <legend>Are you sure you want to delete this work log?</legend>
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
                        ${ workLog.taskId }
                    </td>
                    <td>
                        ${ workLog.taskType }
                    </td>
                    <td>
                        ${ workLog.name }
                    </td>
                    <td>
                        ${ workLog.created }
                    </td>
                    <td>
                        ${ workLog.createdBy }
                    </td>
                    <td>
                        ${ workLog.assignedTo }
                    </td>
                    <td>
                        ${ workLog.deadline }
                    </td>
                    <td>
                        ${ workLog.completed }
                    </td>
                    <td>
                        ${ workLog.property }
                    </td>
                </tr>
            </tbody>
        </table>

        <input type="submit" name="submit" value="Yes" class="btn btn-danger" />
        <input type="submit" name="submit" value="No" class="btn btn-default" />

        <input type="hidden" name="taskId" value="${ workLog.taskId }" />

    </fieldset>
</form>