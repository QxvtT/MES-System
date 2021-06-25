<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	/**
 * @Class Name : MaterialStockList.jsp
 * @Description : MaterialStock List 화면
 * @Modification Information
 * 
 * @author materialStock
 * @since 2021-06-25
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

	function fn_egov_select(lotNum, matCode) {
		document.getElementById("listForm").lotNum.value = lotNum;
		document.getElementById("listForm").matCode.value = matCode;
		document.getElementById("listForm").action = "<c:url value='/materialStock/updateMaterialStockView.do'/>";
		document.getElementById("listForm").submit();
	}

	/* 글 등록 화면 function */
	function fn_egov_addView() {
		document.getElementById("listForm").action = "<c:url value='/materialStock/addMaterialStockView.do'/>";
		document.getElementById("listForm").submit();
	}

	/* pagination 페이지 링크 function */
	function fn_egov_link_page(pageNo) {
		document.getElementById("listForm").pageIndex.value = pageNo;
		document.getElementById("listForm").action = "<c:url value='/materialStock/MaterialStockList.do'/>";
		document.getElementById("listForm").submit();
	}
// -->
</script>
</head>
<body>
	<form:form commandName="searchVO" name="listForm" id="listForm"
		method="post">
		<input type="hidden" name="lotNum" />
		<input type="hidden" name="matCode" />
		<div id="content_pop">
			<!-- 타이틀 -->
			<div id="title">
				<h3>자재 재고 조회</h3><br/>
			</div>
			<!-- // 타이틀 -->
			<div id="table">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<colgroup>
						<col />
						<col />
						<col />
					</colgroup>
					<tr>
						<th align="center">자재코드</th>
						<th align="center">자재명</th>
						<th align="center">자재구분</th>
						<th align="center">안전재고</th>
						<th align="center">이월량</th>
						<th align="center">입고량</th>
						<th align="center">출고량</th>
						<th align="center">현재고</th>
						<th align="center">미달량</th>
						<th align="center">특기사항</th>
					</tr>
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr>
							<td align="center" class="listtd"><a
								href="javascript:fn_egov_select('<c:out value="${result.lotNum}"/>', '<c:out value="${result.matCode}"/>')"><c:out
										value="${result.lotNum}" /></a>&nbsp;</td>
							<td align="center" class="listtd"><a
								href="javascript:fn_egov_select('<c:out value="${result.lotNum}"/>', '<c:out value="${result.matCode}"/>')"><c:out
										value="${result.matCode}" /></a>&nbsp;</td>
							<td align="center" class="listtd"><c:out
									value="${result.matVol}" />&nbsp;</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- /List -->
			<div id="paging">
				<ui:pagination paginationInfo="${paginationInfo}" type="image"
					jsFunction="fn_egov_link_page" />
				<form:hidden path="pageIndex" />
			</div>
			<div id="sysbtn1">
				<ul>
					<li>
						<div id="sysbtn">
							<span class="btn_blue_l"><a
								href="javascript:fn_egov_addView();">등록</a><img
								src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>"
								alt="" /> </span>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</form:form>
</body>
</html>
