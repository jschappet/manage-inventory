<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Delete Message</h2>

<form method="post" action="delete.html">
    <fieldset>
        <legend>Are you sure you want to delete this Message?</legend>
        <table class="table table-bordered table-hover">
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
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        ${ message.messageId }
                    </td>
                    <td>
                        ${ message.messageName }
                    </td>
                    <td>
                        ${ message.messageType }
                    </td>
                    <td>
                        ${ message.version }
                    </td>
                    <td>
                        ${ message.messageText }
                    </td>
                    <td>
                        ${ message.irbApproval }
                    </td>
                    <td>
                        ${ message.irbApprovalStartDate }
                    </td>
                    <td>
                        ${ message.irbApprovalEndDate }
                    </td>
                    <td>
                        ${ message.description }
                    </td>
                </tr>
            </tbody>
        </table>

        <input type="submit" name="submit" value="Yes" class="btn btn-danger" />
        <input type="submit" name="submit" value="No" class="btn" />

        <input type="hidden" name="messageId" value="${ message.messageId }" />

    </fieldset>
</form>