<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator"
	uri="http://www.springmodules.org/tags/commons-validator"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	/**
* @Class Name : ProducePlanDRegister.jsp
* @Description : ProducePlanD Register 화면
* @Modification Information
* 
* @author Jeoung
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
<!--필수, FileSaver savaAs 이용 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
let prdDate = null;
let itemCodes = null;
let operCodes = null;
$(function(){
	const grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 500,
	    rowWidth: 100,
	    data: null,
	    columns: [
	    	{ header: '계획일자', name:'prdDate', align:'center'},
	    	{ header: '고객사명', name:'operName', align:'center'},
	    	{ header: '제품코드', name:'itmCode', align:'center'},
			{ header: '제품명', name:'itmName', align:'center'},
			{ header: '주문번호', name:'ordNum', align:'center'},
			{ header: '납기일자', name:'ordDeliveryDate', align:'center'},
			{ header: '주문량', name:'ordVol'},
			{ header: '계획량', name:'prdWorkVol'},
			{ header: '작업일자', name:'prdPlanDate', align:'center'},
			{ header: '순서', name:'prdNo', align:'center'}
	    ],
	    summary: {
	        position: 'bottom',
	        height: 50,
	        columnContent: {
	        	prdDate: {
	        		template: function(valueMap) {
	        			return `합계`;
	        			},
	        		align:'center'
				},
				ordVol: {
					template: function(valueMap) {
						return valueMap.sum;
						}
				},
				prdWorkVol: {
					template: function(valueMap) {
						return valueMap.sum;
						}
				}
	        }// end of columnContent
	    }// end of summary
	}); // end const grid
	
	grid.on('scrollEnd', () => {
	  })
	  
	// toast datePicker 관련 Script
	function setDatePicker(){
		var today = new Date();
		var preDay = new Date();
		preDay.setDate(today.getDate() - 7);
		
		var picker = tui.DatePicker.createRangePicker({
	        startpicker: {
	            date: preDay,
	            input: '#startDate',
	            container: '#startDate-container'
	        },
	        endpicker: {
	            date: today,
	            input: '#endDate',
	            container: '#endDate-container'
	        },
	        language: 'ko',
	        type: 'date',
	        format: 'yyyy-MM-dd'
	    });
	}
	setDatePicker();
	// 생산계획조회 날짜조건
	function getPrdComList() {
		let data;
		$.ajax({
			async: false,
			url : "ProducePlanList",
			type : "get",
			data : {
				startDate : startDate,
				endDate : endDate,
				itemCodes : itemCodes,
				operCodes : operCodes
				},
			dataType: "json",
			success : function(result){
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}

	
	$('#mobile-collapse').click(function() {
		grid.refreshLayout();
	});
	
	
	// 생산계획조회 그리드 생성
	$('#searchBtn').click(function() {
		startDate = $('#startDate').val();
		endDate = $('#endDate').val();
		itemCodes = $('#itmCode').val();
		operCodes = $('#operCode').val();
		grid.resetData(getPrdComList());
	})
	
	// 새자료 버튼
	$('#resetBtn').click(function() {
		setDatePicker();
		detailForm.reset();
		grid.resetData([]);
	}) 
	
	function s2ab(s) { 
	    var buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
	    var view = new Uint8Array(buf);  //create uint8array as viewer
	    for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
	    return buf;    
	}
	function exportExcel(){ 
	    // step 1. workbook 생성
	    var wb = XLSX.utils.book_new();

	    // step 2. 시트 만들기 
	    var newWorksheet = excelHandler.getWorksheet();
	    
	    // step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.  
	    XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler.getSheetName());

	    // step 4. 엑셀 파일 만들기 
	    var wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});

	    // step 5. 엑셀 파일 내보내기 
	    saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), excelHandler.getExcelFileName());
	}
	
	var excelHandler = {
	        getExcelFileName : function(){
	            return 'json-test.xlsx';
	        },
	        getSheetName : function(){
	            return 'Json Test Sheet';
	        },
	        getExcelData : function() {
	        	return getPrdComList();
	        },
	        getWorksheet : function(){
	            return XLSX.utils.json_to_sheet(this.getExcelData());
	        }
	};
	
	$('#excelBtn').click(function() {
		exportExcel()
	})
	
	$('#printBtn').click(function() {
		$(document.body).printThis();
	})
	
})

</script>
</head>
<body>
		<!-- 생산계획조회 Title -->
		<div class="page-header">
			<div class="page-block">
				<div class="row align-items-center">
					<div class="col-md-8">
						<div class="page-header-title">
							<h5 class="m-b-10">생산계획조회</h5>
						</div>
					</div>
					<div class="col-md-4">
						<ul class="breadcrumb">
							<li class="breadcrumb-item"><a href="/comp"> <i
									class="fa fa-home"></i>
							</a></li>
							<li class="breadcrumb-item">생산관리</li>
							<li class="breadcrumb-item">생산계획조회</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- 생산계획조회 Title End -->

		<div class="pcoded-inner-content">
			<div class="main-body">
				<div class="page-wrapper">
					<div class="text-right">
						<button type="button" class="btn btn-primary" id="searchBtn">조회</button>
						<button type="button" class="btn btn-primary" id="resetBtn">새자료</button>
						<button type="button" class="btn btn-primary" id="excelBtn">Excel</button>
						<button type="button" class="btn btn-primary" id="printBtn">인쇄</button>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-12">
						<form:form commandName="produceCommandDVO" name="detailForm"
							id="detailForm">
							<input type="hidden" id="prdComNum" name="prdComNum" />
							<div class="">
								<div class="" style="z-index: 200">
									<div class="table">
										<table class="table">
											<tr>
												<td>
													<div class="d-inline-block align-middle">계획일자</div>
												</td>
												<td>
													<div class="row">
														<div
															class="tui-datepicker-input tui-datetime-input tui-has-focus">
															<input class="form-control" id="startDate"
																name="startDate" type="text" aria-label="Date" /> <span
																class="tui-ico-date"></span>
															<div id="startDate-container" style="margin-left: -1px;"></div>
														</div>
														<span style="margin: 10px;"> ~ </span>
														<div
															class="tui-datepicker-input tui-datetime-input tui-has-focus">
															<input class="form-control" id="endDate" name="endDate"
																type="text" aria-label="Date" /> <span
																class="tui-ico-date"></span>
															<div id="endDate-container" style="margin-left: -1px;"></div>
														</div>
													</div>
												</td>

											</tr>
											<tr>
												<td><label class="col-form-label text-center">고객사</label>
												</td>
												<td>
													<div class="row">
														<input type="text" class="form-control w-25 ml-3" id="operCode" name="operCode" value="${result.operCode }"></input>
														<input type="text" class="form-control w-25 ml-3" id="operName" name="operName" value="${result.operName }" readonly></input>
														<%@include file="/WEB-INF/jsp/mes/common/modal/OperationList.jsp" %>										
													</div>
												</td>
											</tr>
											<tr>
												<td><label class="col-form-label text-center">제품코드</label>
												</td>
												<td>
													<div class="row">
														<input type="text" class="form-control w-25 ml-3" id="itmCode" name="itmCode" value="${result.itmCode }"></input>
														<input type="text" class="form-control w-25 ml-3" id="itmName" name="itmName" value="${result.itmName }" readonly></input>
														<%@include file="/WEB-INF/jsp/mes/common/modal/ItemList.jsp" %>
													</div>
												</td>
											</tr>
										</table>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-12">
									<div id="grid"></div>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>

