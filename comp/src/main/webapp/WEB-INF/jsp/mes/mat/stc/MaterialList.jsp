<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : MaterialList.jsp
  * @Description : Material List 화면
  * @Modification Information
  * 
  * @author material
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


function fn_egov_select(matCode) {
	document.getElementById("listForm").matCode.value = matCode;
   	document.getElementById("listForm").action = "<c:url value='/material/updateMaterialView.do'/>";
   	document.getElementById("listForm").submit();
}

/* 글 등록 화면 function */
function fn_egov_addView() {
   	document.getElementById("listForm").action = "<c:url value='/material/addMaterialView.do'/>";
   	document.getElementById("listForm").submit();		
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/material/MaterialList.do'/>";
   	document.getElementById("listForm").submit();
}

 // -->
</script>
</head>
<body>
<form:form commandName="searchVO" name="listForm" id="listForm" method="post">
	<input type="hidden" name="matCode" />
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
								<col/>				
								<col/>				
								<col/>				
								<col/>				
								<col/>				
							</colgroup>		  
			<tr>
								<th align="center">MatCode</th>
								<th align="center">OperCode</th>
								<th align="center">MatName</th>
								<th align="center">MatBarcode</th>
								<th align="center">MatSize</th>
								<th align="center">MatUnit</th>
								<th align="center">EmpId</th>
								<th align="center">MatGrp</th>
								<th align="center">MatDiv</th>
								<th align="center">MatKindDiv</th>
								<th align="center">MatUsing</th>
								<th align="center">MatTesting</th>
								<th align="center">Cylinder</th>
								<th align="center">MatLotDiv</th>
								<th align="center">MatSafeStockMag</th>
								<th align="center">MatSafeStock</th>
								<th align="center">MatSafeDate</th>
								<th align="center">MatPrdDate</th>
								<th align="center">Mat1mUsage</th>
								<th align="center">Mat6mUsage</th>
								<th align="center">MatMinStock</th>
								<th align="center">MatMaxStcok</th>
							</tr>
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
													<td align="center" class="listtd"><a href="javascript:fn_egov_select('<c:out value="${result.matCode}"/>')"><c:out value="${result.matCode}"/></a>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.operCode}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.matName}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.matBarcode}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.matSize}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.matUnit}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.empId}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.matGrp}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.matDiv}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.matKindDiv}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.matUsing}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.matTesting}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.cylinder}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.matLotDiv}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.matSafeStockMag}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.matSafeStock}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.matSafeDate}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.matPrdDate}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.mat1mUsage}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.mat6mUsage}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.matMinStock}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.matMaxStcok}"/>&nbsp;</td>
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
