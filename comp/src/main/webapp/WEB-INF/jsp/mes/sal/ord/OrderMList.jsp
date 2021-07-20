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
let ordDNum = null;
let aDate = null;
let bDate = null;
let date = null;
let itmCode = null;
let operCode = null;
let ordStatus = null;

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
	    	{ header: '주문번호', name:'ordNum'},
			{ header: '주문일자', name:'ordRequestDate'},
			{ header: '납기일자', name:'ordDeliveryDate'},
			{ header: '업체코드', name:'operCode'},
			{ header: '업체이름', name:'operName'},
			{ header: '제품코드', name:'itmCode'},
			{ header: '제품이름', name:'itmName'},
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
  				aDate : aDate,
  				bDate : bDate,
  				date : date,
 				itmCode : itmCode,
 				operCode: operCode,
 				ordStatus: ordStatus,
				ordDNum : ordDNum
				},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					ordDNum = result[result.length -1].ordDNum;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
		button.onclick = function(){
		ordDNum = null;
		itmCode = $( 'input#itmCode' ).val();
		aDate = $( 'input#aDate' ).val();
		bDate = $( 'input#bDate' ).val();
		operCode = $( 'input#operCode' ).val();
		date = $("input[name='date']:checked").val();
		ordStatus = $("input[name='ordStatus']:checked").val();
		console.log(ordStatus);
		grid.resetData(getList());
		console.log(ordDNum);
		
	}
		$('#printOrderBtn').click(function() {	
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
		
		$('#excelOrderBtn').click(function() {
		ReportToExcelConverter();
	})
	function ReportToExcelConverter() { 
		$("#grid").table2excel({ 
			exclude: ".noExl", 
			name: "Excel Document Name", 
			filename: "OrderList" +'.xls', //확장자를 여기서 붙여줘야한다. fileext: ".xls", exclude_img: true, exclude_links: true, exclude_inputs: true 
			}); 
		};
		
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
						<h5 class="m-b-10">주문관리</h5>
					</div>
				</div>
				<div class="col-md-4">
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.jsp"> <i
								class="fa fa-home"></i>
						</a></li>
						<li class="breadcrumb-item"><a href="#!">주문조회</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- Page-header end -->
	
	<form id="frm" name = "frm">
		<div>
		진행<input type = "radio" id="ordStatus" name="ordStatus" value="진행" checked="checked"/>
		완료<input type = "radio" id="ordStatus" name="ordStatus" value="완료"/>
		전체<input type = "radio" id="ordStatus" name="ordStatus" value=""/>
		</div>
		<div>
		주문일자<input type = "radio" id="date" name="date" value="request" checked="checked"/>
		납기일자<input type = "radio" id="date" name="date" value="delivery"/>
		</div>
		날짜<input type ="date" id="bDate" name = "bDate" />~<input type ="date" id="aDate" name = "aDate" />
		<br>업체코드<input type ="text" id="operCode" name = "operCode" />
		<%@ include file="/WEB-INF/jsp/mes/common/modal/OperationList.jsp" %>&nbsp;
		업체이름<input type ="text" id="operName" name = "operName" readonly="readonly"/><br/>
		제품코드<input type ="text" id="itmCode" name = "itmCode" ></input>
		<%@ include file="/WEB-INF/jsp/mes/common/modal/ItemList.jsp" %>&nbsp;
		제품명<input type ="text" id="itmName" name = "itmName" ></input><br/>
		<br/>
		<button  class="btn btn-info btn-sm" type="button" id ="button" name="button">조회</button>
	<button class="btn btn-info btn-sm" type="reset" >리셋</button>
	
	</form>
	<form:form commandName="searchVO" name="listForm" id="listForm" method="post">
		<input type="hidden" name="ordDNum" />
		<div class="pcoded-inner-content">
			<div class="main-body">
				<div class="page-wrapper">
					<div class="row">
						<div class="col-xl-12">
							<div class="card">
								<!-- 타이틀 -->
								<div id="title" class="card-header">
									<ul>
										<li>주문목록</li>
									</ul>
									<div align="right">
										<ul>
											<button class="btn btn-info btn-sm" type="button" id ="printOrderBtn" name = "printOrderBtn" >인쇄</button>
											&nbsp;
											<button class="btn btn-info btn-sm" type="button" id ="excelOrderBtn" name = "excelOrderBtn" >Excel</button>
										</ul>
									</div>
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

