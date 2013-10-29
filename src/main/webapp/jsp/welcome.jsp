<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://struts.apache.org/tags-tiles"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>"/>
<title>JAUTL Web Samples Suite</title>
</head>
<body>

<tiles:insert page="/jsp/templates/mainmenu-template.jsp">
	<tiles:put name="header" content="/jsp/templates/mainmenu-header.jsp"/>
	<tiles:put name="menucolumn" content="/jsp/templates/mainmenu-menucolumn.jsp"/>
	<tiles:put name="body" content="/jsp/templates/mainmenu-body.jsp"/>
</tiles:insert>

</body>
</html>