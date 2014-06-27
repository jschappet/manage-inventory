<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/include.jsp"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>
	<head>
		<tiles:insertAttribute name="head" />
	</head>
	<body>
		<tiles:insertAttribute name="nav" />
		<tiles:insertAttribute name="branding" />
		<div class="container-fluid" id="container">
			<hr/>
			<div class="row-fluid" id="body">
				<div class="span2">
					<div class="well sidebar-nav">
						<tiles:insertAttribute name="menu" />
					</div>
				</div>
				<div class="span10">
					<tiles:insertAttribute name="body" />
				</div>
			</div>
			<div id="footer" class="row-fluid">
				<div class="span12">
					<tiles:insertAttribute name="footer" />
				</div>
			</div>
		</div>
	</body>
</html>