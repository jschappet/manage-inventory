<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Person List</h2>

<a href="add.html" class="btn">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table class="table table-bordered table-striped table-hover">
    <thead>
        <tr>
            <th>PersonId</th>
            <th>FirstName</th>
            <th>LastName</th>
            <th>Username</th>
            <th>Consent</th>
            <th>Deleted</th>
            <th>LanguageId</th>
            <th>Password</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${personList}" var="person"  varStatus="status">
            <tr>
                <td><a href="edit.html?personId=${person.personId}">${person.personId}</a></td>
                <td>${person.firstName}</td>
                <td>${person.lastName}</td>
                <td>${person.username}</td>
                <td>${person.consent}</td>
                <td>${person.deleted}</td>
                <td>${person.languageId}</td>
                <td>${person.password}</td>
                <td>
                    <a href="edit.html?personId=${person.personId}">edit</a> 
                    <a href="show.html?personId=${person.personId}">view</a>
                    <a href="delete.html?personId=${person.personId}">delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>