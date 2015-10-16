<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Delete Person</h2>

<c:url value="/person/delete" var="formActionUrl" />

<form method="post" action="${ formActionUrl }">
    <fieldset>
        <legend>Are you sure you want to delete this person?</legend>
        <table class="table table-bordered table-hover">
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
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        ${ person.personId }
                    </td>
                    <td>
                        ${ person.firstName }
                    </td>
                    <td>
                        ${ person.lastName }
                    </td>
                    <td>
                        ${ person.username }
                    </td>
                    <td>
                        ${ person.consent }
                    </td>
                    <td>
                        ${ person.deleted }
                    </td>
                    <td>
                        ${ person.languageId }
                    </td>
                    <td>
                        ${ person.password }
                    </td>
                    <td>
                        ${ person.email }
                    </td>
                    <td>
                        <ul>
                            <c:forEach items="${ person.personRoles }" var="item" varStatus="itemStatus">
                                <li>${ item.personRoleId }</li>
                            </c:forEach>
                        </ul>
                    </td>
                </tr>
            </tbody>
        </table>

        <input type="submit" name="submit" value="Yes" class="btn btn-danger" />
        <input type="submit" name="submit" value="No" class="btn btn-default" />

        <input type="hidden" name="personId" value="${ person.personId }" />

    </fieldset>
</form>