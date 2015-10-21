<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Person List</h2>

<a href="add" class="btn btn-default">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table class="table table-bordered table-striped table-hover table-datatable">
    <thead>
        <tr>
            <th>Person Id</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Username</th>
            <th>Consent</th>
            <th>Deleted</th>
            <th>Language Id</th>
            <th>Password</th>
            <th>Email</th>
            <th>Person Roles</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${ personList }" var="person"  varStatus="status">
            <tr>
                <td><a href="edit?personId=${person.personId}">${person.personId}</a></td>
                <td>${person.firstName}</td>
                <td>${person.lastName}</td>
                <td>${person.username}</td>
                <td>${person.consent}</td>
                <td>${person.deleted}</td>
                <td>${person.languageId}</td>
                <td>${person.password}</td>
                <td>${person.email}</td>
                <td>personRoles</td>
                <td>
                    <a href="edit?personId=${person.personId}">edit</a> 
                    <a href="show?personId=${person.personId}">view</a>
                    <a href="delete?personId=${person.personId}">delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>