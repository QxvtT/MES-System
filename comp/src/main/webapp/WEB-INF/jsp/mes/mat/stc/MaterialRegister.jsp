<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : MaterialRegister.jsp
  * @Description : Material Register 화면
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

<c:set var="registerFlag" value="${empty materialVO.matCode ? '등록' : '수정'}"/>

<title> <c:out value="${registerFlag}"/> </title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>

<!--For Commons Validator Client Side-->
<!-- script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script -->
<!-- validator:javascript formName="materialVO" staticJavascript="false" xhtml="true" cdata="false"/ -->

<script type="text/javaScript" language="javascript" defer="defer">
<!--
/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/material/MaterialList.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 삭제 function */
function fn_egov_delete() {
   	document.getElementById("detailForm").action = "<c:url value='/material/deleteMaterial.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 등록 function */
function fn_egov_save() {	
	frm = document.getElementById("detailForm");

	/* TODO Validation기능 보완 */
	
  	frm.action = "<c:url value="${registerFlag == '등록' ? '/material/addMaterial.do' : '/material/updateMaterial.do'}"/>";
    frm.submit();

}

// -->
</script>
</head>
<body>

<form:form commandName="materialVO" name="detailForm" id="detailForm" >
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
			<th>mat_code *</th>
			<td>
				<form:input path="matCode" cssClass="essentiality" readonly="true" />
			</td>			
		</tr>	
		</c:if>
		<c:if test="${registerFlag == '등록'}">
	   <tr>
			<th>mat_code *</th>
			<td>
				<form:input path="matCode" cssClass="txt" readonly="false" />
			</td>			
		</tr>	
		</c:if>		
		<tr>
			<th>oper_code</th>
			<td>
				<form:input path="operCode" cssClass="txt"/>
				&nbsp;<form:errors path="operCode" />
			</td>
		</tr>	
		<tr>
			<th>mat_name</th>
			<td>
				<form:input path="matName" cssClass="txt"/>
				&nbsp;<form:errors path="matName" />
			</td>
		</tr>	
		<tr>
			<th>mat_barcode</th>
			<td>
				<form:input path="matBarcode" cssClass="txt"/>
				&nbsp;<form:errors path="matBarcode" />
			</td>
		</tr>	
		<tr>
			<th>mat_size</th>
			<td>
				<form:input path="matSize" cssClass="txt"/>
				&nbsp;<form:errors path="matSize" />
			</td>
		</tr>	
		<tr>
			<th>mat_unit</th>
			<td>
				<form:input path="matUnit" cssClass="txt"/>
				&nbsp;<form:errors path="matUnit" />
			</td>
		</tr>	
		<tr>
			<th>emp_id</th>
			<td>
				<form:input path="empId" cssClass="txt"/>
				&nbsp;<form:errors path="empId" />
			</td>
		</tr>	
		<tr>
			<th>mat_grp</th>
			<td>
				<form:input path="matGrp" cssClass="txt"/>
				&nbsp;<form:errors path="matGrp" />
			</td>
		</tr>	
		<tr>
			<th>mat_div</th>
			<td>
				<form:input path="matDiv" cssClass="txt"/>
				&nbsp;<form:errors path="matDiv" />
			</td>
		</tr>	
		<tr>
			<th>mat_kind_div</th>
			<td>
				<form:input path="matKindDiv" cssClass="txt"/>
				&nbsp;<form:errors path="matKindDiv" />
			</td>
		</tr>	
		<tr>
			<th>mat_using</th>
			<td>
				<form:input path="matUsing" cssClass="txt"/>
				&nbsp;<form:errors path="matUsing" />
			</td>
		</tr>	
		<tr>
			<th>mat_testing</th>
			<td>
				<form:input path="matTesting" cssClass="txt"/>
				&nbsp;<form:errors path="matTesting" />
			</td>
		</tr>	
		<tr>
			<th>cylinder</th>
			<td>
				<form:input path="cylinder" cssClass="txt"/>
				&nbsp;<form:errors path="cylinder" />
			</td>
		</tr>	
		<tr>
			<th>mat_lot_div</th>
			<td>
				<form:input path="matLotDiv" cssClass="txt"/>
				&nbsp;<form:errors path="matLotDiv" />
			</td>
		</tr>	
		<tr>
			<th>mat_safe_stock_mag</th>
			<td>
				<form:input path="matSafeStockMag" cssClass="txt"/>
				&nbsp;<form:errors path="matSafeStockMag" />
			</td>
		</tr>	
		<tr>
			<th>mat_safe_stock</th>
			<td>
				<form:input path="matSafeStock" cssClass="txt"/>
				&nbsp;<form:errors path="matSafeStock" />
			</td>
		</tr>	
		<tr>
			<th>mat_safe_date</th>
			<td>
				<form:input path="matSafeDate" cssClass="txt"/>
				&nbsp;<form:errors path="matSafeDate" />
			</td>
		</tr>	
		<tr>
			<th>mat_prd_date</th>
			<td>
				<form:input path="matPrdDate" cssClass="txt"/>
				&nbsp;<form:errors path="matPrdDate" />
			</td>
		</tr>	
		<tr>
			<th>mat_1m_usage</th>
			<td>
				<form:input path="mat1mUsage" cssClass="txt"/>
				&nbsp;<form:errors path="mat1mUsage" />
			</td>
		</tr>	
		<tr>
			<th>mat_6m_usage</th>
			<td>
				<form:input path="mat6mUsage" cssClass="txt"/>
				&nbsp;<form:errors path="mat6mUsage" />
			</td>
		</tr>	
		<tr>
			<th>mat_min_stock</th>
			<td>
				<form:input path="matMinStock" cssClass="txt"/>
				&nbsp;<form:errors path="matMinStock" />
			</td>
		</tr>	
		<tr>
			<th>mat_max_stcok</th>
			<td>
				<form:input path="matMaxStcok" cssClass="txt"/>
				&nbsp;<form:errors path="matMaxStcok" />
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

