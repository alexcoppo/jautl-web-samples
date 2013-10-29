<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://struts.apache.org/tags-tiles"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/jquery-ui.css'/>"/>
<script type="text/javascript" src="<c:url value='/js/jquery-1.10.2.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/messagedigest.js'/>"></script>

<script type="text/javascript">
var JSPVARS = {
	enumEnginesUrl : "<c:url value='/messagedigest_api_enumengine.do'/>",
	computeHashUrl : "<c:url value='/messagedigest_api_computehash.do'/>",
	runBenchmarkUrl : "<c:url value='/messagedigest_api_hashbenchmark.do'/>"
};
</script>
</head>
<body>

<tiles:insert page="/jsp/templates/mainmenu-template.jsp">
	<tiles:put name="header" content="/jsp/templates/mainmenu-header.jsp"/>
	<tiles:put name="menucolumn" content="/jsp/templates/mainmenu-menucolumn.jsp"/>
	<tiles:put name="body" content="/jsp/templates/message-digest-body.jsp"/>
</tiles:insert>

</body>
</html>