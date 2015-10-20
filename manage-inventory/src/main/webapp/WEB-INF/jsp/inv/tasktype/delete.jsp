<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Delete Task Type</h2>

<c:url value="/tasktype/delete" var="formActionUrl" />

<form method="post" action="${ formActionUrl }">
    <fieldset>
        <legend>Are you sure you want to delete this task type?</legend>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Type Id</th>
                    <th>Name</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        ${ taskType.typeId }
                    </td>
                    <td>
                        ${ taskType.name }
                    </td>
                </tr>
            </tbody>
        </table>

        <input type="submit" name="submit" value="Yes" class="btn btn-danger" />
        <input type="submit" name="submit" value="No" class="btn btn-default" />

        <input type="hidden" name="typeId" value="${ taskType.typeId }" />

    </fieldset>
</form>