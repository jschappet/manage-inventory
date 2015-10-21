<%@ include file="/WEB-INF/include.jsp"  %>

<h2>Task Type</h2>

<h2> ${taskType.typeId} </h2>

<table class="table table-bordered table-hover">
    <tr>
        <th>Type Id</th>
        <td>
            ${taskType.typeId}
        </td>
    </tr>
    <tr>
        <th>Name</th>
        <td>
            ${taskType.name}
        </td>
    </tr>
</table>