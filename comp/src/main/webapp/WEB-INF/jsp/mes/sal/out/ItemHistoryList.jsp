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
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<script
	src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
let itmHisDNum = null;
let aDate = null;
let bDate = null;
let operName = null;
let itmCode = null;
$(function(){
	const grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: null,
	    rowHeaders: ['rowNum'],
	    columns: [
	    	{ header: '출고일자', name:'itmHisRdy'},
	    	{ header: '업체명', name:'operName'},
	    	{ header: '자재LOT_NO', name:'lotNum'},
			{ header: '제품코드', name:'itmCode'},
			{ header: '제품명', name:'itmName'},
			{ header: '주문번호', name:'ordNum'},
			{ header: '수량', name:'itmVol'},
			{ header: '단가', name:'itmPrice'},
			{ header: '금액', name:'totalPrice'},
			{ header: '비고', name:'itmNoteD'}
	    ]
	}); // end const grid
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getList());
	  })
	function getList() { 
		let data;
		$.ajax({
			async: false, 
			url : "ItemHistoryList",
			type : "get",
			data : {
  				aDate : aDate,
  				bDate : bDate,
  				operName : operName,
  				itmCode : itmCode,
  				itmHisDNum : itmHisDNum
				},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					itmHisDNum = result[result.length -1].itmHisDNum;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
 	button.onclick = function(){
 		itmHisDNum = null;
 		aDate = $( 'input#aDate' ).val();
 		bDate = $( 'input#bDate' ).val();
 		operName = $( 'input#operName' ).val();
 		itmCode = $( 'input#itmCode' ).val();
 		grid.resetData(getList());
 		console.log(bDate);
 		console.log(aDate);
 		console.log(itmHisDNum);
 	}
	$('#mobile-collapse').click(function() {
	      grid.refreshLayout();
	   });
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
						<h5 class="m-b-10">출고조회</h5>
					</div>
				</div>
				<div class="col-md-4">
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.jsp"> <i
								class="fa fa-home"></i>
						</a></li>
						<li class="breadcrumb-item"><a href="#!">출고조회</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- Page-header end -->
	
	<form id="frm" name ="frm">
		날짜<input type="date" id="bDate" name = "bDate"/> ~ <input type="date" id="aDate" name = "aDate"/> <br>
		업체명 <input type="text" id="operName" name = "operName"/><br>
		제품코드 <input type="text" id="itmCode" name = "itmCode"/><br>
		
		<button type="button" class="btn btn-info btn-sm" id="button">검색</button>
	</form>
	<form:form commandName="searchVO" name="listForm" id="listForm"
		method="post">
		<input type="hidden" name="itmHisDNum" />
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


