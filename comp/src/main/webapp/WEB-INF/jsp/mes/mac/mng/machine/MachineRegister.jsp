<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : MachineRegister.jsp
  * @Description : Machine Register 화면
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

<c:set var="registerFlag" value="${empty machineVO.macCode ? '등록' : '수정'}"/>

<title> <c:out value="${registerFlag}"/> </title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>

<!--For Commons Validator Client Side-->
<!-- script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script -->
<!-- validator:javascript formName="machineVO" staticJavascript="false" xhtml="true" cdata="false"/ -->

<script type="text/javaScript" language="javascript" defer="defer">
<!--
/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/machine/MachineList.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 삭제 function */
function fn_egov_delete() {
   	document.getElementById("detailForm").action = "<c:url value='/machine/deleteMachine.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 등록 function */
function fn_egov_save() {	
	frm = document.getElementById("detailForm");

	/* TODO Validation기능 보완 */
	
  	frm.action = "<c:url value="${registerFlag == '등록' ? '/machine/addMachine.do' : '/machine/updateMachine.do'}"/>";
    frm.submit();

}

// -->
</script>
</head>
<body>

<form:form commandName="machineVO" name="detailForm" id="detailForm" >
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
			<th>MAC_CODE *</th>
			<td>
				<form:input path="macCode" cssClass="essentiality" readonly="true" />
			</td>			
		</tr>	
		</c:if>
		<c:if test="${registerFlag == '등록'}">
	   <tr>
			<th>MAC_CODE *</th>
			<td>
				<form:input path="macCode" cssClass="txt" readonly="false" />
			</td>			
		</tr>	
		</c:if>		
		<tr>
			<th>MAC_NAME</th>
			<td>
				<form:input path="macName" cssClass="txt"/>
				&nbsp;<form:errors path="macName" />
			</td>
		</tr>	
		<tr>
			<th>MAC_DIV</th>
			<td>
				<form:input path="macDiv" cssClass="txt"/>
				&nbsp;<form:errors path="macDiv" />
			</td>
		</tr>	
		<tr>
			<th>MAC_SIZE</th>
			<td>
				<form:input path="macSize" cssClass="txt"/>
				&nbsp;<form:errors path="macSize" />
			</td>
		</tr>	
		<tr>
			<th>MODEL</th>
			<td>
				<form:input path="model" cssClass="txt"/>
				&nbsp;<form:errors path="model" />
			</td>
		</tr>	
		<tr>
			<th>PRO_OPER</th>
			<td>
				<form:input path="proOper" cssClass="txt"/>
				&nbsp;<form:errors path="proOper" />
			</td>
		</tr>	
		<tr>
			<th>WORKER</th>
			<td>
				<form:input path="worker" cssClass="txt"/>
				&nbsp;<form:errors path="worker" />
			</td>
		</tr>	
		<tr>
			<th>USE</th>
			<td>
				<form:input path="use" cssClass="txt"/>
				&nbsp;<form:errors path="use" />
			</td>
		</tr>	
		<tr>
			<th>NOM_CAP</th>
			<td>
				<form:input path="nomCap" cssClass="txt"/>
				&nbsp;<form:errors path="nomCap" />
			</td>
		</tr>	
		<tr>
			<th>USING_ENERGY</th>
			<td>
				<form:input path="usingEnergy" cssClass="txt"/>
				&nbsp;<form:errors path="usingEnergy" />
			</td>
		</tr>	
		<tr>
			<th>SAFETY</th>
			<td>
				<form:input path="safety" cssClass="txt"/>
				&nbsp;<form:errors path="safety" />
			</td>
		</tr>	
		<tr>
			<th>MAC_PRO_DATE</th>
			<td>
				<form:input path="macProDate" cssClass="txt"/>
				&nbsp;<form:errors path="macProDate" />
			</td>
		</tr>	
		<tr>
			<th>BUY_DATE</th>
			<td>
				<form:input path="buyDate" cssClass="txt"/>
				&nbsp;<form:errors path="buyDate" />
			</td>
		</tr>	
		<tr>
			<th>BUY_PRICE</th>
			<td>
				<form:input path="buyPrice" cssClass="txt"/>
				&nbsp;<form:errors path="buyPrice" />
			</td>
		</tr>	
		<tr>
			<th>LINE_NUM</th>
			<td>
				<form:input path="lineNum" cssClass="txt"/>
				&nbsp;<form:errors path="lineNum" />
			</td>
		</tr>	
		<tr>
			<th>MAC_LOADAGE</th>
			<td>
				<form:input path="macLoadage" cssClass="txt"/>
				&nbsp;<form:errors path="macLoadage" />
			</td>
		</tr>	
		<tr>
			<th>MAC_STD_TEMP</th>
			<td>
				<form:input path="macStdTemp" cssClass="txt"/>
				&nbsp;<form:errors path="macStdTemp" />
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

