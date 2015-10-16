<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Location</h2>

<h2> ${location.locationId} </h2>

<table class="table table-bordered table-hover">
    <tr>
        <th>Location Id</th>
        <td>
            ${location.locationId}
        </td>
    </tr>
    <tr>
        <th>Name</th>
        <td>
            ${location.name}
        </td>
    </tr>
    <tr>
        <th>Description</th>
        <td>
            ${location.description}
        </td>
    </tr>
    <tr>
        <th>Address1</th>
        <td>
            ${location.address1}
        </td>
    </tr>
    <tr>
        <th>Address2</th>
        <td>
            ${location.address2}
        </td>
    </tr>
    <tr>
        <th>City</th>
        <td>
            ${location.city}
        </td>
    </tr>
    <tr>
        <th>State</th>
        <td>
            ${location.state}
        </td>
    </tr>
    <tr>
        <th>Zip Code</th>
        <td>
            ${location.zipCode}
        </td>
    </tr>
    <tr>
        <th>Propertys</th>
        <td>
            <ul>
                <c:forEach items="${location.propertys}" var="item" varStatus="itemStatus" >
                    <li><a href="../property/edit?propertyId=${item.propertyId}" > ${item.propertyId}</a></li>
                </c:forEach>
            </ul>
        </td>
    </tr>
</table>