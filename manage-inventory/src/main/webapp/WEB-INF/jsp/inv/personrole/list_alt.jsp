<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Person Role List</h2>

<a href="add" class="btn btn-default">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table class="table table-bordered table-striped table-hover table-datatable">
    <thead>
        <tr>
            <th>Person Role Id</th>
            <th>Role</th>
            <th>Person</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${ personRoleList }" var="personRole"  varStatus="status">
            <tr>
                <td><a href="edit?personRoleId=${personRole.personRoleId}">${personRole.personRoleId}</a></td>
                <td>${personRole.role.roleId}</td>
                <td>${personRole.person.personId}</td>
                <td>
                    <a href="edit?personRoleId=${personRole.personRoleId}">edit</a> 
                    <a href="show?personRoleId=${personRole.personRoleId}">view</a>
                    <a href="delete?personRoleId=${personRole.personRoleId}">delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>