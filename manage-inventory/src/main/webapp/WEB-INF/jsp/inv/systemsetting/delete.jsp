<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Delete System Setting</h2>

<c:url value="/systemsetting/delete" var="formActionUrl" />

<form method="post" action="${ formActionUrl }">
    <fieldset>
        <legend>Are you sure you want to delete this system setting?</legend>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Value</th>
                    <th>Active</th>
                    <th>Notes</th>
                    <th>Last Updated By</th>
                    <th>Last Updated</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        ${ systemSetting.name }
                    </td>
                    <td>
                        ${ systemSetting.value }
                    </td>
                    <td>
                        ${ systemSetting.active }
                    </td>
                    <td>
                        ${ systemSetting.notes }
                    </td>
                    <td>
                        ${ systemSetting.lastUpdatedBy }
                    </td>
                    <td>
                        ${ systemSetting.lastUpdated }
                    </td>
                </tr>
            </tbody>
        </table>

        <input type="submit" name="submit" value="Yes" class="btn btn-danger" />
        <input type="submit" name="submit" value="No" class="btn btn-default" />

        <input type="hidden" name="name" value="${ systemSetting.name }" />

    </fieldset>
</form>