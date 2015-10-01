<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Delete Property</h2>

<form method="post" action="delete.html">
    <fieldset>
        <legend>Are you sure you want to delete this Property?</legend>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>PropertyId</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>CreatedBy</th>
                    <th>Created</th>
                    <th>UpdatedBy</th>
                    <th>Updated</th>
                    <th>Tasks</th>
                    <th>Location</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        ${ property.propertyId }
                    </td>
                    <td>
                        ${ property.name }
                    </td>
                    <td>
                        ${ property.description }
                    </td>
                    <td>
                        ${ property.createdBy }
                    </td>
                    <td>
                        ${ property.created }
                    </td>
                    <td>
                        ${ property.updatedBy }
                    </td>
                    <td>
                        ${ property.updated }
                    </td>
                    <td>
                        <ul>
                            <c:forEach items="${ property.tasks }" var="item" varStatus="itemStatus">
                                <li>${ item.taskId }</li>
                            </c:forEach>
                        </ul>
                    </td>
                    <td>
                        ${ property.location }
                    </td>
                </tr>
            </tbody>
        </table>

        <input type="submit" name="submit" value="Yes" class="btn btn-danger" />
        <input type="submit" name="submit" value="No" class="btn" />

        <input type="hidden" name="propertyId" value="${ property.propertyId }" />

    </fieldset>
</form>