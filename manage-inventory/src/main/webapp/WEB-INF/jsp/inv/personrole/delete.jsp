<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Delete Person Role</h2>

<c:url value="/personrole/delete" var="formActionUrl" />

<form method="post" action="${ formActionUrl }">
    <fieldset>
        <legend>Are you sure you want to delete this person role?</legend>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Person Role Id</th>
                    <th>Role</th>
                    <th>Person</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        ${ personRole.personRoleId }
                    </td>
                    <td>
                        ${ personRole.role }
                    </td>
                    <td>
                        ${ personRole.person }
                    </td>
                </tr>
            </tbody>
        </table>

        <input type="submit" name="submit" value="Yes" class="btn btn-danger" />
        <input type="submit" name="submit" value="No" class="btn btn-default" />

        <input type="hidden" name="personRoleId" value="${ personRole.personRoleId }" />

    </fieldset>
</form>