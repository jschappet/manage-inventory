<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Delete Location</h2>

<form method="post" action="delete.html">
    <fieldset>
        <legend>Are you sure you want to delete this Location?</legend>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>LocationId</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Address1</th>
                    <th>Address2</th>
                    <th>City</th>
                    <th>State</th>
                    <th>ZipCode</th>
                    <th>Propertys</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        ${ location.locationId }
                    </td>
                    <td>
                        ${ location.name }
                    </td>
                    <td>
                        ${ location.description }
                    </td>
                    <td>
                        ${ location.address1 }
                    </td>
                    <td>
                        ${ location.address2 }
                    </td>
                    <td>
                        ${ location.city }
                    </td>
                    <td>
                        ${ location.state }
                    </td>
                    <td>
                        ${ location.zipCode }
                    </td>
                    <td>
                        <ul>
                            <c:forEach items="${ location.propertys }" var="item" varStatus="itemStatus">
                                <li>${ item.propertyId }</li>
                            </c:forEach>
                        </ul>
                    </td>
                </tr>
            </tbody>
        </table>

        <input type="submit" name="submit" value="Yes" class="btn btn-danger" />
        <input type="submit" name="submit" value="No" class="btn" />

        <input type="hidden" name="locationId" value="${ location.locationId }" />

    </fieldset>
</form>