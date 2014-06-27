<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Message List</h2>

<a href="add.html" class="btn">Add</a>

<div id="error_div" class="alert alert-error" style="display: none;">
    <%-- div for showing errors, see messager.js.showMessage --%>
</div>

<table class="table table-bordered table-striped table-hover">
    <thead>
        <tr>
            <th>MessageId</th>
            <th>MessageName</th>
            <th>MessageType</th>
            <th>Version</th>
            <th>MessageText</th>
            <th>IrbApproval</th>
            <th>IrbApprovalStartDate</th>
            <th>IrbApprovalEndDate</th>
            <th>Description</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${messageList}" var="message"  varStatus="status">
            <tr>
                <td><a href="edit.html?messageId=${message.messageId}">${message.messageId}</a></td>
                <td>${message.messageName}</td>
                <td>${message.messageType}</td>
                <td>${message.version}</td>
                <td>${message.messageText}</td>
                <td>${message.irbApproval}</td>
                <td>${message.irbApprovalStartDate}</td>
                <td>${message.irbApprovalEndDate}</td>
                <td>${message.description}</td>
                <td>
                    <a href="edit.html?messageId=${message.messageId}">edit</a> 
                    <a href="show.html?messageId=${message.messageId}">view</a>
                    <a href="delete.html?messageId=${message.messageId}">delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>