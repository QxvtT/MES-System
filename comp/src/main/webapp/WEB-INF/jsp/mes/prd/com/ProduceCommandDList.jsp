<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : ProduceCommandDList.jsp
  * @Description : ProduceCommandD List 화면
  * @Modification Information
  * 
  * @author soyeon
  * @since 20210625
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

//주문일련 계획일련 있는 row들 담을 변수
let rows = null;

$(function(){
	var datepicker = new tui.DatePicker('#date', {
        date: new Date(),
        language: 'ko',
        input: {
            element: '#prdComDate',
            format: 'yyyy-MM-dd'
        }
    });
	
	const grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    rowWidth: 100,
	    data: null,
	    rowHeaders: ['checkbox'],
	    columns: [
	    	{ header: '일련번호', name:'prdComDNum', hidden: true},
	    	{ header: '계획일련번호', name:'prdPlanDNum', hidden: true},
	    	{ header: '주문일련번호', name:'ordDNum', hidden: true},
			{ header: '자재코드', name:'matCode', hidden: true},
			{ header: '자재명', name:'matName', hidden: true},
			{ header: '업체명', name:'operName', hidden: true},
			{ header: '제품코드', name:'itmCode', editor: 'text'},
			{ header: '제품이름', name:'itmName'},
			{ header: '구분', name:'prcComDiv', editor: 'text'},
			{ header: '주문번호', name:'ordNum'},
			{ header: '납기일자', name:'ordDeliveryDate'},
			{ header: '주문량', name:'ordVol'},
			{ header: '기지시량', name:'yesComVol'},
			{ header: '미지시량', name:'noComVol'},
			{ header: '지시량', name:'prdComVol', editor: 'text'},
			{ header: 'UPH', name:'uph'},
			{ header: '일생산량', name:'itmDayOutput'},
			{ header: '일수', name:'dayNum'},
			{ header: '작업일자', name:'prdComDDate1', 
				editor: {
		            type: 'datePicker',
		            options: {
		              format: 'yyyy-MM-dd',
		              language: 'ko'
		            }
      			}	
			},
			{ header: '작업순서', name:'prcComNo', editor: 'text'},
			{ header: '비고', name:'prdComDNote', editor: 'text'}
	    ]
	}); // end const grid
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getList());
	  })
	  
	function getList() {
		let data;
		$.ajax({
			async: false,
			url : "ProduceCommandDList",
			type : "get",
			data : {prdComDNum1: prdComDNum1,
					prdComNum: prdComNum
					},
			dataType: "json",
			success : function(result){
				console.log(prdComNum1);
				if(result.length > 0) {
					prdComDNum1 = result[result.length -1].prdComDNum;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	//메인그리드 행 추가
	insertBtn.onclick = function() {
		grid.appendRow();
	}
	
	//메인그리드 행 삭제
	deleteBtn.onclick = function() {
		grid.removeCheckedRows(true);
		
	}
	
	
	
	
	//작업지시 조회용 모달
	let today = new Date();
    let picker = tui.DatePicker.createRangePicker({
        startpicker: {
            date: today,
            input: '#startpicker-input',
            container: '#startpicker-container'
        },
        endpicker: {
            date: today,
            input: '#endpicker-input',
            container: '#endpicker-container'
        },
        language: 'ko'
    });
 
    
	const grid2 = new tui.Grid({
	    el: document.getElementById('grid2'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    rowWidth: 100,
	    data: null,
	    rowHeaders: ['rowNum'],
	    columns: [
	    	{ header: '지시번호', name:'prdComNum'},
			{ header: '지시일자', name:'prdComDate'},
			{ header: '작업지시명', name:'prdComName'},
			{ header: '비고', name:'prdComNote'}
	    ]
	}); // end const grid2
	
	grid2.on('scrollEnd', () => {
	    grid2.appendRows(getPrdComList());
	  })
	  
	function getPrdComList() {
		let data;
		$.ajax({
			async: false,
			url : "ProduceCommandList",
			type : "get",
			data : {prdComNum1: prdComNum1},
			dataType: "json",
			success : function(result){
				console.log(prdComNum1);
				if(result.length > 0) {
					prdComNum1 = result[result.length -1].prdComNum;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	$('#searchComBtn').click(function(){
		$("#myModal").modal("toggle");
		$("#myModal").on('shown.bs.modal', function () {
			prdComNum1 = null;
			grid2.refreshLayout();
			grid2.resetData(getPrdComList());
		});
		
	})
	
	// 주문일련이나 계획일련이 있으면 제품번호 수정 못하게 막는 function
	function dblclickCanceal(e) {
		console.log(e);
		if(e.columnName == "itmCode") {
			for(let i=0; i<rows.length; i++) {
				if(e.rowKey == rows[i].rowKey) e.stop();
			}
		}
	};
	// 주문일련이나 계획일련이 있으면 제품번호 수정 못하게 막는  function //
	
	//작업지시 조회모달에서 더블클릭시 조회할 지시 선택하는 기능
	function selectCom(e) {
		prdComDNum1 = null;
		if(myToast != null) myToast.reset();
		prdComNum = grid2.getValue(e.rowKey,'prdComNum');
		$('#prdComNum').val(prdComNum);
		$('#prdComDate').val(grid2.getValue(e.rowKey,'prdComDate'));
		$('#prdComName').val(grid2.getValue(e.rowKey,'prdComName'));
		$('#prdComNote').val(grid2.getValue(e.rowKey,'prdComNote'));
		//$('#operName').val(grid2.getValue(e.rowKey,'operName'));
		
		grid.resetData(getList());
		// 이전 데이터들 초기화
		gridMat.clear();
		gridFlow.clear();
		$('#itmCode').val('');
		$('#itmName').val('');
		$('#prdComVol').val('');
		$('#matCode').val('');
		$('#matName').val('');
		$('#operName').val('');
		
		// 주문일련이나 계획일련이 있는 row 구하기
		rows = grid.findRows((row) => {
		    return (row.prdPlanDNum != null || row.ordDNum != null);
		});
		console.log("row값");
		console.log(rows);
		
		// 주문일련이나 계획일련이 있으면 제품번호 수정 못하게 막는 코드
		grid.on('dblclick', dblclickCanceal);
		
		$('#myModal').modal('hide');
		//토스트메시지 테스트
		myToast = $.toast({ 
			  text : "조회되었습니다.", 
			  showHideTransition : 'slide',  // It can be plain, fade or slide
			  bgColor : 'yellowgreen',              // Background color for toast
			  textColor : 'white',            // text color
			  allowToastClose : false,       // Show the close button or not
			  hideAfter : 2000,              // `false` to make it sticky or time in miliseconds to hide after
			  stack : 5,                     // `fakse` to show one stack at a time count showing the number of toasts that can be shown at once
			  textAlign : 'center',            // Alignment of text i.e. left, right, center
			  position : 'top-center'       // bottom-left or bottom-right or bottom-center or top-left or top-right or top-center or mid-center or an object representing the left, right, top, bottom values to position the toast on page
			});
	}
	grid2.on('dblclick', (e) => {
		selectCom(e);
	});
	
	$('#modalComY').click(() => {
		let e = grid2.getFocusedCell();
		console.log("클릭: ");
		console.log(e);
		if(e.rowKey != null) {
			selectCom(e);
		}
	});
	//작업지시 조회용 모달//
	
	//자재로트번호 선택용 모달
	const gridMatStock = new tui.Grid({
	    el: document.getElementById('gridMatStock'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    rowWidth: 100,
	    data: getMatStokList,
	    rowHeaders: ['checkbox'],
	    columns: [
	    	{ header: '자재LOTNO', name:'lotNum'},
			{ header: '수량', name:'matVol'},
	    ]
	}); // end const grid2
	
	gridMatStock.on('scrollEnd', () => {
		gridMatStock.appendRows(getMatStokList());
	  })
	  
	function getMatStokList() {
		let data;
		$.ajax({
			async: false,
			url : "MatStockList",
			type : "get",
			data : {lotNum1: lotNum1,
					matCode: matCode
			},
			dataType: "json",
			success : function(result){
				console.log(prdComNum1);
				if(result.length > 0) {
					lotNum1 = result[result.length -1].lotNum;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	$('#searchMatLotBtn').click(function(){
		if(matCode == null) {
			return alert("행이 선택되지 않았습니다.");
		}
		$("#mLotModal").modal("toggle");
		$("#mLotModal").on('shown.bs.modal', function () {
			console.log("aaaaaaaaaaa");
			lotNum1 = null;
			gridMatStock.refreshLayout();
			gridMatStock.resetData(getMatStokList());
		});
		
	})
	
	// lotno자재 모달에서 더블클릭시 조회할 지시 선택하는 기능
	
	$('#modalLotY').click(() => {
		let oldRows = gridMat.getData();
		let chkRows = gridMatStock.getCheckedRows();
		console.log(oldRows);
		console.log(chkRows);
		for(let i in oldRows) {
			for(let j in chkRows) {
				if(oldRows[i].lotNum == chkRows[j].lotNum) {
					chkRows.splice(j,1);
				}
			}
		}
		for(let r in chkRows) {
			gridMat.appendRow(chkRows[r]);
		}
		$('#mLotModal').modal('hide');
	});
	//자재로트번호 선택용 모달 //
	
	//행에서 쓸 자재로트
	const gridMat = new tui.Grid({
	    el: document.getElementById('gridMat'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    rowWidth: 100,
	    data: null,
	    rowHeaders: ['checkbox'],
	    columns: [
			{ header: '지시자재일련번호', name:'prdComMatNum', hidden: true},
			{ header: '순번', name:'prdComMatO', editor: 'text'},
			{ header: '자재LOT NO', name:'lotNum'},
			{ header: '수량', name:'matVol', editor: 'text'},
			{ header: '비고', name:'prdComMatNote', editor: 'text'}
	    ]
	}); // end const grid2
	
	gridMat.on('scrollEnd', () => {
	    gridMat.appendRows(getComMatList());
	  })
	  
	function getComMatList() {
		let data;
		$.ajax({
			async: false,
			url : "ProduceCommandMatList",
			type : "get",
			data : {prdComMatNum: prdComMatNum,
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
	
	deleteMBtn.onclick = function() {
		gridMat.removeCheckedRows(true);
		
	}
	//행에서 쓸 자재로트//
	
	//grid 행 더블클릭시 자재조회 및 공정흐름조회
	grid.on('dblclick', (e) => {
		prdComDNum = grid.getValue(e.rowKey,'prdComDNum');
		itmCode = grid.getValue(e.rowKey,'itmCode');
		matCode = grid.getValue(e.rowKey,'matCode');
		prdComMatNum = null;
		prcFNo = null;
		gridMat.resetData(getComMatList());
		gridFlow.resetData(getFlowList());
		$('#itmCode').val(grid.getValue(e.rowKey,'itmCode'));
		$('#itmName').val(grid.getValue(e.rowKey,'itmName'));
		$('#prdComVol').val(grid.getValue(e.rowKey,'prdComVol'));
		$('#matCode').val(matCode);
		$('#matName').val(grid.getValue(e.rowKey,'matName'));
		$('#operName').val(grid.getValue(e.rowKey,'operName'));
	});
	
	//공정흐름조회 그리드
	const gridFlow = new tui.Grid({
	    el: document.getElementById('gridFlow'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    rowWidth: 100,
	    data: null,
	    rowHeaders: ['rowNum'],
	    columns: [
			{ header: '순서', name:'prcFNo', hidden: true},
			{ header: '공정코드', name:'prcCode', hidden: true},
			{ header: '공정명', name:'prcName'},
			{ header: '비고', name:'prcFExplain'}
	    ]
	}); // end const gridFlow
	
	gridFlow.on('scrollEnd', () => {
		gridFlow.appendRows(getFlowList());
	  })
	  
	function getFlowList() {
		let data;
		$.ajax({
			async: false,
			url : "ProduceCommandFlowList",
			type : "get",
			data : {itmCode: itmCode,
					prcFNo: prcFNo
					},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					prcFNo = result[result.length -1].prcFNo;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	//공정흐름조회 그리드//
	
	$('#mobile-collapse').click(function() {
		grid.refreshLayout();
		gridMat.refreshLayout();
		gridFlow.refreshLayout();
	});
	
	//작업지시 수정 및 생성
	saveBtn.onclick = function(){
		let gridData = grid.getModifiedRows({});
		console.log(gridData);

		gridData["produceCommandDVO"] = {
									prdComNum : $('#prdComNum').val(),
									prdComDate : $('#prdComDate').val(),
									prdComName : $('#prdComName').val(),
									prdComNote : $('#prdComNote').val()
									}
		$.ajax({
				async: false, 
				url : "ProduceCommandUpdate",
				type : "post",
				data : JSON.stringify(gridData),
				dataType: "json",
				contentType:"application/json",
				success : function(data) {
					console.log(data);
					prdComNum = data;
				}
				});
		
		//lot자재 수정
		let gridDataM = gridMat.getModifiedRows({});
		gridDataM["produceCommandDVO"] = {
				prdComDNum : prdComDNum,
				matCode : matCode,
				}
		$.ajax({
			async: false, 
			url : "ProduceCommandMatUpdate",
			type : "post",
			data : JSON.stringify(gridDataM),
			dataType: "json",
			contentType:"application/json",
			success : function(data) {
				console.log(data);
				prdComNum = data;
			}
		});
		
		prdComDNum1 = null;
		grid.resetData(getList());

	}
	
	//자재 출고 관리
	outMatLotBtn.onclick = function() {
		//저장안된 수정사항이 없는지 체크하고 이미 출고된 녀셕은 못하게 하고 수행하기
		let gridDataMO = gridMat.getData({});
		gridDataM["produceCommandDVO"] = {
				prdComDNum : prdComDNum,
				matCode : matCode,
				}
		$.ajax({
			async: false, 
			url : "MatOutUpdate",
			type : "post",
			data : JSON.stringify(gridDataMO),
			dataType: "json",
			contentType:"application/json",
			success : function(data) {
				console.log(data);
				prdComNum = data;
			}
		});
		prdComDNum1 = null;
		grid.resetData(getList());
	}
	
	
})

</script>
</head>
<body>

<div class="pcoded-inner-content">
<div class="main-body">
<div class="page-wrapper">
<div class="row">
<div class="col-xl-12">
	<button type="button" id="test1">test</button>
	<!-- 작업지시서 검색 모달 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">
						작업지시서 검색
					</h3>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						&times;
					</button>
				</div>
				<div class="modal-body">
					<div class="">
					    <div class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3 d-inline-block">
					        <input type="text" id="startpicker-input" class=" form-control w-25" aria-label="Date-Time"/>
					        <span class="tui-ico-date"></span>
					        <div id="startpicker-container" style="margin-left: -1px;"></div>
					    </div>
	
						<label class="col-form-label text-center"> ~ </label>
						<div class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3 d-inline-block">
					        <input type="text" id="endpicker-input" class=" form-control w-25" aria-label="Date-Time"/>
					        <span class="tui-ico-date"></span>
					        <div id="endpicker-container" style="margin-left: -1px;"></div>
					    </div>
					    <button type="button" id="searchPlnBtn"
							class="btn btn-sm btn-primary waves-effect waves-light">검색</button>
					</div>
				</div>	
				<div id="grid2"></div>
				<div class="modal-footer">
					<a class="btn" id="modalComY">예</a>
					<button class="btn" type="button" data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 자재lotno 검색 모달 -->
	<div class="modal fade" id="mLotModal" tabindex="-1" role="dialog"
				aria-labelledby="matModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="matModalLabel">
						자재LOT NO 검색
					</h3>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						&times;
					</button>
				</div>
				<div class="modal-body">
					<div class="">
					    LOT NO
					    <input type="text" class="form-control ml-3 w-50" id="lotNum" name="lotNum"></input>
					    <button type="button" id="searchLotNumBtn"
							class="btn btn-sm btn-primary waves-effect waves-light">검색</button>
					</div>
				</div>	
				<div id="gridMatStock"></div>
				<div class="modal-footer">
					<a class="btn" id="modalLotY">예</a>
					<button class="btn" type="button" data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>
  

<form:form commandName="produceCommandDVO" name="detailForm" id="detailForm" >
	<input type="hidden" id ="prdComNum" name="prdComNum"/>
	<!-- 타이틀 -->
	<div id="title" class="mb-4">
		<h3>생산 지시 관리</h3>
	</div>
	<!-- // 타이틀 -->
	
	<div class="row">
		<div class="col-sm-12 text-right">
			<div class="btn-group">
				<button type="button" id="searchComBtn" class="btn waves-effect waves-light btn-primary btn-outline-primary" data-toggle="modal" data-target="#myModal"> 조회 </button>
				<input type="reset" value=" 리셋 " class="btn waves-effect waves-light btn-primary btn-outline-primary"></input>
				<input type="button" id="saveBtn" value=" 저장 " class="btn waves-effect waves-light btn-primary btn-outline-primary"></input>
				<input type="button" value=" 삭제 " class="btn waves-effect waves-light btn-primary btn-outline-primary"></input>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6" style="z-index: 200">
			<div class="table">
			<table class="table">
				<tr>
					<td>
						<div class="d-inline-block align-middle">작성일자</div>
					</td>
					<td>
						<div class="row align-items-center text-center col-lg-12">
						    <div class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
						        <input type="text" id="prdComDate" name="prdComDate" class=" form-control w-25" aria-label="Date-Time"/>
						        <span class="tui-ico-date"></span>
						    </div>
						    <div id="date" style="margin-top: -1px;"></div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
				 		<label class="col-form-label text-center">작업지시명</label>
				 	</td>
				 	<td>
					 	<div class="row align-items-center text-center col-lg-12">
							<input type="text" class="form-control w-25 ml-3" id="prdComName" name="prdComName"></input>
						</div>
					</td>
				</tr>
				<tr>
					<td>
				 		<label class="col-form-label text-center">특이사항</label>
				 	</td>
				 	<td>
					 	<div class="row align-items-center text-center col-lg-12">
							<input type="text" class="form-control ml-3" id="prdComNote" name="prdComNote"></input>
						</div>
					</td>
				</tr>
			</table>
			</div>
		</div>
		<div class="col-md-6">
			<div class="card">
					<div class="card-body">
					<h5 class="d-inline">생산계획 조회</h5>
					<button type="button" id="searchPlnBtn"
								class="btn btn-sm btn-primary waves-effect waves-light ml-3">검색</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row" style="height: 50px">
		<div class="col-sm-6">
		</div>
		<div class="col-sm-6 text-right">
			<button class="btn btn-sm btn-primary waves-effect waves-light ml-3" type="button" id="insertBtn">추가</button>
			<button class="btn btn-sm btn-primary waves-effect waves-light ml-3" type="button" id="deleteBtn">삭제</button>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12" style="z-index: 100">
			<div id="grid"></div>
		</div>
	</div>
	<div class="row">
		<div class="col-xl-7 col-lg-12">
			<label class="ml-3 d-inline">자재코드</label>
			<input type="text" class="form-control ml-3 d-inline" id="matCode" name="matCode" style="width:100px" readonly></input>
			<label class="ml-3 d-inline">자재명</label>
			<input type="text" class="form-control ml-3 d-inline" id="matName" name="matName" style="width:100px" readonly></input>
		</div>
		<div class="col-xl-5 col-lg-12">
			<label class="ml-3 d-inline">제품코드</label>
			<input type="text" class="form-control ml-3 d-inline" id="itmCode" name="itmCode" style="width:100px" readonly></input>
			<label class="ml-3 d-inline">제품명</label>
			<input type="text" class="form-control ml-3 d-inline" id="itmName" name="itmName" style="width:100px" readonly></input>
		</div>
	</div>
	<div class="row">
		<div class="col-xl-7 col-lg-12 row text-right">
			<div class="col-sm-8">
			</div>
			<div class="col-sm-4 text-right" style="padding-left: 0px">
				<button type="button" id="outMatLotBtn" class="btn btn-sm btn-primary waves-effect waves-light">출고</button>
				<button type="button" id="searchMatLotBtn" class="btn btn-sm btn-primary waves-effect waves-light">검색</button>
				<button type="button" id="deleteMBtn" class="btn btn-sm btn-primary waves-effect waves-light">삭제</button>
			</div>
		</div>
		<div class="col-xl-5 col-lg-12">
			<label class="ml-3  d-inline">고객사명</label>
			<input type="text" class="form-control ml-3  d-inline" id="operName" name="operName" style="width:100px" readonly></input>
			<label class="ml-3  d-inline">지시량</label>
			<input type="text" class="form-control ml-3  d-inline" id="prdComVol" name="prdComVol" style="width:100px" readonly></input>
		</div>
	</div>
	<div class="row">
		<div class="col-xl-7 col-lg-12">
			<div id="gridMat"></div>
		</div>
		<div class="col-xl-5 col-lg-12">
			<div id="gridFlow"></div>
		</div>
	</div>

</form:form>	

</div>
</div>
</div>
</div>
</div>

</body>
</html>
