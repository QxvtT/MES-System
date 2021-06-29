<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : MaterialOrderRegister.jsp
  * @Description : MaterialOrder Register 화면
  * @Modification Information
  * 
  * @author materialOrder
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

<c:set var="registerFlag" value="${empty materialOrderVO.matOrdNum ? '등록' : '수정'}"/>

<title> <c:out value="${registerFlag}"/> </title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>

<!--For Commons Validator Client Side-->
<!-- script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script -->
<!-- validator:javascript formName="materialOrderVO" staticJavascript="false" xhtml="true" cdata="false"/ -->

<script type="text/javaScript" language="javascript" defer="defer">
<!--
/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/materialOrder/MaterialOrderList.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 삭제 function */
function fn_egov_delete() {
   	document.getElementById("detailForm").action = "<c:url value='/materialOrder/deleteMaterialOrder.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 등록 function */
function fn_egov_save() {	
	frm = document.getElementById("detailForm");

	/* TODO Validation기능 보완 */
	
  	frm.action = "<c:url value="${registerFlag == '등록' ? '/materialOrder/addMaterialOrder.do' : '/materialOrder/updateMaterialOrder.do'}"/>";
    frm.submit();

}

// -->
</script>
</head>
<body>

<form:form commandName="materialOrderVO" name="detailForm" id="detailForm" >
<div id="content_pop">
	<!-- 타이틀 -->
	<div id="title">
		<ul>
			<li><img src="<c:url value='/images//title_dot.gif'/>" alt="" /><c:out value="${registerFlag}"/></li>
		</ul>
	</div>
	<!-- // 타이틀 -->
	<div id="table">
	<table width="100%" border="1" cellpadding="0" cellspacing="0" >
		<colgroup>
			<col width="150"/>
			<col width=""/>
		</colgroup>
			
		<c:if test="${registerFlag == '수정'}">
	   <tr>
			<th>MAT_ORD_NUM *</th>
			<td>
				<form:input path="matOrdNum" cssClass="essentiality" readonly="true" />
			</td>			
		</tr>	
		</c:if>
		<c:if test="${registerFlag == '등록'}">
	   <tr>
			<th>MAT_ORD_NUM *</th>
			<td>
				<form:input path="matOrdNum" cssClass="txt" readonly="false" />
			</td>			
		</tr>	
		</c:if>		
		<tr>
			<th>MAT_ORD_DATE</th>
			<td>
				<form:input path="matOrdDate" cssClass="txt"/>
				&nbsp;<form:errors path="matOrdDate" />
			</td>
		</tr>	
		<tr>
			<th>MAT_ORD_OPER</th>
			<td>
				<form:input path="matOrdOper" cssClass="txt"/>
				&nbsp;<form:errors path="matOrdOper" />
			</td>
		</tr>	
		<tr>
			<th>MAT_CODE</th>
			<td>
				<form:input path="matCode" cssClass="txt"/>
				&nbsp;<form:errors path="matCode" />
			</td>
		</tr>	
		<tr>
			<th>MAT_COM_DATE</th>
			<td>
				<form:input path="matComDate" cssClass="txt"/>
				&nbsp;<form:errors path="matComDate" />
			</td>
		</tr>	
		<tr>
			<th>OPER_CODE</th>
			<td>
				<form:input path="operCode" cssClass="txt"/>
				&nbsp;<form:errors path="operCode" />
			</td>
		</tr>	
		<tr>
			<th>MAT_VOL</th>
			<td>
				<form:input path="matVol" cssClass="txt"/>
				&nbsp;<form:errors path="matVol" />
			</td>
		</tr>	
		<tr>
			<th>MAT_ORD_VOL</th>
			<td>
				<form:input path="matOrdVol" cssClass="txt"/>
				&nbsp;<form:errors path="matOrdVol" />
			</td>
		</tr>	
		<tr>
			<th>MAT_NORD_VOL</th>
			<td>
				<form:input path="matNordVol" cssClass="txt"/>
				&nbsp;<form:errors path="matNordVol" />
			</td>
		</tr>	
		<tr>
			<th>MAT_ORD_NOTE</th>
			<td>
				<form:input path="matOrdNote" cssClass="txt"/>
				&nbsp;<form:errors path="matOrdNote" />
			</td>
		</tr>	
	</table>
  </div>
	<div id="sysbtn">
		<ul>
			<li><span class="btn_blue_l"><a href="javascript:fn_egov_selectList();">List</a><img src="<c:url value='/images//btn_bg_r.gif'/>" alt="" /></span></li>
			<li><span class="btn_blue_l"><a href="javascript:fn_egov_save();"><c:out value='${registerFlag}'/></a><img src="<c:url value='/images//btn_bg_r.gif'/>" alt="" /></span></li>
			<c:if test="${registerFlag == '수정'}">
			<li><span class="btn_blue_l"><a href="javascript:fn_egov_delete();">삭제</a><img src="<c:url value='/images//btn_bg_r.gif'/>" alt="" /></span></li>
			</c:if>
			<li><span class="btn_blue_l"><a href="javascript:document.detailForm.reset();">Reset</a><img src="<c:url value='/images//btn_bg_r.gif'/>" alt="" /></span></li></ul>
	</div>
</div>
<!-- 검색조건 유지 -->
<input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form:form>
</body>
</html>

