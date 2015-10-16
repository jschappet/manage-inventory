<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Delete Property</h2>

<c:url value="/property/delete" var="formActionUrl" />

<form method="post" action="${ formActionUrl }">
    <fieldset>
        <legend>Are you sure you want to delete this property?</legend>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Property Id</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Created By</th>
                    <th>Created</th>
                    <th>Updated By</th>
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
        <input type="submit" name="submit" value="No" class="btn btn-default" />

        <input type="hidden" name="propertyId" value="${ property.propertyId }" />

    </fieldset>
</form>