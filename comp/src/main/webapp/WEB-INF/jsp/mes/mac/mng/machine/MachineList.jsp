<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : MachineList.jsp
  * @Description : Machine List 화면
  * @Modification Information
  * 
  * @author sunghwan
  * @since 2021-07-02
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


function fn_egov_select(macCode) {
	document.getElementById("listForm").macCode.value = macCode;
   	document.getElementById("listForm").action = "<c:url value='/machine/updateMachineView.do'/>";
   	document.getElementById("listForm").submit();
}

/* 글 등록 화면 function */
function fn_egov_addView() {
   	document.getElementById("listForm").action = "<c:url value='/machine/addMachineView.do'/>";
   	document.getElementById("listForm").submit();		
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/machine/MachineList.do'/>";
   	document.getElementById("listForm").submit();
}

 // -->
</script>
</head>
<body>
<form:form commandName="searchVO" name="listForm" id="listForm" method="post">
	<input type="hidden" name="macCode" />
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
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
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
								<th align="center">MacCode</th>
								<th align="center">MacName</th>
								<th align="center">MacDiv</th>
								<th align="center">MacSize</th>
								<th align="center">Model</th>
								<th align="center">ProOper</th>
								<th align="center">Worker</th>
								<th align="center">Use</th>
								<th align="center">NomCap</th>
								<th align="center">UsingEnergy</th>
								<th align="center">Safety</th>
								<th align="center">MacProDate</th>
								<th align="center">BuyDate</th>
								<th align="center">BuyPrice</th>
								<th align="center">LineNum</th>
								<th align="center">MacLoadage</th>
								<th align="center">MacStdTemp</th>
							</tr>
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
													<td align="center" class="listtd"><a href="javascript:fn_egov_select('<c:out value="${result.macCode}"/>')"><c:out value="${result.macCode}"/></a>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.macName}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.macDiv}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.macSize}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.model}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.proOper}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.worker}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.use}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.nomCap}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.usingEnergy}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.safety}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.macProDate}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.buyDate}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.buyPrice}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.lineNum}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.macLoadage}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.macStdTemp}"/>&nbsp;</td>
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
