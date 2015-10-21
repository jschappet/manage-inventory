<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Person</h2>

<h2> ${person.personId} </h2>

<table class="table table-bordered table-hover">
    <tr>
        <th>Person Id</th>
        <td>
            ${person.personId}
        </td>
    </tr>
    <tr>
        <th>First Name</th>
        <td>
            ${person.firstName}
        </td>
    </tr>
    <tr>
        <th>Last Name</th>
        <td>
            ${person.lastName}
        </td>
    </tr>
    <tr>
        <th>Username</th>
        <td>
            ${person.username}
        </td>
    </tr>
    <tr>
        <th>Consent</th>
        <td>
            ${person.consent}
        </td>
    </tr>
    <tr>
        <th>Deleted</th>
        <td>
            ${person.deleted}
        </td>
    </tr>
    <tr>
        <th>Language Id</th>
        <td>
            ${person.languageId}
        </td>
    </tr>
    <tr>
        <th>Password</th>
        <td>
            ${person.password}
        </td>
    </tr>
    <tr>
        <th>Email</th>
        <td>
            ${person.email}
        </td>
    </tr>
    <tr>
        <th>Person Roles</th>
        <td>
            <ul>
                <c:forEach items="${person.personRoles}" var="item" varStatus="itemStatus" >
                    <li><a href="../personrole/edit?personRoleId=${item.personRoleId}" > ${item.personRoleId}</a></li>
                </c:forEach>
            </ul>
        </td>
    </tr>
</table>