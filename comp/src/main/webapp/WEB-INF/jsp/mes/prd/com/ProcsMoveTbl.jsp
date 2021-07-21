<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>목록</title>

<script type="text/javaScript" language="javascript" defer="defer">
let myToast = null;
let prdComDNum1 = null;
let prdComNum1 = null;
let prdComNum = null;
let prdComMatNum = null;
let prdComDNum = null;
let itmCode = null;
let prcFNo = null;
let lotNum = null;
let lotNum1 = null;
let matCode = null;
let movNum = null;

// 각 그리드 추출 값
let grid1Data = null;
let grid2Data = null;
let grid3Data = null;
var gridData = {};

// Prt로 보낼 데이터
let prdComDDate2 = null
let movNum2 = null;
let prdComNum2 = null;
let prdComDate2 = null;
let itmCode2 = null;
let itmName2 = null;
let matName2 = null;
let lotNum2 = null;
let prdComVol2 = null;
let matHisDate2 = null;
let prdComNote2 = null;

//주문일련 계획일련 있는 row들 담을 변수
let rows = null;

$(function(){
	
	const grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    rowWidth: 100,
	    data: null,
	    columns: [
	    	{ header: '작업지시번호', name:'prdComNum'},
	    	{ header: '제품코드', name:'itmCode'},
			{ header: '제품명', name:'itmName'},
			{ header: '작업구분', name:'prcComDiv'},
			{ header: '지시량', name:'prdComVol'},
			{ header: '작업일자', name:'prdComDDate1'},
			{ header: '작업순서', name:'prcComNo'}
	    ]
	}); // end const grid
	
	grid.on('scrollEnd', () => {
	    });
	  
	const grid2 = new tui.Grid({
	    el: document.getElementById('grid2'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    rowWidth: 100,
	    data: null,
	    columns: [
	    	{ header: '순번', name:'prdComDNum'},
	    	{ header: '소재 LOT_NO', name:'lotNum'},
	    	{ header: '수량', name:'matVol'},
			{ header: '상태', name:''},
			{ header: '작업공정', name:'prcCode'},
			{ header: '이동NO', name:'movNum'}
	    ]
	}); // end const grid
	
	grid2.on('scrollEnd', () => {
	  });
	  
	const grid3 = new tui.Grid({
	    el: document.getElementById('grid3'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    rowWidth: 100,
	    data: null,
	    columns: [
	    	{ header: '상태', name:'prcState'},
	    	{ header: '순번', name:'prcFNo'},
	    	{ header: '공정명', name:'prcName'}
	    ]
	}); // end const grid
	
	grid3.on('scrollEnd', () => {
	  })
	  
	function getPrdComList() {
		let data;
		$.ajax({
			async: false,
			url : "ProduceCommandDList",
			type : "get",
			data : {
				startDate : startDate,
				endDate : endDate
			},
			dataType: 'json',
			success : function(result){
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	function getComMatList() {
		let data;
		$.ajax({
			async: false,
			url : "ProcessMatList",
			type : "get",
			data : {
				prdComMatNum: prdComMatNum,
				prdComDNum: prdComDNum
					},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					prdComMatNum = result[result.length -1].prdComMatNum;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	$('#searchBtn').click(function(){
		startDate = $('#startDate').val();
		endDate = $('#endDate').val();
		console.log(startDate);
		console.log(endDate);
		grid.resetData(getPrdComList());
	})
	
	//grid 행 더블클릭시 자재조회 및 공정흐름조회
	grid.on('dblclick', (e) => {
		prdComDNum = grid.getValue(e.rowKey,'prdComDNum');
		itmCode = grid.getValue(e.rowKey,'itmCode');
		prdComMatNum = null;
		prcFNo = null;
		grid2.resetData(getComMatList());
		grid3.resetData([]);
		
		grid1Data = grid.getRow(e.rowKey);
		console.log(grid1Data);
		
		matCode = grid.getValue(e.rowKey,'matCode');
		$('#itmCode').val(grid.getValue(e.rowKey,'itmCode'));
		$('#itmName').val(grid.getValue(e.rowKey,'itmName'));
		$('#prdComVol').val(grid.getValue(e.rowKey,'prdComVol'));
		$('#matCode').val(matCode);
		$('#matName').val(grid.getValue(e.rowKey,'matName'));
		$('#operName').val(grid.getValue(e.rowKey,'operName'));
	});
	
	grid2.on('dblclick', (e) => {
		movNum = grid2.getValue(e.rowKey, 'movNum');
		prcFNo = null;
		
		grid2Data = grid2.getRow(e.rowKey);
		console.log(grid2Data);
		
		grid3.clear();
		grid3.resetData(getFlowList());
	})
	
	//공정흐름조회 그리드
	function getFlowList() {
		let data;
		$.ajax({
			async: false,
			url : "ProduceCommandFlowList",
			type : "get",
			data : {
				itmCode: itmCode,
				movNum: movNum
					},
			dataType: "json",
			success : function(result){
				grid3Data = result;
				console.log(grid3Data);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	} 
	
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
	
	$('#mobile-collapse').click(function() {
		grid.refreshLayout();
		grid2.refreshLayout();
		grid3.refreshLayout();
	});
	
	$('#printBtn').click(function() {
		getPrtInfo();
		window.open("ProcsMoveTblPrt.do");
	})
	
	function getPrtInfo() {
		gridData['grid1Data'] = {
					prdComDDate : grid1Data.prdComDDate,
					prdComNum : grid1Data.prdComNum,
					prdComDate : grid1Data.prdComDate,
					itmCode : grid1Data.itmCode,
					itmName : grid1Data.itmName,
					matName : grid1Data.matName,
					prdComVol : grid1Data.prdComVol,
					prdComDNote : grid1Data.prdComDNote
					};
		gridData['grid2Data'] = {
				movNum : grid2Data.movNum,
				lotNum : grid2Data.lotNum
		}
		gridData['grid3Data'] = grid3Data;
	}
})// end of ready function

	function getProcessMov() {
		return grid1Data;
	}
	
	function getProcessMat() {
		return grid2Data;
	}
	
	function getProcessFlow() {
		return grid3Data;
	}
</script>
<style>
.form-control {
	width: 1px;
}
</style>
</head>
<body>
	<!-- 생산계획조회 Title -->
	<div class="page-header">
		<div class="page-block">
			<div class="row align-items-center">
				<div class="col-md-8">
					<div class="page-header-title">
						<h5 class="m-b-10">공정이동표 발행관리</h5>
					</div>
				</div>
				<div class="col-md-4">
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="/comp"> <i
								class="fa fa-home"></i>
						</a></li>
						<li class="breadcrumb-item">생산관리</li>
						<li class="breadcrumb-item">공정이동표 발행관리</li>
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
					<button type="button" class="btn btn-info" id="resetBtn">새자료</button>
					<button type="button" class="btn btn-info" id="printBtn">인쇄</button>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-12">
					<form id="pmFrm" action="ProcessMovePrt.do" onsubmit="return false">
						<div class="table">
							<table class="table">
								<tr>
									<td>
										<div class="d-inline-block align-middle">작업지시일자</div>
									</td>
									<td>
										<div class="row">
											<div
												class="tui-datepicker-input tui-datetime-input tui-has-focus">
												<input class="form-control" id="startDate" name="startDate"
													type="text" aria-label="Date" /> <span
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
							</table>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<div id="grid"></div>
							</div>
						</div>
						<div class="table">
							<table class="table">
								<tr>
									<td>
										<div class="row">
											<div style="margin: 10px;">제품코드</div>
											<div>
												<input class="form-control" id="itmCode" name="itmCode"
													type="text" readonly="readonly" />
											</div>
											<div style="margin: 10px;">제품명</div>
											<div>
												<input class="form-control" id="itmName" name="itmName"
													type="text" readonly="readonly" />
											</div>
											<div style="margin: 10px;">고객사</div>
											<div>
												<input class="form-control" id="operName" name="operName"
													type="text" readonly="readonly" />
											</div>
											<div style="margin: 10px;">지시량</div>
											<div>
												<input class="form-control" id="prdComVol" name="prdComVol"
													type="text" readonly="readonly" />
											</div>
										</div>
									</td>
								</tr>
							</table>
						</div>
						<div class="table">
							<table class="table">
								<tr>
									<td>
										<div class="row">
											<div style="margin: 10px;">소재코드</div>
											<div>
												<input class="form-control" id="matCode" name="matCode"
													type="text" readonly="readonly" />
											</div>
											<div style="margin: 10px;">소재명</div>
											<div>
												<input class="form-control" id="matName" name="matName"
													type="text" readonly="readonly" />
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div id="grid2"></div>
									</td>
								</tr>
							</table>
							<table class="table">
								<tr>
									<td>
										<div id="grid3"></div>
									</td>
								</tr>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<table>
		<tr></tr>
	</table>

</body>
</html>
