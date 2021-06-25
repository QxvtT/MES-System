<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : ProducePlanDList.jsp
  * @Description : ProducePlanD List 화면
  * @Modification Information
  * 
  * @author Jeoung
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
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
/* 글 수정 화면 function */


function fn_egov_select(prdPlanDNum) {
	document.getElementById("listForm").prdPlanDNum.value = prdPlanDNum;
   	document.getElementById("listForm").action = "<c:url value='/producePlanD/updateProducePlanDView.do'/>";
   	document.getElementById("listForm").submit();
}

/* 글 등록 화면 function */
function fn_egov_addView() {
   	document.getElementById("listForm").action = "<c:url value='/producePlanD/addProducePlanDView.do'/>";
   	document.getElementById("listForm").submit();		
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/producePlanD/ProducePlanDList.do'/>";
   	document.getElementById("listForm").submit();
}

 // -->
</script>
</head>
<body>
<form:form commandName="searchVO" name="listForm" id="listForm" method="post">
	<input type="hidden" name="prdPlanDNum" />
<div id="content_pop">
	<!-- 타이틀 -->
	<div id="title">
		<ul>
			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt="title" /> List </li>
		</ul>
	</div>
	<!-- // 타이틀 -->
	<!-- List -->
	<div id="table">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table">
			<colgroup>
								<col/>				
								<col/>				
								<col/>				
								<col/>				
								<col/>				
								<col/>				
								<col/>				
								<col/>				
								<col/>				
							</colgroup>		  
			<tr>
								<th align="center">PrdPlanDNum</th>
								<th align="center">PrdNum</th>
								<th align="center">ItmCode</th>
								<th align="center">PrdWorkVol</th>
								<th align="center">PrdPlanDate</th>
								<th align="center">PrdNo</th>
								<th align="center">PrdNote</th>
								<th align="center">ComChk</th>
								<th align="center">OrdNum</th>
							</tr>
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
													<td align="center" class="listtd"><a href="javascript:fn_egov_select('<c:out value="${result.prdPlanDNum}"/>')"><c:out value="${result.prdPlanDNum}"/></a>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.prdNum}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.itmCode}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.prdWorkVol}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.prdPlanDate}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.prdNo}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.prdNote}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.comChk}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.ordNum}"/>&nbsp;</td>
				    			</tr>
			</c:forEach>
		</table>
	</div>
	<!-- /List -->
	<div id="paging">
		<ui:pagination paginationInfo = "${paginationInfo}"
				   type="image"
				   jsFunction="fn_egov_link_page"
				   />
		<form:hidden path="pageIndex" />
	</div>
	<div id="sysbtn1">
		<ul>
			<li>
				<div id="sysbtn">
					<span class="btn_blue_l"><a href="javascript:fn_egov_addView();">등록</a><img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" alt="" />
					</span>
				</div>
			</li>
		</ul>
	</div>
</div>
</form:form>
</body>
</html>
