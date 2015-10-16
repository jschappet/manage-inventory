<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Person Role</h2>

<h2> ${personRole.personRoleId} </h2>

<table class="table table-bordered table-hover">
    <tr>
        <th>Person Role Id</th>
        <td>
            ${personRole.personRoleId}
        </td>
    </tr>
    <tr>
        <th>Role</th>
        <td>
            ${personRole.role}
        </td>
    </tr>
    <tr>
        <th>Person</th>
        <td>
            ${personRole.person}
        </td>
    </tr>
</table>