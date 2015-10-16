<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Delete Message</h2>

<c:url value="/message/delete" var="formActionUrl" />

<form method="post" action="${ formActionUrl }">
    <fieldset>
        <legend>Are you sure you want to delete this message?</legend>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Message Id</th>
                    <th>Message Name</th>
                    <th>Message Type</th>
                    <th>Version</th>
                    <th>Message Text</th>
                    <th>Irb Approval</th>
                    <th>Irb Approval Start Date</th>
                    <th>Irb Approval End Date</th>
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
        <input type="submit" name="submit" value="No" class="btn btn-default" />

        <input type="hidden" name="messageId" value="${ message.messageId }" />

    </fieldset>
</form>