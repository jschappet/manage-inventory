<%@ include file="/WEB-INF/include.jsp"  %>

<h2>System Setting List</h2>

<a href="add" class="btn btn-default">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table class="table table-bordered table-striped table-hover table-datatable">
    <thead>
        <tr>
            <th>Name</th>
            <th>Value</th>
            <th>Active</th>
            <th>Notes</th>
            <th>Last Updated By</th>
            <th>Last Updated</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${ systemSettingList }" var="systemSetting"  varStatus="status">
            <tr>
                <td><a href="edit?name=${systemSetting.name}">${systemSetting.name}</a></td>
                <td>${systemSetting.value}</td>
                <td>${systemSetting.active}</td>
                <td>${systemSetting.notes}</td>
                <td>${systemSetting.lastUpdatedBy}</td>
                <td>${systemSetting.lastUpdated}</td>
                <td>
                    <a href="edit?name=${systemSetting.name}">edit</a> 
                    <a href="show?name=${systemSetting.name}">view</a>
                    <a href="delete?name=${systemSetting.name}">delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>