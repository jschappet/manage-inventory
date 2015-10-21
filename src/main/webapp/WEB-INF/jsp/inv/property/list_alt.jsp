<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Property List</h2>

<a href="add" class="btn btn-default">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table class="table table-bordered table-striped table-hover table-datatable">
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
            <th>Work Logs</th>
            <th>Location</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${ propertyList }" var="property"  varStatus="status">
            <tr>
                <td><a href="edit?propertyId=${property.propertyId}">${property.propertyId}</a></td>
                <td>${property.name}</td>
                <td>${property.description}</td>
                <td>${property.createdBy}</td>
                <td>${property.created}</td>
                <td>${property.updatedBy}</td>
                <td>${property.updated}</td>
                <td>tasks</td>
                <td>workLogs</td>
                <td>${property.location.locationId}</td>
                <td>
                    <a href="edit?propertyId=${property.propertyId}">edit</a> 
                    <a href="show?propertyId=${property.propertyId}">view</a>
                    <a href="delete?propertyId=${property.propertyId}">delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>