<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<title><spring:message code="comUatUia.title" /></title><!-- 로그인 -->
<meta http-equiv="content-type" content="text/html; charset=utf-8">

<script type="text/javaScript" language="javascript">
	$.ajax({
		async: false,
		url : "selectMenuList",
		type : "get",
		data : {uniqId: "${LoginVO.uniqId}"
				},
		dataType: "json",
		success : function(result){
			console.log(result);
			
		} // end success
	}); // end ajax 

</script>
</head>
<body>
메뉴리스트

</body>
</html>


