<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Location List</h2>

<a href="add" class="btn btn-default">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table class="table table-bordered table-striped table-hover table-datatable">
    <thead>
        <tr>
            <th>Location Id</th>
            <th>Name</th>
            <th>Description</th>
            <th>Address1</th>
            <th>Address2</th>
            <th>City</th>
            <th>State</th>
            <th>Zip Code</th>
            <th>Propertys</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${ locationList }" var="location"  varStatus="status">
            <tr>
                <td><a href="edit?locationId=${location.locationId}">${location.locationId}</a></td>
                <td>${location.name}</td>
                <td>${location.description}</td>
                <td>${location.address1}</td>
                <td>${location.address2}</td>
                <td>${location.city}</td>
                <td>${location.state}</td>
                <td>${location.zipCode}</td>
                <td>propertys</td>
                <td>
                    <a href="edit?locationId=${location.locationId}">edit</a> 
                    <a href="show?locationId=${location.locationId}">view</a>
                    <a href="delete?locationId=${location.locationId}">delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>