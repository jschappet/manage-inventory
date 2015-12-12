<!DOCTYPE HTML>

<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/include.jsp"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html  lang="en" data-framework="angularjs">
	<head>
		<tiles:insertAttribute name="head" />
		<link rel="stylesheet" href="<c:url value="/resources/todomvc-common/base.css"/>">
		<link rel="stylesheet" href="<c:url value="/resources/todomvc-app-css/index.css"/>">
		<style>[ng-cloak] { display: none; }</style>
	</head>
	<body  ng-app="todomvc">
		<tiles:insertAttribute name="nav" />
		<div class="container-fluid" id="container">
			<div class="row" id="body">
				<div class="col-md-10 col-lg-10">
				
					<tiles:insertAttribute name="body" />
				</div>
				<div class="col-md-2 col-lg-2 col-xs-12">
					<div class="sidebar-nav">
						<tiles:insertAttribute name="menu" />
					</div>
				</div>
				
			</div>
			<div  id="footer">
					<tiles:insertAttribute name="footer" />
			</div>
		</div>
				<script src="<c:url value="/resources/todomvc-common/base.js"/>"></script>
		<script src="<c:url value="/resources/ng/js/app.js"/>"></script>
		<script src="<c:url value="/resources/ng/js/controllers/todoCtrl.js"/>"></script>
		<script src="<c:url value="/resources/ng/js/services/todoStorage.js"/>"></script>
		<script src="<c:url value="/resources/ng/js/directives/todoFocus.js"/>"></script>
		<script src="<c:url value="/resources/ng/js/directives/todoEscape.js"/>"></script>
		
	</body>
</html>
