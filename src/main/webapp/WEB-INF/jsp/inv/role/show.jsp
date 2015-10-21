<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Role</h2>

<h2> ${role.roleId} </h2>

<table class="table table-bordered table-hover">
    <tr>
        <th>Role Id</th>
        <td>
            ${role.roleId}
        </td>
    </tr>
    <tr>
        <th>Role Name</th>
        <td>
            ${role.roleName}
        </td>
    </tr>
    <tr>
        <th>Person Roles</th>
        <td>
            <ul>
                <c:forEach items="${role.personRoles}" var="item" varStatus="itemStatus" >
                    <li><a href="../personrole/edit?personRoleId=${item.personRoleId}" > ${item.personRoleId}</a></li>
                </c:forEach>
            </ul>
        </td>
    </tr>
</table>