<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Role List</h2>

<a href="add" class="btn btn-default">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table class="table table-bordered table-striped table-hover table-datatable">
    <thead>
        <tr>
            <th>Role Id</th>
            <th>Role Name</th>
            <th>Person Roles</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${ roleList }" var="role"  varStatus="status">
            <tr>
                <td><a href="edit?roleId=${role.roleId}">${role.roleId}</a></td>
                <td>${role.roleName}</td>
                <td>personRoles</td>
                <td>
                    <a href="edit?roleId=${role.roleId}">edit</a> 
                    <a href="show?roleId=${role.roleId}">view</a>
                    <a href="delete?roleId=${role.roleId}">delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>