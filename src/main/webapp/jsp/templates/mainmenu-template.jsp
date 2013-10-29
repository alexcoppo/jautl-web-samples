<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://struts.apache.org/tags-tiles"%>

<div class="page-wrapper">
	<div class="site-header">
		<tiles:get name="header"/>
	</div>
	
	<div class="site-menu">
		<tiles:get name="menucolumn"/>
	</div>
	
	<div class="site-body">
		<tiles:get name="body"/>
	</div>
</div>
