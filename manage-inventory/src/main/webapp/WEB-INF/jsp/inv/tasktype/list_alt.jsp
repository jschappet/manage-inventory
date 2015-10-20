<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Task Type List</h2>

<a href="add" class="btn btn-default">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table class="table table-bordered table-striped table-hover table-datatable">
    <thead>
        <tr>
            <th>Type Id</th>
            <th>Name</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${ taskTypeList }" var="taskType"  varStatus="status">
            <tr>
                <td><a href="edit?typeId=${taskType.typeId}">${taskType.typeId}</a></td>
                <td>${taskType.name}</td>
                <td>
                    <a href="edit?typeId=${taskType.typeId}">edit</a> 
                    <a href="show?typeId=${taskType.typeId}">view</a>
                    <a href="delete?typeId=${taskType.typeId}">delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>