<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Delete Person</h2>

<form method="post" action="delete.html">
    <fieldset>
        <legend>Are you sure you want to delete this Person?</legend>
        <table class="table table-bordered table-hover">
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
                </tr>
            </tbody>
        </table>

        <input type="submit" name="submit" value="Yes" class="btn btn-danger" />
        <input type="submit" name="submit" value="No" class="btn" />

        <input type="hidden" name="personId" value="${ person.personId }" />

    </fieldset>
</form>