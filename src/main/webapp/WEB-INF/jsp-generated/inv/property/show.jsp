<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Property</h2>
<h2> ${property.propertyId} </h2>

<table class="table table-bordered table-hover">
    <tr>
        <th>PropertyId</th>
        <td>
            ${property.propertyId}
        </td>
    </tr>
    <tr>
        <th>Name</th>
        <td>
            ${property.name}
        </td>
    </tr>
    <tr>
        <th>Description</th>
        <td>
            ${property.description}
        </td>
    </tr>
    <tr>
        <th>CreatedBy</th>
        <td>
            ${property.createdBy}
        </td>
    </tr>
    <tr>
        <th>Created</th>
        <td>
            ${property.created}
        </td>
    </tr>
    <tr>
        <th>UpdatedBy</th>
        <td>
            ${property.updatedBy}
        </td>
    </tr>
    <tr>
        <th>Updated</th>
        <td>
            ${property.updated}
        </td>
    </tr>
    <tr>
        <th>Tasks</th>
        <td>
            <ul>
                <c:forEach items="${property.tasks}" var="item" varStatus="itemStatus" >
                    <li><a href="../task/edit.html?taskId=${item.taskId}" > ${item.taskId}</a></li>
                </c:forEach>
            </ul>
        </td>
    </tr>
    <tr>
        <th>Location</th>
        <td>
            ${property.location}
        </td>
    </tr>
</table>