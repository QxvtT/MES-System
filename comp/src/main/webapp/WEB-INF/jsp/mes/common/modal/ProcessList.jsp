<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	/**
 * @Class Name : OperationList.jsp
 * @Description : Operation List 화면
 * @Modification Information
 * 
 * @author sunghwan
 * @since 2021-06-29
 * @version 1.0
 * @see
 *  
 * Copyright (C) All right reserved.
 */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>목록</title>
<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/sample.css'/>" />
<script type="text/javaScript" language="javascript" defer="defer">
<!--
	/* 글 수정 화면 function */

	function fn_egov_select(operCode) {
		document.getElementById("listForm").operCode.value = operCode;
		document.getElementById("listForm").action = "<c:url value='/operation/updateOperationView.do'/>";
		document.getElementById("listForm").submit();
	}

	/* 글 등록 화면 function */
	function fn_egov_addView() {
		document.getElementById("listForm").action = "<c:url value='/operation/addOperationView.do'/>";
		document.getElementById("listForm").submit();
	}

	/* pagination 페이지 링크 function */
	function fn_egov_link_page(pageNo) {
		document.getElementById("listForm").pageIndex.value = pageNo;
		document.getElementById("listForm").action = "<c:url value='/operation/OperationList.do'/>";
		document.getElementById("listForm").submit();
	}
// -->
</script>
</head>
<body>
	Precess
</body>
</html>
