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
let matHisNum = null;
let matHisDateS = null;
let matHisDateE = null;
let matCode = null;
let operCode = null;
let operCodes = null;
let matHisDate = null;
let sDate = null;
let eDate = null;

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
    
/**    
    let TestDate = new Date();
    let picker2 = tui.DatePicker.createRangePicker({
        startpicker: {
            date: TestDate,
            input: '#TestStartpicker-input',
            container: '#TestStartpicker-container'
        },
        endpicker: {
            date: TestDate,
            input: '#TestEndpicker-input',
            container: '#TestEndpicker-container'
        },
        language: 'ko',
        type: 'date',
        format: 'yyyy-MM-dd'
    });
**/
    
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
	    data: getList(),
	    rowHeaders: ['rowNum', 'checkbox'],
	    columns: [
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
	    		name:'matComNum'
	    	},
			{ 
	    		header: '입고량', 
	    		name:'matHisDVol',
    			editor: "text"
	    	},
			{ 
	    		header: '단가', 
	    		name:'matHisPrice',
    			editor: "text"
	    	},
			{ 
	    		header: '금액', 
	    		name:'amount',
    			editor: "text"
	    	},
			{ 
	    		header: 'Lot No', 
	    		name:'lotNo'
	    	},
			{ 
	    		header: '자재재고', 
	    		name:'matVol'
	    	},
	    	{ 
	    		header: '관리번호', 
	    		name:'matHisNum'
// 	    		hidden: true
	    	}
	    ]
	}); // end const grid
	
	function getList() {
		let data;
		$.ajax({
			async: false,
			url : "MatInMng",
			type : "get",
			data : {
				matCode: matCode,
				operCodes: operCodes,
				matHisDateS: matHisDateS,
				matHisDateE: matHisDateE
				},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					matCode = result[result.length -1].matCode;
				}
				console.log(result);
				if(result.length != 0){
					matCode = result[result.length -1].matCode;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	} 
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getList());
	})
	
	const grid2 = new tui.Grid({
	    el: document.getElementById('grid2'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: getMatInDayList(),
	    rowHeaders: ['rowNum', 'checkbox'],
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
	    		name:'matOutOper'
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

	function getMatInDayList() {
		let data;
		$.ajax({
			async: false,
			url : "MatInDayList",
			type : "get",
			data : {
				matHisNum: matHisNum,
				sDate: sDate,
				eDate: eDate
				},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					matHisNum = result[result.length -1].matHisNum;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	} 
	
	$('#mobile-collapse').click(function() {
	      grid.refreshLayout();
	   });
	   
	$('#matInDayBtn').click(function(){
		grid2.clear();
		grid2.resetData(getMatInDayList());
		$("#myModal").modal("toggle");
		$("#myModal").on('shown.bs.modal', function () {
			grid2.refreshLayout();
		});
		
	})
	
	// 추가 버튼 클릭 이벤트, 그리드 row 생성 미완성
	var rowData = [];
	$('#addRowBtn').click(function() {
		grid.appendRow(rowData)
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
	
	$("#matInSaveBtn").click(function(){
		console.log(grid.getModifiedRows({}));
		let gridData = grid.getModifiedRows({});
		
		gridData["materialHistoryVO"]={
// 				matHisDate : $("#matHisDate").val()
				matOutOper : $("#matOutOper").val()
				}
		
		$.ajax({
			async: false,
			url: "updateMatIn",
			type : "post",
			data : JSON.stringify(gridData),
			dataType: "json",
			contentType: "application/json",
			success : function(){
				alret("insert success")
			}
		});
		grid.resetData(getList());
	});
	
	resetBtn.onclick=function(){
		grid.clear();
	}
	
// 	$('#testBtn').click(function(){
// 		console.log("searchBtn");
// 		console.log(grid.getCheckedRows());
// 		matHisDateS = $('#startpicker-input').val();
// 		matHisDateE = $('#endpicker-input').val();
// 		console.log(operCodes);
// 		grid.resetData(getList());
// 		gird2.resetData(getMatInDayList());
// 	})
	
	modalY.onclick=function() {
		matHisDate = null;
		operCode = null;
		matOutOper = null;
		str = '';
		for(let i =0; i<grid2.getCheckedRows().length; i++) {
			if(i == grid2.getCheckedRows().length-1){
				operCode = str + grid2.getCheckedRows()[i]['operCode'];
				matOutOper = str + grid2.getCheckedRows()[i]['matOutOper'];
				matHisDate = str + grid2.getCheckedRows()[i]['matHisDate'];
			}
		}
		console.log(operCode);
		console.log(matOutOper);
		console.log(matHisDate);
		console.log('======================');
	grid.resetData(getList());
	grid2.resetData(getMatInDayList());
	document.getElementById("MatInpicker-input").value=matHisDate;
	document.getElementById("operCode").value=operCode;
	document.getElementById("matOutOper").value=matOutOper;
	}
	
	grid2.on('scrollEnd', () => {
		  grid.appendRows(getMatInDayList());
		})
	
	searchBtn.onclick = function(){
		console.log('test')
		
		sDate = $(".modal-body").find('input[name="sDate"]').val();
		console.log(sDate)
		eDate = $(".modal-body").find('input[name="eDate"]').val();
		console.log(eDate)
		
		grid2.resetData(getMatInDayList());
	}
	
	matInDeleteBtn.onclick = function(){
		grid.remoceCheckedRows()
		console.log(grid.removeCheckedRows());
	}
	
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
							<div id="title" class="card-header">
								<h3>자재 입고 관리</h3>
								<br />
							</div>
							<!-- // 타이틀 -->
							<div>
								<div class="d-inline-block align-middle">입고 일자 *</div>
								<div
									class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
									<input type="text" id="MatInpicker-input"
										class=" form-control w-25" aria-label="Date-Time"
										name="matHisDate" /> <span class="tui-ico-date"></span>
									<div id="MatInpicker-container" style="margin-left: -1px;"></div>
								</div>
								<div id="date1" style="margin-top: -1px;"></div>
							<br />
							
							<!--  <div>검사 자료</div>
							<div>
								<div class="d-inline-block align-middle">검사 일자 *</div>
								<div
									class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
									<input type="text" id="TestStartpicker-input"
										class=" form-control w-25" aria-label="Date-Time"
										name="matHisDate" /> <span class="tui-ico-date"></span>
									<div id="TestStartpicker-container" style="margin-left: -1px;"></div>
								</div>
								<div id="date3" style="margin-top: -1px;"></div>
								<div
									class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
									<input type="text" id="TestEndpicker-input"
										class=" form-control w-25" aria-label="Date-Time"
										name="matHisDate" /> <span class="tui-ico-date"></span>
									<div id="TestEndpicker-container" style="margin-left: -1px;"></div>
								</div>
								<div id="date4" style="margin-top: -1px;"></div>
							</div>
							<input type="button" id="testBtn" name="testBtn" value="검사 자료 조회" /> -->
							
							<div>
								입고업체 * <input type="text" id="operCode" name="operCode"></input>
								<input type="text" disabled id="matOutOper" name="matOutOper"></input>
								<%@ include
									file="/WEB-INF/jsp/mes/common/modal/OperationList.jsp"%>
							</div>
							<br />
							<div>
								<button id="matInDayBtn" type="button" class="btn btn-info btn-sm">조회</button>
								<input id="resetBtn" class="btn btn-info btn-sm" type="reset"
									value="리셋"></input>
								<button type="button" id="matInSaveBtn" name="matInSaveBtn"
									class="btn btn-info btn-sm">저장</button>
								<button type="button" id="matInDeleteBtn" name="matInDeleteBtn"
									class="btn btn-info btn-sm">삭제</button>
							</div>
							<br />
							<div class="page-wrapper">
								<div class="text-right">
									<button type="button" class="btn btn-primary btn-sm"
										id="addRowBtn">추가</button>
									<button type="button" class="btn btn-primary btn-sm"
										id="deleteRowBtn">삭제</button>
								</div>
								<br />
								<div class="row">
									<div class="col-xl-12">
										<div class="card">
											<div id="grid" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form:form>


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
							class=" form-control w-25" aria-label="Date-Time"
							name="sDate" /> <span class="tui-ico-date"></span>
						<div id="InStartpicker-container" style="margin-left: -1px;"></div>
					</div>
					<div id="date5" style="margin-top: -1px;"></div>
					<div
						class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
						<input type="text" id="InEndpicker-input" class=" form-control w-25"
							aria-label="Date-Time" name="eDate" /> <span
							class="tui-ico-date"></span>
						<div id="InEndpicker-container" style="margin-left: -1px;"></div>
					</div>
					<div id="date2" style="margin-top: -1px;"></div>
					<div><input type="button" id="searchBtn" name="searchBtn" value="검색"></input></div>
				</div>
					<div id='grid2' />
				</div>
				<div class="modal-footer">
					<button class="btn" id="modalY" name="modalY" type="button" data-dismiss="modal">예</button>
					<button class="btn" type="button" data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>