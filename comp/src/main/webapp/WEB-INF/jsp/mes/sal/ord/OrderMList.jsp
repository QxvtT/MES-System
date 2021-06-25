<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : OrderMList.jsp
  * @Description : OrderM List 화면
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
<title>목록</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
<script type="text/javaScript" language="javascript" defer="defer">

/* 글 수정 화면 function */
function fn_egov_select(ordNum) {
	document.getElementById("listForm").ordNum.value = ordNum;
   	document.getElementById("listForm").action = "<c:url value='/orderM/updateOrderMView.do'/>";
   	document.getElementById("listForm").submit();
}

/* 글 등록 화면 function */
function fn_egov_addView() {
   	document.getElementById("listForm").action = "<c:url value='/orderM/addOrderMView.do'/>";
   	document.getElementById("listForm").submit();		
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/OrderMList.do'/>";
   	document.getElementById("listForm").submit();
}

 // -->
</script>
</head>
<body>

<!-- Page-header start -->
                        <div class="page-header">
                            <div class="page-block">
                                <div class="row align-items-center">
                                    <div class="col-md-8">
                                        <div class="page-header-title">
                                            <h5 class="m-b-10">주문관리</h5>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <ul class="breadcrumb">
                                            <li class="breadcrumb-item">
                                                <a href="index.jsp"> <i class="fa fa-home"></i> </a>
                                            </li>
                                            <li class="breadcrumb-item"><a href="#!">주문관리</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Page-header end -->
                        <form:form commandName="searchVO" name="listForm" id="listForm" method="post">
	<input type="hidden" name="ordNum" />
<div id="content_pop">

	<!-- List -->
	<div id="table">
	
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
									<div class="card">
                                            <div class="card-header">
                                                <h5>Basic Table</h5>
                                                <span>use class <code>table</code> inside table element</span>
                                                <div class="card-header-right">
                                                    <ul class="list-unstyled card-option">
                                                        <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                        <li><i class="fa fa-window-maximize full-card"></i></li>
                                                        <li><i class="fa fa-minus minimize-card"></i></li>
                                                        <li><i class="fa fa-refresh reload-card"></i></li>
                                                        <li><i class="fa fa-trash close-card"></i></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                              	 <th align="center">OrdNum</th>
																<th align="center">OrdRequestDate</th>
																<th align="center">OrdDeliveryDate</th>
																<th align="center">OperCode</th>
																<th align="center">OperName</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                           <c:forEach var="result" items="${resultList}" varStatus="status">
																<tr>
																	<td align="center" class="listtd"><a href="javascript:fn_egov_select('<c:out value="${result.ordNum}"/>')"><c:out value="${result.ordNum}"/></a>&nbsp;</td>
																	<td align="center" class="listtd"><c:out value="${result.ordRequestDate}"/>&nbsp;</td>
																	<td align="center" class="listtd"><c:out value="${result.ordDeliveryDate}"/>&nbsp;</td>
																	<td align="center" class="listtd"><c:out value="${result.operCode}"/>&nbsp;</td>
																	<td align="center" class="listtd"><c:out value="${result.operName}"/>&nbsp;</td>
												    			</tr>
															</c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                
                                            </div>
                                        </div>
                                        
</body>
</html>
