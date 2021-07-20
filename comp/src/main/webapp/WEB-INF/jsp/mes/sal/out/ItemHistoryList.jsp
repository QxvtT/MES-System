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
let operCode = null;
$(function(){
	const grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: null,
	    rowHeaders: ['rowNum'],
	    bodyHeight:450,
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
  				operCode : operCode,
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
	getItemHistory.onclick = function(){
 		itmHisDNum = null;
 		aDate = $( 'input#aDate' ).val();
 		bDate = $( 'input#bDate' ).val();
 		operCode = $( 'input#operCode' ).val();
 		itmCode = $( 'input#itmCode' ).val();
 		grid.resetData(getList());
 		console.log(bDate);
 		console.log(aDate);
 		console.log(itmHisDNum);
 	}
	$('#mobile-collapse').click(function() {
	      grid.refreshLayout();
	   });
	reset.onclick = function() {
		let list=[];
		grid.resetData(list);
	}
	
	
	$('#printItmHistoryBtn').click(function() {	
		$("#grid").print({
        	globalStyles: true,
        	mediaPrint: false,
        	stylesheet: null,
        	noPrintSelector: ".no-print",
        	iframe: true,
        	append: null,
        	prepend: null,
        	manuallyCopyFormValues: true,
        	deferred: $.Deferred(),
        	timeout: 750,
        	title: null,
        	doctype: '<!doctype html>'
		});
	})
	function info_print() {
	var initBody = document.body.innerHTML;
	window.onbeforeprint = function () {
		document.body.innerHTML = document.getElementById("grid").innerHTML;
	}
	window.onafterprint = function () {
		document.body.innerHTML = initBody;
	}
	window.print();
}
	
	$('#excelItemHistoryBtn').click(function() {
	ReportToExcelConverter();
})
function ReportToExcelConverter() { 
	$("#grid").table2excel({ 
		exclude: ".noExl", 
		name: "Excel Document Name", 
		filename: "ItemHistory" +'.xls', //확장자를 여기서 붙여줘야한다. fileext: ".xls", exclude_img: true, exclude_links: true, exclude_inputs: true 
		}); 
	};
	
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
		업체코드 <input type="text" id="operCode" name = "operCode"/>
		<%@ include file="/WEB-INF/jsp/mes/common/modal/OperationList.jsp" %>
		&nbsp;
		업체명<input type ="text" id="operName" name = "operName" readonly="readonly"/>
		<br/>
		제품코드 <input type="text" id="itmCode" name = "itmCode"/>
		<%@ include file="/WEB-INF/jsp/mes/common/modal/ItemList.jsp" %>
		&nbsp;
		제품명<input type="text" id="itmName" name = "itmName"/>
		<br/>
		<button type="button" class="btn btn-info btn-sm" id="getItemHistory">검색</button>
		<button type="reset" class="btn btn-info btn-sm" id="reset">리셋</button>
	</form>
	
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
									<div align="right">
										<ul>
											<button class="btn btn-info btn-sm" type="button" id ="printItmHistoryBtn" name = "printItmHistoryBtn" >인쇄</button>
											&nbsp;
											<button class="btn btn-info btn-sm" type="button" id ="excelItemHistoryBtn" name = "excelItemHistoryBtn" >Excel</button>
										</ul>
									</div>
								</div>
								<div id="grid"></div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>



	
</body>
</html>


