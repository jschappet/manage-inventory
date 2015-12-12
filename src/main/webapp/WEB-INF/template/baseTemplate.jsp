<!DOCTYPE HTML>

<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/include.jsp"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html lang="en" data-framework="angularjs">
	<head>
		<tiles:insertAttribute name="head" />
	</head>
	<body ng-app="todomvc">
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
	</body>
</html>
