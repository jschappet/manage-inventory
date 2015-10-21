<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/include.jsp"  %>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<meta name="description" content="manage-inventory" />
<meta name="keywords" content="manage-inventory" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="<c:url value="/resources/favicon.ico" />" type="image/vnd.microsoft.icon" />
<%-- disables device zooming --%>
<%-- <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<link rel="shortcut icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/x-icon" /> --%>

<title>${ pageTitle }<c:if test="${ not empty pageTitle }"> : </c:if>manage-inventory</title>

<!-- jquery -->
<script type="text/javascript" src="<c:url value="/resources/jquery/dist/jquery.min.js"/>"></script>

<!-- bootstrap with paypal accessibility and datepicker-->
<link type="text/css" media="screen" rel="stylesheet" href="<c:url value="/resources/bootstrap/dist/css/bootstrap.min.css"/>" />
<link type="text/css" media="screen" rel="stylesheet" href="<c:url value="/resources/bootstrap-datepicker/dist/css/bootstrap-datepicker3.standalone.css"/>" />
<link type="text/css" media="screen" rel="stylesheet" href="<c:url value="/resources/bootstrapaccessibilityplugin/plugins/css/bootstrap-accessibility.css"/>" />
<script type="text/javascript" src="<c:url value="/resources/bootstrap/dist/js/bootstrap.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"/>"></script>
<!-- moved to footer so it will run automatically 
<script type="text/javascript" src="<c:url value="/resources/bootstrapaccessibilityplugin/plugins/js/bootstrap-accessibility.min.js"/>"></script>
-->

<!-- data tables and responsive data tables --->
<script type="text/javascript" src="<c:url value="/resources/datatables/media/js/jquery.dataTables.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/datatables-responsive/js/dataTables.responsive.js" />"></script>
<link type="text/css" media="screen" rel="stylesheet" href="<c:url value="/resources/datatables/media/css/jquery.dataTables.min.css" />" />
<link type="text/css" media="screen" rel="stylesheet" href="<c:url value="/resources/datatables-responsive/css/dataTables.responsive.css" />" />

<!-- angular js -->
<script type="text/javascript" src="<c:url value="/resources/angular/angular.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/angular-ui-grid/ui-grid.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/angular-resource/angular-resource.min.js" />"></script>
<link type="text/css" media="screen" rel="stylesheet" href="<c:url value="/resources/angular-ui-grid/ui-grid.min.css"/>" />

<!-- D3 stuff -->
<script type="text/javascript" src="<c:url value="/resources/d3/d3.min.js" />"></script>

<!-- no ui slider and qtip2 -->
<script type="text/javascript" src="<c:url value="/resources/qtip2/jquery.qtip.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/nouislider/distribute/jquery.nouislider.all.min.js" />"></script>
<link type="text/css" media="screen" rel="stylesheet" href="<c:url value="/resources/qtip2/jquery.qtip.min.css"/>" />
<link type="text/css" media="screen" rel="stylesheet" href="<c:url value="/resources/nouislider/distribute/jquery.nouislider.min.css"/>" />
<link type="text/css" media="screen" rel="stylesheet" href="<c:url value="/resources/nouislider/distribute/jquery.nouislider.pips.min.css"/>" />

<%--
<!-- bootstrap data tables -->
<script type="text/javascript" src="<c:url value="/resources/datatable/media/js/dataTables.bootstrap.js" />"></script>
<link type="text/css" media="screen" rel="stylesheet" href="<c:url value="/resources/datatable/media/css/dataTables.bootstrap.css" />" />

<!-- jquery -->
<link type="text/css" media="screen" rel="stylesheet" href="<c:url value="/resources/jquery/development-bundle/themes/base/jquery.ui.all.css"/>"/>
<script type="text/javascript" src="<c:url value="/resources/jquery/js/jquery-ui-1.9.1.custom.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/jquery/development-bundle/external/jquery.cookie.js"/>"></script>

<!-- touch punch - jQuery support for touch screens -->
<script type="text/javascript" src="<c:url value="/resources/touch-punch/jquery.ui.touch-punch.min.js"/>"></script>

<!-- tiny mce -->
<script type="text/javascript" src="<c:url value="/resources/tinymce/tinymce.min.js" />" ></script>
--%>



<!-- application css and js -->
<link type="text/css" media="screen" rel="stylesheet" href="<c:url value="/resources/css/layout.css"/>" />
<script type="text/javascript" src="<c:url value="/resources/js/utils.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/messager.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/init.js" />"></script>

<!--[if lte IE 8]>
<script type="text/javascript" src="<c:url value="/resources/js/json2.js" />"></script>
<![endif]-->

<c:url value="/resources/images/loading.gif" var="dtLoadingUrl" />
<script type="text/javascript">

	$.extend( true, $.fn.dataTable.defaults, {
		jQueryUI : false,
		pagingType : 'full_numbers',
		dom : "<'row'<'col-xs-6'l><'col-xs-6'f>r>" + "t" + "<'row'<'col-xs-6'i><'col-xs-6'p>>",
		language : {
			emptyTable 	: "No data found matching your criteria.",
			processing 	: "<img src='${ dtLoadingUrl }' alt='loading...\' />",
			infoEmpty 	: ""
		}
	} );
	
	$.extend( true, $.fn.dataTable.ext.classes, {
		sPageButton : 'btn btn-primary',
		sPageButtonActive : 'disabled'
	} );

	$(function(){
		intializePage(); // see resources/js/init.js 
	});
	
</script>

<%--
NEED JIRA ISSUE COLLECTOR
<script type="text/javascript" src="https://www.icts.uiowa.edu/jira/s/en_US8f0l6v-1988229788/6099/18/1.4.0-m3/_/download/batch/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector.js?collectorId=bdc2a3bb"></script>
--%>