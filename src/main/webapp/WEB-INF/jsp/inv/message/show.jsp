<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Message</h2>

<h2> ${message.messageId} </h2>

<table class="table table-bordered table-hover">
    <tr>
        <th>Message Id</th>
        <td>
            ${message.messageId}
        </td>
    </tr>
    <tr>
        <th>Message Name</th>
        <td>
            ${message.messageName}
        </td>
    </tr>
    <tr>
        <th>Message Type</th>
        <td>
            ${message.messageType}
        </td>
    </tr>
    <tr>
        <th>Version</th>
        <td>
            ${message.version}
        </td>
    </tr>
    <tr>
        <th>Message Text</th>
        <td>
            ${message.messageText}
        </td>
    </tr>
    <tr>
        <th>Irb Approval</th>
        <td>
            ${message.irbApproval}
        </td>
    </tr>
    <tr>
        <th>Irb Approval Start Date</th>
        <td>
            ${message.irbApprovalStartDate}
        </td>
    </tr>
    <tr>
        <th>Irb Approval End Date</th>
        <td>
            ${message.irbApprovalEndDate}
        </td>
    </tr>
    <tr>
        <th>Description</th>
        <td>
            ${message.description}
        </td>
    </tr>
</table>