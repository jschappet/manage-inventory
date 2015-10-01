<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Location List</h2>

<a href="add.html" class="btn">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table class="table table-bordered table-striped table-hover">
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
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${locationList}" var="location"  varStatus="status">
            <tr>
                <td><a href="edit.html?locationId=${location.locationId}">${location.locationId}</a></td>
                <td>${location.name}</td>
                <td>${location.description}</td>
                <td>${location.address1}</td>
                <td>${location.address2}</td>
                <td>${location.city}</td>
                <td>${location.state}</td>
                <td>${location.zipCode}</td>
                <td>propertys</td>
                <td>
                    <a href="edit.html?locationId=${location.locationId}">edit</a> 
                    <a href="show.html?locationId=${location.locationId}">view</a>
                    <a href="delete.html?locationId=${location.locationId}">delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>