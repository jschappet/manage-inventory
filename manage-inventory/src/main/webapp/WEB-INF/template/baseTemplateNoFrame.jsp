<!DOCTYPE HTML>

<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/include.jsp"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>
	<head>
		<tiles:insertAttribute name="head" />
	</head>
	<body>
		<div class="row" id="body">
			<div class="col-md-12">
				<tiles:insertAttribute name="body" />
			</div>
		</div>
	</body>
</html>

