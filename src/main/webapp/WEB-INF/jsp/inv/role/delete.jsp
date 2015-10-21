<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Delete Role</h2>

<c:url value="/role/delete" var="formActionUrl" />

<form method="post" action="${ formActionUrl }">
    <fieldset>
        <legend>Are you sure you want to delete this role?</legend>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Role Id</th>
                    <th>Role Name</th>
                    <th>Person Roles</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        ${ role.roleId }
                    </td>
                    <td>
                        ${ role.roleName }
                    </td>
                    <td>
                        <ul>
                            <c:forEach items="${ role.personRoles }" var="item" varStatus="itemStatus">
                                <li>${ item.personRoleId }</li>
                            </c:forEach>
                        </ul>
                    </td>
                </tr>
            </tbody>
        </table>

        <input type="submit" name="submit" value="Yes" class="btn btn-danger" />
        <input type="submit" name="submit" value="No" class="btn btn-default" />

        <input type="hidden" name="roleId" value="${ role.roleId }" />

    </fieldset>
</form>