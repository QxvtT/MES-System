<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<script src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
let ordNum = null;
$(function(){
	const grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: getList(),
	    rowHeaders: ['rowNum'],
	    columns: [
	    	{ header: '주문번호', name:'ordNum'},
			{ header: '주문일자', name:'ordRequestDate'},
			{ header: '납기일자', name:'ordDeliveryDate'},
			{ header: '업체코드', name:'operCode'},
			{ header: '업체이름', name:'operName'},
			{ header: '제품코드', name:'itmCode'},
			{ header: '주문상태', name:'ordStatus'},
			{ header: '주문량', name:'ordVol'},
			{ header: '지시량', name:'ordIndVol'},
			{ header: '출고량', name:'ordOutVol'},
			{ header: '완제품재고', name:'itmStock'},
			{ header: '비고', name:'ordNote'},
			{ header: '계획여부', name:'prdChk'}
	    ]
	}); // end const grid
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getList());
	  })
	  
	function getList() { 
		let data;
		$.ajax({
			async: false, 
			url : "OrderMList",
			type : "get",
			data : {
//  				"a_date" :"2021/04/20",
//  				"b_date" :"2021/08/20",
 				itmCode : "",
// 				"operCode":""
				ordNum : ordNum
				},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					prdComDNum = result[result.length -1].prdComDNum;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
})

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
						<li class="breadcrumb-item"><a href="index.jsp"> <i
								class="fa fa-home"></i>
						</a></li>
						<li class="breadcrumb-item"><a href="#!">주문관리</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- Page-header end -->

	<form:form commandName="searchVO" name="listForm" id="listForm" method="post">
		<input type="hidden" name="ordNum" />
		<div class="pcoded-inner-content">
			<div class="main-body">
				<div class="page-wrapper">
					<div class="row">
						<div class="col-xl-12">
							<div class="card">
								<!-- 타이틀 -->
								<div id="title" class="card-header">
									<ul>
										<li>List</li>
									</ul>
								</div>
								
								<!-- // 타이틀 -->
								<!-- List -->
								<div id="grid"></div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>
