<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Property List</h2>

<a href="add.html" class="btn">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table class="table table-bordered table-striped table-hover">
    <thead>
        <tr>
            <th>PropertyId</th>
            <th>Name</th>
            <th>Description</th>
            <th>Location</th>
            <th>CreatedBy</th>
            <th>Created</th>
            <th>UpdatedBy</th>
            <th>Updated</th>
            <th>Tasks</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${propertyList}" var="property"  varStatus="status">
            <tr>
                <td><a href="edit.html?propertyId=${property.propertyId}">${property.propertyId}</a></td>
                <td>${property.name}</td>
                <td>${property.description}</td>
                <td>${property.location}</td>
                <td>${property.createdBy}</td>
                <td>${property.created}</td>
                <td>${property.updatedBy}</td>
                <td>${property.updated}</td>
                <td>tasks</td>
                <td>
                    <a href="edit.html?propertyId=${property.propertyId}">edit</a> 
                    <a href="show.html?propertyId=${property.propertyId}">view</a>
                    <a href="delete.html?propertyId=${property.propertyId}">delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>