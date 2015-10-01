<%@ include file="/WEB-INF/include.jsp"  %>

<h2>SystemSetting List</h2>

<a href="add.html" class="btn">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table class="table table-bordered table-striped table-hover">
    <thead>
        <tr>
            <th>Name</th>
            <th>Value</th>
            <th>Active</th>
            <th>Notes</th>
            <th>LastUpdatedBy</th>
            <th>LastUpdated</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${systemSettingList}" var="systemSetting"  varStatus="status">
            <tr>
                <td><a href="edit.html?name=${systemSetting.name}">${systemSetting.name}</a></td>
                <td>${systemSetting.value}</td>
                <td>${systemSetting.active}</td>
                <td>${systemSetting.notes}</td>
                <td>${systemSetting.lastUpdatedBy}</td>
                <td>${systemSetting.lastUpdated}</td>
                <td>
                    <a href="edit.html?name=${systemSetting.name}">edit</a> 
                    <a href="show.html?name=${systemSetting.name}">view</a>
                    <a href="delete.html?name=${systemSetting.name}">delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>