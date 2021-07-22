<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
//생산계획일 범위 변수
let prdDateS = null;
let prdDateE = null;
//계획 스크롤용
let prdPlnDNum1 = null;

//주문일련 계획일련 있는 row들 담을 변수
let rows = null;

//제품조회 스크롤용
let itmCode1 = null;

//새행 구분용
let matRowKey = null;

let rowKey = null;

//삭제수정 막을 로우
let rowsY = [];
//입력데이터 부족할때 확인용
let rowsNo = [];

$(function(){
	outMatLotBtn.classList.add('btn-disabled');
	outMatLotBtn.classList.add('disabled');
	
	let today = new Date();
	var datepicker = new tui.DatePicker('#date', {
        date: today,
        language: 'ko',
        input: {
            element: '#prdComDate',
            format: 'yyyy-MM-dd'
        }
    });
	
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
        language: 'ko',
        type: 'date',
        format: 'yyyy-MM-dd'
  
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
			{ header: '구분', name:'prcComDiv', editor: 'text',
				formatter: 'listItemText',
		          editor: {
		            type: 'select',
		            options: {
		              listItems: [
		                { text: '정상', value: '정상' },
		                { text: '재작업', value: '재작업' }
		              ]
		            }
		          }
			},
			{ header: '주문번호', name:'ordNum'},
			{ header: '납기일자', name:'ordDeliveryDate'},
			{ header: '주문량', name:'ordVol'},
			{ header: '기지시량', name:'yesComVol',
				formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}	
			},
			{ header: '미지시량', name:'noComVol',
				formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}	
			},
			{ header: '지시량', name:'prdComVol', editor: 'text', 
				formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}
			},
			{ header: 'UPH', name:'uph'},
			{ header: '일생산량', name:'itmDayOutput',
				formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}	
			},
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
			{ header: '비고', name:'prdComDNote', editor: 'text'},
			{ header: '출고여부', name:'matOutChk', hidden: true}
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
    let pickerModal = tui.DatePicker.createRangePicker({
        startpicker: {
            date: today,
            input: '#startD',
            container: '#start-container'
        },
        endpicker: {
            date: today,
            input: '#endD',
            container: '#end-container'
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
			url: "ProduceCommandList",
			type: "get",
			data: {
				startDate : startDate,
				endDate : endDate,
				prdComNum1: prdComNum1
			},
			dataType: "json",
			success: function(result){
				if(result.length > 0) {
					prdComNum1 = result[result.length -1].prdComNum;
				}
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
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
		
		//출고여부가 Y면 체크박스를 막아 삭제못하게
		rowsY = grid.findRows((row) => {
		    return (row.matOutChk == 'Y');
		});
		console.log("rowY");
		console.log(rowsY);
		for(let i in rowsY) {
			grid.disableRowCheck(rowsY[i].rowKey);
			grid.disableRow(rowsY[i].rowKey);
		}
		
		// 이전 데이터들 초기화
		gridMat.clear();
		gridFlow.clear();
		$('#itmCode').val('');
		$('#itmName').val('');
		$('#prdComVol').val('');
		$('#matCode').val('');
		$('#matName').val('');
		$('#operName').val('');
		matRowKey = null;
		
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
	
	// 조회 모달에서 계획번호 cell만 선택하기 위해 조건문에서 사용되는 함수
	function getKeyByValue(object, value) {
		return Object.keys(object).find(key => object[key] === value);
	}
	
	grid2.on('dblclick', (e) => {
		$('#searchComModal').modal("hide");
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
	
	//미지시 생산계획 불러오기
	function getPlnList() {
		let data;
		$.ajax({
			async: false,
			url : "PrdPlnDList",
			type : "get",
			data : {prdPlnDNum1: prdPlnDNum1,
					prdDateS: prdDateS,
					prdDateE: prdDateE
					},
			dataType: "json",
			success : function(result){
				console.log(prdComNum1);
				if(result.length > 0) {
					prdPlnDNum1 = result[result.length -1].prdPlnDNum;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	
	searchPlnBtn.onclick = function() {
		// 이전 데이터들 초기화
		gridMat.clear();
		gridFlow.clear();
		$('#itmCode').val('');
		$('#itmName').val('');
		$('#prdComVol').val('');
		$('#matCode').val('');
		$('#matName').val('');
		$('#operName').val('');
		//지시번호, 작성일자, 지시명, 특이사항 리셋
		$('#prdComNum').val('');
		$('#prdComDate').val('');
		$('#prdComName').val('');
		$('#prdComNote').val('');
		prdComNum = null;
		prdComDNum = null;
		matRowKey = null;
		prdDateS = $('#startpicker-input').val();
		prdDateE = $('#endpicker-input').val();
		console.log("일자");
		console.log(prdDateS);
		console.log(prdDateE);
		grid.clear();
		let data = getPlnList();
		for(let i in data) {
			console.log(data[i]);
			grid.appendRow(data[i]);
		}
		
	}
	

	//grid 행 더블클릭시 자재조회 및 공정흐름조회
	grid.on('dblclick', (e) => {
		gridMat.enable();
		if(grid.getValue(e.rowKey,'matOutChk') != 'Y') {
			outMatLotBtn.classList.remove('btn-disabled', 'disabled');
			deleteMBtn.classList.remove('btn-disabled', 'disabled');
		} else {
			gridMat.disable();
			deleteMBtn.classList.add('btn-disabled');
			deleteMBtn.classList.add('disabled');
			
		}
		//새로 추가한 행이라 지시일련이 없는 경우 rowKey를 가져간다.
		if(grid.getValue(e.rowKey,'prdComDNum') == null || grid.getValue(e.rowKey,'prdComDNum') == '') {
			matRowKey = e.rowKey;
			prdComDNum = null;
		} else {
			matRowKey = null;
			prdComDNum = grid.getValue(e.rowKey,'prdComDNum');
			console.log("지시일련 있나 보자");
			console.log(prdComDNum);
		}
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
		console.log("이거 와이");
		console.log(grid.getValue(e.rowKey,'itmCode'));
		console.log(e);
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
	
	//작업지시 전체삭제
	removeBtn.onclick = function() {
		if(rowsY.length != 0) {
			//토스트메시지 
			$.toast({ 
				  text : "출고된 내역은 삭제할수 없습니다.", 
				  showHideTransition : 'slide',
				  bgColor : 'tomato',
				  textColor : 'white',
				  allowToastClose : false,
				  hideAfter : 2000,
				  stack : 1,
				  textAlign : 'center',
				  position : 'top-center'
				});
			return null;
		}
		if(prdComNum != null) {
			console.log("지시번호로 삭제");
			console.log(prdComNum);
			$.ajax({
				async: false, 
				url : "ProduceCommandDelete",
				type : "post",
				data : {prdComNum : prdComNum},
				dataType: "json",
				contentType:"application/json",
				success : function(data) {
					console.log(data);
				}
			});
		}
		//초기화
		reset();
	}
	
	//작업지시 수정 및 생성
	saveBtn.onclick = function(){
		if($('#prdComDate').val() == '') {
			//토스트메시지 
			$.toast({ 
				  text : "작성일자를 입력해주세요.", 
				  showHideTransition : 'slide',
				  bgColor : 'tomato',
				  textColor : 'white',
				  allowToastClose : false,
				  hideAfter : 2000,
				  stack : 1,
				  textAlign : 'center',
				  position : 'top-center'
				});
			return null;
		}
		if($('#prdComName').val() == '') {
			//토스트메시지 
			$.toast({ 
				  text : "작업지시명을 입력해주세요.", 
				  showHideTransition : 'slide',
				  bgColor : 'tomato',
				  textColor : 'white',
				  allowToastClose : false,
				  hideAfter : 2000,
				  stack : 1,
				  textAlign : 'center',
				  position : 'top-center'
				});
			return null;
		}
		
		//아이템코드, 구분, 지시량, 작업일자 없을때 막기
		rowsNo = [];
		rowsNo = grid.findRows((row) => {
		    return (row.itmCode == '');
		});
		if(rowsNo.length > 0) {
			$.toast({ 
				  text : "제품코드를 입력해주세요.", 
				  showHideTransition : 'slide',
				  bgColor : 'tomato',
				  textColor : 'white',
				  allowToastClose : false,
				  hideAfter : 2000,
				  stack : 1,
				  textAlign : 'center',
				  position : 'top-center'
				});
			return null;
		}
		rowsNo = [];
		rowsNo = grid.findRows((row) => {
		    return (row.prcComDiv == '');
		});
		if(rowsNo.length > 0) {
			$.toast({ 
				  text : "작업구분을 입력해주세요.", 
				  showHideTransition : 'slide',
				  bgColor : 'tomato',
				  textColor : 'white',
				  allowToastClose : false,
				  hideAfter : 2000,
				  stack : 1,
				  textAlign : 'center',
				  position : 'top-center'
				});
			return null;
		}
		rowsNo = [];
		rowsNo = grid.findRows((row) => {
		    return (row.prdComVol == '');
		});
		if(rowsNo.length > 0) {
			$.toast({ 
				  text : "지시량을 입력해주세요.", 
				  showHideTransition : 'slide',
				  bgColor : 'tomato',
				  textColor : 'white',
				  allowToastClose : false,
				  hideAfter : 2000,
				  stack : 1,
				  textAlign : 'center',
				  position : 'top-center'
				});
			return null;
		}
		rowsNo = [];
		rowsNo = grid.findRows((row) => {
		    return (row.prdComDDate1 == '');
		});
		if(rowsNo.length > 0) {
			$.toast({ 
				  text : "작업일자를 입력해주세요.", 
				  showHideTransition : 'slide',
				  bgColor : 'tomato',
				  textColor : 'white',
				  allowToastClose : false,
				  hideAfter : 2000,
				  stack : 1,
				  textAlign : 'center',
				  position : 'top-center'
				});
			return null;
		}
		
		let gridData = grid.getModifiedRows({});
		console.log(gridData);
		let created = gridData["createdRows"];
		for(let i in created) {
			created[i].rowKey1 = created[i].rowKey;
		}
		gridData["createdRows"] = created;

		gridData["produceCommandDVO"] = {
									prdComNum : $('#prdComNum').val(),
									prdComDate : $('#prdComDate').val(),
									prdComName : $('#prdComName').val(),
									prdComNote : $('#prdComNote').val(),
									matRowKey : matRowKey
									}
		console.log(gridData);
		$.ajax({
				async: false, 
				url : "ProduceCommandUpdate",
				type : "post",
				data : JSON.stringify(gridData),
				dataType: "json",
				contentType:"application/json",
				success : function(data) {
					console.log(data);
					if(data.prdComNum != null) {
						prdComNum = data.prdComNum;
						$('#prdComNum').val(prdComNum);
					}
					if(data.prdComDNum != null) {
						prdComDNum = data.prdComDNum;
					}
					prdComDNum1 = null;
					grid.resetData(getList());
					//토스트메시지 
					$.toast({ 
					  text : "작업지시 저장에 성공했습니다.", 
					  showHideTransition : 'slide',
					  bgColor : 'Limegreen',
					  textColor : 'white',
					  allowToastClose : false,
					  hideAfter : 2000,
					  stack : 1,
					  textAlign : 'center',
					  position : 'top-center'
					});
				}
				});
		
		//lot자재 수정
		if(prdComDNum == '' || prdComDNum == null){
				prdComDNum = gridMat.getValue(0, "prdComDNum");
				console.log("rowCount");	
				console.log(gridMat.getRowCount());	
				console.log(prdComDNum);
			return console.log("지시일련이 없어서 자재등록이 안됌");
		}
		//자재수량 없으면 저장막기
		rowsNo = [];
		rowsNo = gridMat.findRows((row) => {
		    return (row.matVol == '');
		});
		if(rowsNo.length > 0) {
			$.toast({ 
				  text : "자재수량을 입력해주세요.", 
				  showHideTransition : 'slide',
				  bgColor : 'tomato',
				  textColor : 'white',
				  allowToastClose : false,
				  hideAfter : 2000,
				  stack : 1,
				  textAlign : 'center',
				  position : 'top-center'
				});
			return null;
		}
		
		let gridDataM = gridMat.getModifiedRows({});
		
		gridDataM["produceCommandDVO"] = {
				prdComDNum : prdComDNum,
				matCode : matCode
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
				//토스트메시지 
				$.toast({ 
				  text : "작업자재 저장에 성공했습니다.", 
				  showHideTransition : 'slide',
				  bgColor : 'Limegreen',
				  textColor : 'white',
				  allowToastClose : false,
				  hideAfter : 2000,
				  stack : 1,
				  textAlign : 'center',
				  position : 'top-center'
				});
			}
		});
		gridMat.resetData(getComMatList());
		
		//출고여부가 Y면 체크박스를 막아 삭제못하게
		rowsY = grid.findRows((row) => {
		    return (row.matOutChk == 'Y');
		});
		console.log("rowY");
		console.log(rowsY);
		for(let i in rowsY) {
			grid.disableRowCheck(rowsY[i].rowKey);
			grid.disableRow(rowsY[i].rowKey);
		}
	}
	
	//자재 출고 관리
	outMatLotBtn.onclick = function() {
		if($('#outMatLotBtn').hasClass('disabled')) {
			console.log("초건에 걸렸음");
			return null;
		}
		if(gridMat.getRowCount() < 1){
			console.log(gridMat.getRowCount());
			//토스트메시지 
			$.toast({ 
				  text : "출고할 자재가 없습니다.", 
				  showHideTransition : 'slide',
				  bgColor : 'tomato',
				  textColor : 'white',
				  allowToastClose : false,
				  hideAfter : 2000,
				  stack : 1,
				  textAlign : 'center',
				  position : 'top-center'
				});
			return null;
		}
		if(gridMat.isModified()) {
			//수정사항이 있는경우
			//토스트메시지 
			$.toast({ 
				  text : "변경사항이 저장되지 않았습니다.", 
				  showHideTransition : 'slide',
				  bgColor : 'tomato',
				  textColor : 'white',
				  allowToastClose : false,
				  hideAfter : 2000,
				  stack : 1,
				  textAlign : 'center',
				  position : 'top-center'
				});
			return false;
		}
		
		//지시량이랑 자재수량 비교해서 자재가 지시량보다 적으면 alert return하기
		let vols = gridMat.getColumnValues('matVol');
		let sum = 0;
		for(let i in vols) {
			sum = sum + parseInt(vols[i]);
		}
		console.log(prdComVol.value);
		console.log(sum);
		if(parseInt(prdComVol.value) > sum) {
			//토스트메시지 
			$.toast({ 
				  text : "자재수량이 지시량보다 적습니다.", 
				  showHideTransition : 'slide',
				  bgColor : 'tomato',
				  textColor : 'white',
				  allowToastClose : false,
				  hideAfter : 2000,
				  stack : 1,
				  textAlign : 'center',
				  position : 'top-center'
				});
			return null;
		}
		//저장안된 수정사항이 없는지 체크하고 이미 출고된 녀셕은 못하게 하고 수행하기
		//1. 지시디테일 출고여부 Y로 업데이트, 2. 자재입출반관리 출고 추가, 3.자재현재고 -업데이트, 4.공정실적관리 생성
		let gridDataMO = {};
		gridDataMO["matRows"] = gridMat.getData({});
		gridDataMO["flowRows"] = gridFlow.getData({});
		console.log(gridDataMO);
		let prcName = gridFlow.getValue(0,"prcName");
		gridDataMO["produceCommandDVO"] = {
				prdComDNum : prdComDNum,
				matHisVol : gridMat.getRowCount(),
				prcName : prcName,
				itmCode : itmCode
				}
		console.log(gridDataMO);
		
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
				//토스트메시지 
				$.toast({ 
				  text : "출고되었습니다.", 
				  showHideTransition : 'slide',
				  bgColor : 'Limegreen',
				  textColor : 'white',
				  allowToastClose : false,
				  hideAfter : 2000,
				  stack : 1,
				  textAlign : 'center',
				  position : 'top-center'
				});
			}
		});
		prdComDNum1 = null;
		grid.resetData(getList());
		outMatLotBtn.classList.add('btn-disabled');
		outMatLotBtn.classList.add('disabled');
		
		//출고후 그리드 수정 및 삭제 불가 처리
		gridMat.disable();
		//출고여부가 Y면 체크박스를 막아 삭제못하게
		rowsY = grid.findRows((row) => {
		    return (row.matOutChk == 'Y');
		});
		console.log("rowY");
		console.log(rowsY);
		for(let i in rowsY) {
			grid.disableRowCheck(rowsY[i].rowKey);
			grid.disableRow(rowsY[i].rowKey);
		}
	}
	
	// 작업지시 조회 모달창 팝업 버튼
	$('#comMadalBtn').click(function() {
		$("#searchComModal").modal("toggle");
		$("#searchComModal").on('shown.bs.modal', function () {
			grid2.refreshLayout();
			grid2.clear();
		});
	})
	
	// 작업지시 조회 모달 검색 버튼
	$('#searchComBtn').click(function() {
		startDate = $('#startD').val();
		endDate = $('#endD').val();
		prdComNum1 = null;
		console.log(startDate);
		console.log(endDate);
		grid2.resetData(getPrdComList());
	});
	
	// 제품코드를 입력할 때 제품명 확인을 위한 모달에 사용되는 그리드
	const grid3 = new tui.Grid({
	    el: document.getElementById('grid3'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: getItemList(),
	    rowHeaders: [{
	            type: 'checkbox',
	            header: ' '
	    }],
	    columns: [
	    	{ 
	    		header: '제품코드', 
	    		name:'itmCode',
	    		align: 'center'
	    		},
			{ 
	    		header: '제품명', 
	    		name:'itmName',
	    		align: 'center'
	    		}
	    ]
	}); 
	
	// 제품코드 입력 모달창 제품 테이블 Select 데이터
	function getItemList() {
		let data;
		$.ajax({
			async: false,
			cache: false,
			url : "ItemList",
			type : "get",
			data : {
				itmCode1 : itmCode1
				},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					itmCode1 = result[result.length -1].itmCode;
				}
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	// 선택한 제품코드 값만 받아오기
	function selectItem(itmCode) {
		let data;
		$.ajax({
			async: false,
			cache: false,
			url : "SelectItem",
			type : "get",
			data : {
				itmCode : itmCode
				},
			dataType: "json",
			success : function(result){
				grid.setValue(rowKey, 'itmCode', result.itmCode);
				grid.setValue(rowKey, 'itmName', result.itmName);
				grid.setValue(rowKey, 'matCode', result.matCode);
				grid.setValue(rowKey, 'matName', result.matName);
				grid.setValue(rowKey, 'uph', result.itmDayOutput/8);
				grid.setValue(rowKey, 'itmDayOutput', result.itmDayOutput);
				data = result;
			} // end success
		}); // end ajax
		return data;
	}
	
	// 제품코드 입력란 더블클릭 시 제품코드별 제품명을 볼 수 있는 모달창 생성
	grid.on('dblclick', (e) => {
		var selectItm = grid.getFocusedCell();
		if(getKeyByValue(selectItm, "itmCode") != null){
			$('#itmModal').modal('toggle');
			$('#itmModal').on('shown.bs.modal', function(){
				rowKey = e['rowKey'];
				grid3.refreshLayout();
			});
		}
	});
	
	// 제품코드 모달창 단일 체크 구현
	grid3.on('check', (e) => {
		let rows = grid3.getCheckedRowKeys();
		if(rows.length > 1) {
			for(let i in rows){
				if(e.rowKey != rows[i]){
					grid3.uncheck(rows[i]);
				}
			}
			rows = grid3.getCheckedRowKeys();
		}
		// 제품코드 모달창 제품코드 체크 로우 값 확인 클릭시 디테일 테이블 로우 데이터 값 수정
		$('#itmCheckSearchBtn').click(function() {
			$('#itmModal').modal("hide");
			itmCode = grid3.getValue(rows, 'itmCode');
			grid.blur();
			selectItem(itmCode);
		})
	});

	// 제품코드 모달창 제품코드 더블클릭 시 디테일 테이블 로우 데이터 값 수정
	grid3.on('dblclick', (e) => {
		var selectItm = grid.getFocusedCell();
		if(getKeyByValue(selectItm, "itmCode") != null){
			$('#itmModal').modal("hide");
			let selectItm = grid3.getFocusedCell();
			itmCode = selectItm.value;
			grid.blur();
			selectItem(itmCode);
		}
	});
	
	//초기화 함수
	function reset() {
		// 이전 데이터들 초기화
		grid.clear();
		gridMat.clear();
		gridFlow.clear();
		$('#itmCode').val('');
		$('#itmName').val('');
		$('#prdComVol').val('');
		$('#matCode').val('');
		$('#matName').val('');
		$('#operName').val('');
		//지시번호, 작성일자, 지시명, 특이사항 리셋
		$('#prdComNum').val('');
		$('#prdComDate').val('');
		$('#prdComName').val('');
		$('#prdComNote').val('');
		prdComNum = null;
		prdComDNum = null;
		matRowKey = null;
	}
	//리셋기능
	resetBtn.onclick = function() {
		reset();
	}
	
})

</script>
</head>
<body>

	<!-- 생산지시관리 Title  -->
	<div class="page-header">
		<div class="page-block">
			<div class="row align-items-center">
				<div class="col-md-8">
					<div class="page-header-title">
						<h5 class="m-b-10">생산지시관리</h5>
					</div>
				</div>
				<div class="col-md-4">
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="/comp"> <i
								class="fa fa-home"></i>
						</a></li>
						<li class="breadcrumb-item">생산관리</li>
						<li class="breadcrumb-item">생산지시관리</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 생산지시관리 Title  -->

	<div class="pcoded-inner-content">
		<div class="main-body">
			<div class="page-wrapper">
				<div class="text-right">
					<button type="button" class="btn btn-info" id="comMadalBtn">조회</button>
					<button type="button" class="btn btn-info" id="resetBtn">새자료</button>
					<button type="button" class="btn btn-info" id="saveBtn">저장</button>
					<button type="button" class="btn btn-info" id="removeBtn">삭제</button>
				</div>
				<br />
				<div class="row">
					<div class="col-xl-12">
						<div class="row">
							<div class="col-md-6" style="z-index: 200">
								<div class="card">
								<input type="hidden" id="prdComNum" />
									<table class="table">
										<tr>
											<th>작성일자*</th>
											<td>
												<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
													<input type="text" id="prdComDate" name="prdComDate"
														class=" form-control" aria-label="Date-Time" style="width: 150px;"/> 
													<span class="tui-ico-date"></span>
												</div>
												<div id="date" style="margin-top: -1px;"></div>
											</td>
										</tr>
										<tr>
											<th>작업지시명*</th>
											<td><input type="text" class="form-control" id="prdComName"></input></td>
										</tr>
										<tr>
											<th>특이사항</th>
											<td><input type="text" class="form-control" id="prdComNote"></input></td>
										</tr>
									</table>
								</div>
							</div>
							<div class="col-md-6" style="z-index: 150">
								<div class="card">
									<table class="table">
										<tr>
											<td class="pt-3">
												<h5>생산계획 조회</h5>
											</td>
										</tr>
										<tr>
											<td class="pt-3 pb-3">
												<div class="row align-items-center text-center col-lg-12 pt-3 pb-3 mb-3">
													<div style="padding-left: 15px; padding-bottom: 10px;">작업일자</div>
													<div
														class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
														<input class="form-control w-25" id="startpicker-input"
															type="text" aria-label="Date" /> 
														<span class="tui-ico-date"></span>
														<div id="startpicker-container" style="margin-left: -1px;"></div>
													</div>
													<label class="col-form-label text-center"> ~ </label>
													<div
														class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
														<input class="form-control w-25" id="endpicker-input"
															type="text" aria-label="Date" /> <span
															class="tui-ico-date"></span>
														<div id="endpicker-container" style="margin-left: -1px;"></div>
													</div>
													<button type="button" id="searchPlnBtn"
														class="btn btn-info btn-sm">불러오기</button>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<div class="card pt-3" style="margin-bottom:0;">
							<div class="row">
								<div class="col-sm-6">
									<div class="ml-3 mt-2"><p class="font-weight-bold" style="font-size:15px">생산지시 내역</p></div>
								</div>
								<div class="col-sm-6 text-right pb-3">
									<button
										class="btn btn-sm btn-info waves-effect waves-light"
										type="button" id="insertBtn">추가</button>
									<button
										class="btn btn-sm btn-info waves-effect waves-light mr-3"
										type="button" id="deleteBtn">삭제</button>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12" style="z-index: 100">
									<div id="grid"></div>
								</div>
							</div>
						
							<div class="row">
								<div class="col-xl-7 col-lg-12">
									<label class="ml-3 d-inline">자재코드</label> <input type="text"
										class="form-control ml-3 d-inline" id="matCode" name="matCode"
										style="width: 100px" readonly></input> <label
										class="ml-3 d-inline">자재명</label> <input type="text"
										class="form-control ml-3 d-inline" id="matName" name="matName"
										style="width: 100px" readonly></input>
								</div>
								<div class="col-xl-5 col-lg-12">
									<label class="ml-3 d-inline">제품코드</label> <input type="text"
										class="form-control ml-3 d-inline" id="itmCode" name="itmCode"
										style="width: 100px" readonly></input> <label
										class="ml-3 d-inline">제품명</label> <input type="text"
										class="form-control ml-3 d-inline" id="itmName" name="itmName"
										style="width: 100px" readonly></input>
								</div>
							</div>
							<div class="row">
								<div class="col-xl-7 col-lg-12 row text-right" style="margin-right:15px;">
									<div class="col-sm-8"></div>
									<div class="col-sm-4 text-right" style="padding-left: 0px">
										<button type="button" id="outMatLotBtn"
											class="btn btn-sm btn-info btn-disabled disabled waves-effect waves-light">출고</button>
										<button type="button" id="searchMatLotBtn"
											class="btn btn-sm btn-info waves-effect waves-light">검색</button>
										<button type="button" id="deleteMBtn"
											class="btn btn-sm btn-info waves-effect waves-light">삭제</button>
									</div>
								</div>
								<div class="col-xl-5 col-lg-12">
									<label class="ml-3  d-inline">고객사명</label> <input type="text"
										class="form-control ml-3  d-inline" id="operName"
										name="operName" style="width: 100px" readonly></input> <label
										class="ml-3  d-inline">지시량</label> <input type="text"
										class="form-control ml-3  d-inline" id="prdComVol"
										name="prdComVol" style="width: 100px" readonly></input>
								</div>
							</div>
							<div class="row">
								<div class="col-xl-7 col-lg-12" style="padding-right:0;">
									<div id="gridMat"></div>
								</div>
								<div class="col-xl-5 col-lg-12" style="padding-left:0;">
									<div id="gridFlow"></div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 작업지시서 검색 모달 -->
	<div class="modal fade" id="searchComModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">작업지시서 검색</h3>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						&times;
					</button>
				</div>
				<div class="modal-body">
					<div class="">
						<div
							class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3 d-inline-block">
							<input type="text" id="startD" class=" form-control w-25"
								aria-label="Date-Time" /> <span class="tui-ico-date"></span>
							<div id="start-container" style="margin-left: -1px;"></div>
						</div>

						<label class="col-form-label text-center"> ~ </label>
						<div
							class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3 d-inline-block">
							<input type="text" id="endD" class=" form-control w-25"
								aria-label="Date-Time" /> <span class="tui-ico-date"></span>
							<div id="end-container" style="margin-left: -1px;"></div>
						</div>
						<button type="button" id="searchComBtn"
							class="btn btn-sm btn-info waves-effect waves-light">검색</button>
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
					<h3 class="modal-title" id="matModalLabel">자재LOT NO 검색</h3>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						&times;
					</button>
				</div>
				<div class="modal-body">
					<div class="">
						LOT NO <input type="text" class="form-control ml-3 w-50"
							id="lotNum" name="lotNum"></input>
						<button type="button" id="searchLotNumBtn"
							class="btn btn-sm btn-info waves-effect waves-light">검색</button>
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
	
	<!-- 제품코드 선택 모달 -->
	<div class="modal fade" id="itmModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="myModalLabel">제품 조회</h3>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						&times;
					</button>
				</div>
				<div class="modal-body">
					<div id="grid3"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="itmCheckSearchBtn">확인</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
