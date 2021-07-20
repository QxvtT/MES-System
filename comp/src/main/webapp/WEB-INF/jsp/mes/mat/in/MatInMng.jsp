<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	/**
* @Class Name : MaterialStockList.jsp
* @Description : MaterialStock List 화면
* @Modification Information
* 
* @author materialStock
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
let matHisNum1 = null;
let matHisNum2 = null;
let matHisDNum = null;
let matHisDNum1 = null;
let matHisDNum2 = null;
let matHisNum = null;
let matOrdNum = null;
let matHisDateS = null;
let matHisDateE = null;
let matCode = null;
let matCode3 = null;
let matName = null;
let operCode = null;
let matOrdOper = null;
let operCodes = null;
let matHisDate = null;
let sDate = null;
let eDate = null;
let matComNum = null;
let matOrdNum1 = null;
let nsDate = null;
let neDate = null;

$(function(){
	
	let Indate = new Date();
    let picker = tui.DatePicker.createRangePicker({
        startpicker: {
            date: Indate,
            input: '#InStartpicker-input',
            container: '#InStartpicker-container'
        },
        endpicker: {
            date: Indate,
            input: '#InEndpicker-input',
            container: '#InEndpicker-container'
        },
        language: 'ko',
        type: 'date',
        format: 'yyyy-MM-dd'
  
    });
    
    let nDate = new Date();
    let npicker = tui.DatePicker.createRangePicker({
        startpicker: {
            date: nDate,
            input: '#nStartpicker-input',
            container: '#nStartpicker-container'
        },
        endpicker: {
            date: nDate,
            input: '#nEndpicker-input',
            container: '#nEndpicker-container'
        },
        language: 'ko',
        type: 'date',
        format: 'yyyy-MM-dd'
  
    });
    
    let nmDate = new Date();
    let nmpicker = tui.DatePicker.createRangePicker({
        startpicker: {
            date: nmDate,
            input: '#nordStartpicker-input',
            container: '#nordStartpicker-container'
        },
        endpicker: {
            date: nmDate,
            input: '#nordEndpicker-input',
            container: '#nordEndpicker-container'
        },
        language: 'ko',
        type: 'date',
        format: 'yyyy-MM-dd'
  
    });
    
    let MatInDate = new Date();
    var datepicker = new tui.DatePicker('#MatInpicker-container', {
    	language: 'ko',
        date: MatInDate,
        input: {
            element: '#MatInpicker-input',
            format: 'yyyy-MM-dd',
        }
    });
    
	const grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: null,
	    rowHeaders: ['rowNum', 'checkbox'],
	    columns: [
	    	{ 
	    		header: '일련번호', 
	    		name:'matHisDNum', 
	    		hidden: true
	    	},
	    	{ 
	    		header: '자재코드', 
	    		name:'matCode', 
	    		editor: "text"
	    	},
			{ 
	    		header: '자재명', 
	    		name:'matName'
	    	},
			{ 
	    		header: '규격', 
	    		name:'matSize'
	    	},
			{ 
	    		header: '단위', 
	    		name:'matUnit'
	    	},
			{ 
	    		header: '발주번호', 
	    		name:'matComNum',
	    		editor: "text"
	    	},
			{ 
	    		header: '입고량', 
	    		name:'matHisDVol',
    			editor: "text",
    			formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}
	    	},
			{ 
	    		header: '단가', 
	    		name:'matHisPrice',
    			editor: "text",
    			formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}
	    	},
			{ 
	    		header: '금액', 
	    		name:'amount',
    			editor: "text",
    			formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}
	    	},
			{ 
	    		header: 'Lot No', 
	    		name:'lotNum',
	    		editor: "text"
	    	},
			{ 
	    		header: '자재재고', 
	    		name:'matVol',
	    		formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}
	    	},
	    	{ 
	    		header: '관리번호', 
	    		name:'matHisNum',
	    		hidden: true
	    	},
	    	{ 
	    		header: '업체코드', 
	    		name:'operCode',
	    		hidden: true
	    	},
	    	{ 
	    		header: '입고업체명', 
	    		name:'matOrdOper',
	    		hidden: true
	    	},
	    	{ 
	    		header: '미입고량', 
	    		name:'matNordVol',
	    		hidden: false
	    	}
	    ],
	    summary: {
	        position: 'bottom',
	        height: 30,  // by pixel
	        columnContent: {
	          matCode: '합계',
	          matHisDVol: {
	            template(valueMap) {
	              return (valueMap.sum == 0)? 0 : String(valueMap.sum).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	            }
	          }
	        }
	    }
	}); // end const grid
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getList());
	})
	
	const grid2 = new tui.Grid({
	    el: document.getElementById('grid2'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: getMatInDayList(),
	    rowHeaders: [
	    	{type:'rowNum'}, {type:'checkbox', header: ' '}
	    ],
	    columns: [
	    	{ 
	    		header: '입고일자', 
	    		name:'matHisDate'
	    	},
			{ 
	    		header: '입고번호', 
	    		name:'matHisNum'
	    	},
			{ 
	    		header: '입고업체명', 
	    		name:'matOrdOper'
	    	},
			{ 
	    		header: '건수', 
	    		name:'matHisVol'
	    	},
	    	{ 
	    		header: '업체코드', 
	    		name:'operCode',
	    		hidden: true
	    	}
	    ]
	}); // end const grid2
	
	const grid3 = new tui.Grid({
	    el: document.getElementById('grid3'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: getNordListModal(),
	    rowHeaders: [
	    	{type:'rowNum'}
	    ],
	    columns: [
	    	{ 
	    		header: '발주일자', 
	    		name:'matOrdDate'
	    	},
	    	{ 
	    		header: '발주번호', 
	    		name:'matComNum'
	    	},
			{ 
	    		header: '발주일련', 
	    		name:'matOrdNum',
	    		hidden: true
	    	},
			{ 
	    		header: '업체명', 
	    		name:'matOrdOper'
	    	},
			{ 
	    		header: '자재코드', 
	    		name:'matCode'
	    	},
	    	{ 
	    		header: '미입고 수량', 
	    		name:'matNordVol'
	    	}
	    ]
	}); // end const grid3
	
	// 자재 코드 리스트 그리드
	const grid4 = new tui.Grid({
	    el: document.getElementById('grid4'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    rowWidth: 100,
	    data: getMaterialList(),
	    rowHeaders: ['rowNum','checkbox'],
	    columns: [
	    	{ header: '자재코드', name:'matCode'},
			{ header: '자재명', name:'matName'},
			{ header: '규격', name:'matSize'},
			{ header: '업체명', name:'matName'}
	    ]
	}); // end const grid4
	
	// 자재 입고 관리 조회
	function getList() {
		let data;
		$.ajax({
			async: false,
			url : "MatInMng",
			type : "get",
			data : {
				matHisNum: matHisNum,
				matHisDNum1: matHisDNum1
			},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					matHisDNum1 = result[result.length -1].matHisDNum;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	// 자재 미입고 자료 조회
	function getNordList() {
		let data;
		$.ajax({
			async: false,
			url : "NordList",
			type : "get",
			data : {
				matHisNum: matHisNum,
				matOrdNum: matOrdNum,
				matHisDNum1: matHisDNum1,
				matComDateS: matComDateS,
				matComDateE: matComDateE,
				operName: operName
			},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					matHisDNum1 = result[result.length -1].matHisDNum;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	// END 자재 미입고 자료 조회
	
	// 일 입고 자료 리스트 조회
	function getMatInDayList() {
		let data;
		$.ajax({
			async: false,
			url : "MatInDayList",
			type : "get",
			data : {
				matHisNum1: matHisNum1,
				sDate: sDate,
				eDate: eDate
				},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					matHisNum1 = result[result.length -1].matHisNum;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	} 
	
	// 미입고 발주 번호 리스트 모달
	function getNordListModal() {
		let data;
		$.ajax({
			async: false,
			url : "NordListModal",
			type : "get",
			data : {
				matOrdNum1: matOrdNum1,
				matComNum: matComNum,
				nsDate: nsDate,
				neDate: neDate
				},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					matOrdNum1 = result[result.length -1].matHisNum;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	} 
	
	// 자재 코드 리스트 모달
	function getMaterialList() {
		let data;
		$.ajax({
			async: false,
			url : "SelectMaterialList",
			type : "get",
			data : {
					matCode3: matCode3
					},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					matCode3 = result[result.length -1].matCode;
				}
				console.log(matCodeM);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	$('#mobile-collapse').click(function() {
	      grid.refreshLayout();
	   });
	   
	$('#matInDayBtn').click(function(){
		matHisNum1 = null;
		grid2.resetData(getMatInDayList());
		$("#myModal").modal("toggle");
		$("#myModal").on('shown.bs.modal', function () {
			grid2.refreshLayout();
		});
		
	})
	
	$(document).on('click','#matInDeleteBtn',function(){
	//선택한 그리드가 있으면 삭제
	var datas = grid.getCheckedRows();    
		if ( datas.length  > 0 ) {
			if ( confirm("선택한 입고자료를 삭제하시겠습니까?") == false ) {
				return false;
			} else fnDeleteD();
		//선택한 그리드가 없으면 알림
		} else{
		    toastr.warning( '삭제할 데이터를 선택해주세요.');
		}
	});
	
	// 자재 입고 관리 수정 및 생성
	matInSaveBtn.onclick = function(){
		let gridData = grid.getModifiedRows({});
		
		gridData["materialHistoryVO"]={
 				matHisDate : $("#MatInpicker-input").val()
				,operCode : $("#operCode").val()
				,operName : $("#operName").val()
				,matHisNum :  matHisNum
				}
		console.log(gridData);
		console.log(matHisNum);
		
		if($('#operCode').val()==""){
			alert('입고 업체를 넣어주세요.');
		} else if (){
			alert('미입고량보다 많이 입고 할 수 없습니다.');
			console.log();
			console.log();
		} else {
		/* $.ajax({
			async: false,
			url: "matHisMngUpdate",
			type : "post",
			data : JSON.stringify(gridData),
			dataType: "json",
			contentType: "application/json",
			success : function(data){
				console.log(data);
				matHisNum = data;
			}
		});
		console.log(matHisNum);
		matHisDNum1 = null; */
			alert('성공');
			console.log();
			console.log();
		}
		
	}
	
	resetBtn.onclick=function(){
		grid.clear();
	}

	// 일입고리스트 모달창 단일 체크 구현
	grid2.on('check', (e) => {
		let rows = grid2.getCheckedRowKeys();
		if(rows.length > 1) {
			for(let i in rows){
				if(e.rowKey != rows[i]){
					grid2.uncheck(rows[i]);
				}
			}
		}
	});
	
	/* 일 입고 자료 리스트 검색 모달 */
	modalY.onclick=function() {
		matHisDate = null;
		if(grid2.getCheckedRows() != null){
			matHisDNum1 = null;
			console.log("일 입고 자료 리스트 검색 모달 '예' 버튼");
			console.log(grid2.getCheckedRows()[0]);
			operCode = grid2.getCheckedRows()[0].operCode;
			operName = grid2.getCheckedRows()[0].matOrdOper;
			matHisDate = grid2.getCheckedRows()[0].matHisDate;
			matHisNum = grid2.getCheckedRows()[0].matHisNum;
			grid.resetData(getList());
			
		}
		console.log(operCode);
		console.log(matHisDate);
		console.log(operName);
		console.log(matHisNum);
		console.log('======================');
	
	grid2.resetData(getMatInDayList());
	document.getElementById("MatInpicker-input").value=matHisDate;
	document.getElementById("operCode").value=operCode;
	document.getElementById("operName").value=operName;
	document.getElementById("matHisNum").value=matHisNum;
	}
	
	grid2.on('scrollEnd', () => {
		  grid2.appendRows(getMatInDayList());
		})
	
	searchBtn.onclick = function(){
		matHisNum1 = null;
		console.log(matHisNum1)
		
		sDate = $(".modal-body").find('input[name="sDate"]').val();
		console.log(sDate)
		eDate = $(".modal-body").find('input[name="eDate"]').val();
		console.log(eDate)
		
		grid2.resetData(getMatInDayList());
	}
	
	nordSearch.onclick = function(){
		matOrdNum1 = null;
		
		nsDate = $(".modal-body").find('input[name="nsDate"]').val();
		console.log(nsDate)
		neDate = $(".modal-body").find('input[name="neDate"]').val();
		console.log(neDate)
		
		grid3.resetData(getNordListModal());
	}
	
	// 그리드 행 추가
	addRowBtn.onclick = function(){
		grid.appendRow();
	}
	
	// 그리드 행 삭제
	deleteRowBtn.onclick = function(){
		grid.removeCheckedRows(true);
	}
	
	nOrdBtn.onclick = function(){
		matHisDNum1 = null;
		matHisNum = null;
		console.log(matHisDNum1)
		grid.clear();

		matComDateS = $('input[name="matComDateS"]').val();
		console.log(matComDateS)
		matComDateE = $('input[name="matComDateE"]').val();
		console.log(matComDateE)
		operCode = $('input[name="operCode"]').val();
		console.log(operCode)
		operName = $('input[name="operName"]').val();
		console.log(operName)
		
		if($('#operCode').val()==""){
			alert('입고 업체를 넣어주세요.');
		} else{
			let nordList = getNordList();
			for(let i in nordList){
				grid.appendRow(nordList[i]);
				/* if(grid.getCheckedRows() != null){
					matHisDNum1 = null;
					console.log("미입고 자료 조회 버튼");
					matHisNum = grid2.getCheckedRows()[0].matHisNum;
					console.log(matHisNum)
				} */
			}
		}
	}
	
	// 특정 cell만 선택하기 위해 조건문에서 사용되는 함수
	function getKeyByValue(object, value) {
		return Object.keys(object).find(key => object[key] === value);
	}
	
	// 선택한 발주번호 값만 받아오기
	function selectComNumm(matComNum) {
		let data;
		$.ajax({
			async: false,
			cache: false,
			url : "SelectComNumm",
			type : "get",
			data : {
				matComNum : matComNum
				},
			dataType: "json",
			success : function(result){
				grid.setValue(rowKey, 'matComNum', result.matComNum);
				data = result;
			} // end success
		}); // end ajax
		return data;
	}
	
	// 선택한 자재코드 값만 받아오기
	function selectMatCodee(matCode) {
		
		let data;
		$.ajax({
			async: false,
			cache: false,
			url : "SelectMatCodee",
			type : "get",
			data : {
				matCode : matCode
				},
			dataType: "json",
			success : function(result){
				grid.setValue(rowKey, 'matCode', result.matCode);
				grid.setValue(rowKey, 'matName', result.matName);
				grid.setValue(rowKey, 'matSize', result.matSize);
				grid.setValue(rowKey, 'matUnit', result.matUnit);
				data = result;
			} // end success
		}); // end ajax
		console.log(matCode)
		return data;
	}
	
	// 발주번호 입력란 클릭 시 미입고 발주 번호 모달창 생성
	grid.on('click', (e) => {
		var selectComNum = grid.getFocusedCell();
		if(getKeyByValue(selectComNum, "matComNum") != null){
			$('#nordModal').modal('toggle');
			$('#nordModal').on('shown.bs.modal', function(){
				rowKey = e['rowKey'];
				grid3.refreshLayout();
			});
		}
	});
	
	// 자재코드 입력란 클릭 시 자재코드 리스트 모달창 생성
	grid.on('click', (e) => {
		var selectMatCode = grid.getFocusedCell();
		if(getKeyByValue(selectMatCode, "matCode") != null){
			$('#matModal').modal('toggle');
			$('#matModal').on('shown.bs.modal', function(){
				rowKey = e['rowKey'];
				grid4.refreshLayout();
			});
		}
	});
	
	// 미입고 발주 리스트 모달창 발주번호 클릭 시 디테일 테이블 로우 데이터 값 수정
	grid3.on('click', (e) => {
		var selectComNum = grid.getFocusedCell();
		if(getKeyByValue(selectComNum, "matComNum") != null){
			$('#nordModal').modal("hide");
			let selectComNum = grid3.getFocusedCell();
			matComNum = selectComNum.value;
			grid.blur();
			selectComNumm(matComNum);
		}
	});
	
	// 자재 코드 리스트 모달창 자재코드 클릭 시 디테일 테이블 로우 데이터 값 수정
	grid4.on('click', (e) => {
		var selectMatCodes = grid.getFocusedCell();
		if(getKeyByValue(selectMatCodes, "matCode") != null){
			$('#matModal').modal("hide");
			selectRow = grid4.getRow(e.rowKey);
			let selectMatCode = grid4.getFocusedCell();
			matCode = selectMatCode.value;
			grid.blur();
			selectMatCodee(matCode);
		}
	});
	
	// 엑셀
	function ReportToExcelConverter() { 
		$("#grid").table2excel({ 
			exclude: ".noExl", 
			name: "Excel Document Name", 
			filename: "report" +'.xls', //확장자를 여기서 붙여줘야한다. fileext: ".xls", exclude_img: true, exclude_links: true, exclude_inputs: true 
			}); 
		};

	
	$('#excelBtn').click(function() {
		ReportToExcelConverter();
	})
	
	// 프린트
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
	
	$('#printBtn').click(function() {	
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
	
})


</script>
</head>
<body>
	<form:form commandName="searchVO" name="listForm" id="listForm"
		method="post">
		<input type="hidden" name="matCode" />
		<div class="pcoded-inner-content">
			<div class="main-body">
				<div class="page-wrapper">
					<div class="row">
						<div class="col-xl-12">
							<!-- 타이틀 -->
							<div id="title">
								<h3>자재 입고 관리</h3>
								<br />
							</div>
							<!-- // 타이틀 -->
							<div>
								<div class="text-left">
									<button type="button" class="btn btn-primary btn-sm"
										id="excelBtn">Excel</button>
									<button type="button" class="btn btn-primary btn-sm"
										id="printBtn">인쇄</button>
								</div>
								<div class="text-right">
									<button id="matInDayBtn" type="button"
										class="btn btn-info btn-sm">조회</button>
									<input id="resetBtn" class="btn btn-info btn-sm" type="reset"
										value="리셋"></input>
									<button type="button" id="matInSaveBtn" name="matInSaveBtn"
										class="btn btn-info btn-sm">저장</button>
									<button type="button" id="matInDeleteBtn" name="matInDeleteBtn"
										class="btn btn-info btn-sm">삭제</button>
								</div>

							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="table">
										<table class="table">
											<tr>
												<td>
													<div class="d-inline-block align-middle">입고 일자 *</div>
												</td>
												<td>
													<div class="row align-items-center text-center col-lg-12">
														<div
															class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
															<input type="text" id="MatInpicker-input"
																class=" form-control w-25" aria-label="Date-Time"
																name="matHisDate" /> <span class="tui-ico-date"></span>
															<div id="MatInpicker-container"
																style="margin-left: -1px;"></div>
														</div>
														<div id="date1" style="margin-top: -1px;"></div>
													</div>
												</td>
											</tr>
											<tr>
												<td><label class="col-form-label text-center">입고업체
														*</label></td>
												<td>
													<div class="row align-items-center text-center col-lg-12">
														<input type="text" class="form-control w-25 ml-3"
															id="operCode" name="operCode"></input> <input type="text"
															class="form-control w-25 ml-3" id="operName"
															name="operName" readonly></input>
														<%@ include
															file="/WEB-INF/jsp/mes/common/modal/OperationList.jsp"%>
													</div>
												</td>
											</tr>
											<tr>
												<td><label class="col-form-label text-center">입고번호</label>
												</td>
												<td>
													<div class="row align-items-center text-center col-lg-12">
														<input type="text" readonly name="matHisNum"
															id="matHisNum" class=" form-control w-25 ml-3" />
													</div>
												</td>
											</tr>
										</table>
									</div>
								</div>
								<div class="col-md-6">
									<div class="card">
										<div class="card-body">
											<h5 class="d-inline-block pt-3">미입고 자료</h5>
											<div class="row mt-3 mb-3 pb-3 pt-3">
												<div class="d-inline-block align-middle ml-3">일자 *</div>
												<div
													class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
													<input type="text" id="nStartpicker-input"
														class=" form-control w-25" aria-label="Date-Time"
														name="matComDateS" /> <span class="tui-ico-date"></span>
													<div id="nStartpicker-container" style="margin-left: -1px;"></div>
												</div>
												<div id="date4" style="margin-top: -1px;"></div>
												<div
													class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
													<input type="text" id="nEndpicker-input"
														class=" form-control w-25" aria-label="Date-Time"
														name="matComDateE" /> <span class="tui-ico-date"></span>
													<div id="nEndpicker-container" style="margin-left: -1px;"></div>
												</div>
												<div id="date5" style="margin-top: -1px;"></div>
												<input type="button" id="nOrdBtn" name="nOrdBtn"
													class="btn btn-info btn-sm" value="미입고 자료 조회" />

											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-12 text-right">
									<button type="button" class="btn btn-primary btn-sm"
										id="addRowBtn">추가</button>
									<button type="button" class="btn btn-primary btn-sm"
										id="deleteRowBtn">삭제</button>
								</div>
							</div>
							<div class="row">
								<div class="col-xl-12">
									<div id="grid" />
								</div>
							</div>


						</div>
					</div>
				</div>
			</div>
		</div>
	</form:form>

	<!-- 자재 코드 리스트 -->
	<div class="modal fade" id="matModal" tabindex="-1" role="dialog"
		aria-labelledby="matModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="matModalLabel" align="center">자재검색</h3>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						&times;
					</button>
				</div>
				<div style="padding: 10px 10px 10px 10px">
					<h4>자재코드</h4>
					<input type="text" id="matCodeM" name="matCode"></input><br><br>
							<button type="button" id="buttonMat" class="btn" name="button">조회</button>
							&nbsp;
							<button type="reset" class="btn">리셋</button>
				</div>
				<div class="form-group row"></div>
				<div id="grid4"></div>
				<div class="modal-footer">
					<button class="btn" type="reset" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 미입고 발주 리스트 모달 -->
	<div class="modal fade" id="nordModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="nordModalLabel">미입고 발주 조회</h3>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						&times;
					</button>
				</div>
				<div class="modal-body">
					<div>
						<div class="d-inline-block align-middle">발주 일자 *</div>
						<div
							class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
							<input type="text" id="nordStartpicker-input"
								class=" form-control w-25" aria-label="Date-Time" name="nsDate" />
							<span class="tui-ico-date"></span>
							<div id="nordStartpicker-container" style="margin-left: -1px;"></div>
						</div>
						<div id="date2" style="margin-top: -1px;"></div>
						<div
							class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
							<input type="text" id="nordEndpicker-input"
								class=" form-control w-25" aria-label="Date-Time" name="neDate" />
							<span class="tui-ico-date"></span>
							<div id="nordEndpicker-container" style="margin-left: -1px;"></div>
						</div>
						<div id="date3" style="margin-top: -1px;"></div>
						<div>
							<input type="button" id="nordSearch" name="nordSearch" value="검색"></input>
						</div>
					</div>
					<div id='grid3'></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 일 입고 자료 리스트 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">일 입고 자료 LIST</h4>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						&times;
					</button>
				</div>
				<div class="modal-body">
					<div>
						<div class="d-inline-block align-middle">입고 일자 *</div>
						<div
							class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
							<input type="text" id="InStartpicker-input"
								class=" form-control w-25" aria-label="Date-Time" name="sDate" />
							<span class="tui-ico-date"></span>
							<div id="InStartpicker-container" style="margin-left: -1px;"></div>
						</div>
						<div id="date2" style="margin-top: -1px;"></div>
						<div
							class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
							<input type="text" id="InEndpicker-input"
								class=" form-control w-25" aria-label="Date-Time" name="eDate" />
							<span class="tui-ico-date"></span>
							<div id="InEndpicker-container" style="margin-left: -1px;"></div>
						</div>
						<div id="date3" style="margin-top: -1px;"></div>
						<div>
							<input type="button" id="searchBtn" name="searchBtn" value="검색"></input>
						</div>
					</div>
					<div id='grid2' />
				</div>
				<div class="modal-footer">
					<button class="btn" id="modalY" name="modalY" type="button"
						data-dismiss="modal">예</button>
					<button class="btn" type="button" data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>