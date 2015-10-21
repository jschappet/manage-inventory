<%@ include file="/WEB-INF/include.jsp"  %>

<h2>System Setting</h2>

<h2> ${systemSetting.name} </h2>

<table class="table table-bordered table-hover">
    <tr>
        <th>Name</th>
        <td>
            ${systemSetting.name}
        </td>
    </tr>
    <tr>
        <th>Value</th>
        <td>
            ${systemSetting.value}
        </td>
    </tr>
    <tr>
        <th>Active</th>
        <td>
            ${systemSetting.active}
        </td>
    </tr>
    <tr>
        <th>Notes</th>
        <td>
            ${systemSetting.notes}
        </td>
    </tr>
    <tr>
        <th>Last Updated By</th>
        <td>
            ${systemSetting.lastUpdatedBy}
        </td>
    </tr>
    <tr>
        <th>Last Updated</th>
        <td>
            ${systemSetting.lastUpdated}
        </td>
    </tr>
</table>