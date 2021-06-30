<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : OrderMRegister.jsp
  * @Description : OrderM Register 화면
  * @Modification Information
  * 
  * @author seongwon
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

<c:set var="registerFlag" value="${empty orderMVO.ordNum ? '등록' : '수정'}"/>

<title> <c:out value="${registerFlag}"/> </title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>

<!--For Commons Validator Client Side-->
<!-- script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script -->
<!-- validator:javascript formName="orderMVO" staticJavascript="false" xhtml="true" cdata="false"/ -->

<script type="text/javaScript" language="javascript" defer="defer">

/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/OrderMList.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 삭제 function */
function fn_egov_delete() {
   	document.getElementById("detailForm").action = "<c:url value='/deleteOrderM.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 등록 function */
function fn_egov_save() {	
	frm = document.getElementById("detailForm");

	/* TODO Validation기능 보완 */
	
  	frm.action = "<c:url value="${registerFlag == '등록' ? '/addOrderM.do' : '/updateOrderM.do'}"/>";
    frm.submit();

}


</script>
</head>
<body>

<form:form commandName="orderMVO" name="detailForm" id="detailForm" >
<div id="content_pop">
	<!-- 타이틀 -->
	<div id="title">
		<ul>
			<li><img src="<c:url value='/images//title_dot.gif'/>" alt="" /><c:out value="${registerFlag}"/></li>
		</ul>
	</div>
	<!-- // 타이틀 -->
	<form id="frm" name = "frm">
		<div id="table">
		<table width="100%" border="1" cellpadding="0" cellspacing="0" >
			<colgroup>
				<col width="150"/>
				<col width=""/>
			</colgroup>
			<c:if test="${registerFlag == '수정'}">
		  		 <tr>
					<th>ORD_NUM *</th>
					<td>
						<form:input path="ordNum" cssClass="essentiality" readonly="true" />
					</td>			
				</tr>	
			</c:if>
			<tr>
				<th>납기일</th>
				<td>
					<input type="date" name ="ordDeliveryDate" id = "ordDeliveryDate" ></input>
				</td>
			</tr>	
			<tr>
				<th>OPER_CODE</th>
				<td>
					<input type="text" name ="operCode" id = "operCode" ></input>
				</td>
			</tr>	
			<tr>
				<th>OPER_NAME</th>
				<td>
					<input type="text" name ="operName" id = "operName" ></input>
				</td>
			</tr>	
			<tr>
				<th>itm_code</th>
				<td>
					<input type="text" name ="itmCode" id = "itmCode" ></input>
				</td>
			</tr>
			<tr>
				<th>ord_vol</th>
				<td>
					<input type="text" name ="ordVol" id = "ordVol" ></input>
				</td>
			</tr>
			<tr>
				<th>ord_note</th>
				<td>
					<input type="text" name ="ordNote" id = "ordNote" ></input>
				</td>
			</tr>
			
		</table>
	  </div>
  </form>
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

