<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/include.jsp"  %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="description" content="manage inventory" />
<meta name="keywords" content="manage inventory" />
<link rel="shortcut icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/x-icon" >

<title>${pageTitle} <c:if test="${not empty pageTitle}">:</c:if>manage-inventory</title>

<!-- bootstrap -->
<script type="text/javascript" src="<c:url value="/resources/jquery/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/bootstrap/js/bootstrap.js"/>"></script>

<!-- jquery -->
<link type="text/css" media="screen" rel="stylesheet" href="<c:url value="/resources/jquery/development-bundle/themes/base/jquery.ui.all.css"/>"/>
<script type="text/javascript" src="<c:url value="/resources/jquery/js/jquery-ui-1.9.1.custom.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/jquery/development-bundle/external/jquery.cookie.js"/>"></script>

<!-- touch punch - jQuery support for touch screens -->
<script type="text/javascript" src="<c:url value="/resources/touch-punch/jquery.ui.touch-punch.min.js"/>"></script>

<!-- data tables -->
<script type="text/javascript" src="<c:url value="/resources/datatable/media/js/jquery.dataTables.min.js"/>" ></script>
<script type="text/javascript" src="<c:url value="/resources/datatable/media/js/dataTables.bootstrap.js"/>" ></script>
<link type="text/css" href="<c:url value="/resources/datatable/media/css/dataTables.bootstrap.css"/>" rel="stylesheet" >

<!-- tiny mce -->
<script type="text/javascript" src="<c:url value="/resources/tinymce/tinymce.min.js" />" ></script>

<!-- bootstrap -->
<link type="text/css" media="screen" rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.css"/>" />
<link type="text/css" media="screen" rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap-responsive.css"/>" />

<!-- application css and js -->
<link type="text/css" media="screen" rel="stylesheet" href="<c:url value="/resources/css/layout.css"/>" />
<script type="text/javascript" src="<c:url value="/resources/js/utils.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/messager.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/init.js" />"></script>

<!--[if lte IE 8]>
<script type="text/javascript" src="<c:url value="/resources/js/json2.js" />"></script>
<![endif]-->

<script type="text/javascript">
	$(function(){
		intializePage(); // see resources/js/init.js 
	});
</script>
