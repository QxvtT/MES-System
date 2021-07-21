<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator"
	uri="http://www.springmodules.org/tags/commons-validator"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	/**
* @Class Name : ItemHistoryRegister.jsp
* @Description : ItemHistory Register 화면
* @Modification Information
* 
* @author seongwon
* @since 2021-06-29
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


<title><c:out value="${registerFlag}" /></title>
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<script
	src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>

<script type="text/javaScript" language="javascript" defer="defer">

// 전체주문페이지 
let itmHisDNum = null;
let itmHisDNum1 = null;
let itmHisRdy = null;
let operCode = null;

// 모달 검색 
let aDate = null;
let bDate = null;
let test = null;
let ordDNum = null;
let itmHisNum = null;
let itmHisNum1 = null;
let oldVal;
let newVal;
let key =0;
let itmCode1 = null;
let ordNum1 =null;
let ordNum =null;
let ordADate = null;
let ordBDate = null;
let date = null;

//주문일련 계획일련 있는 row들 담을 변수
let rows = null;

$(function(){
	const grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: null,
	    rowHeaders: ['rowNum','checkbox'],
	  
	    columns: [
			{ header: '제품코드', name:'itmCode',editor:"text"},
			{ header: '제품명', name:'itmName'},
			{ header: '규격', name:'itmSize'},
			{ header: '단위', name:'itmUnit'},
			{ header: '주문량', name:'ordVol'},
			{ header: '기출고량', name:'ordOutVol'},
			{ header: '미출고량', name:'itmNoutVol'},
			{ header: '출고량', name:'itmVol',editor:"text"},
			{ header: '현재고', name:'itmStock'},
			{ header: '자재LOT_NO', name:'lotNum',editor:"text"},
			{ header: '단가', name:'itmPrice',
				onAfterChange(e) {
				console.log(e)
				grid.setValue(e.rowKey, 'totalPrice', e.value * grid.getValue(e.rowKey, 'itmVol'));},editor:"text"},
			{ header: '금액', name:'totalPrice'},
			{ header: '비고', name:'itmNoteD',editor:"text"}
	    ]
	}); // end const grid
	grid.on('scrollEnd', () => {
	    grid.appendRows(getList());
	  })
	  
	function getList() { 
		let data;
		$.ajax({ 
			async: false, 
			url : "ItemHistoryRegist",
			type : "get",
			data : {
  				 itmHisDNum1 : itmHisDNum1
  				,itmHisRdy : itmHisRdy
  				,operCode : operCode
  				,itmHisNum : itmHisNum
  				,ordNum : ordNum
				},
			dataType: "json",
			success : function(result){
						if(result.length > 0) {
							itmHisDNum1 = result[result.length -1].itmHisDNum;
							}
						console.log(result);
						if(result.length !=0){
						$( 'input#itmHisRdy' ).val(result[0]['itmHisRdy']);
						$( 'input#operCode' ).val(result[0]['operCode']);
						$( 'input#itmNote' ).val(result[0]['itmNote']);
						$( 'input#itmHisNum' ).val(result[0]['itmHisNum']);
						$( 'input#operName' ).val(result[0]['operName']);
						$( 'input#ordNum' ).val(result[0]['ordNum']);
						}
						data = result;
						} // end success
		}); // end ajax 
		return data;
	}
		

	$('#mobile-collapse').click(function() {
	      grid.refreshLayout();
	   });
	//리셋버튼 그리드 인풋 초기화
	reset.onclick = function() {
		itmHisNum = null;
		ordNum = null;
		let list = [];
		grid.resetData(list);
	}
// 출고번호검색 모달
	const grid2 = new tui.Grid({
		
		el: document.getElementById('grid2'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: null,
	    rowHeaders: ['rowNum', {type : 'checkbox',header: ' '}],
	    columns: [
			 { header: '출고일자', name:'itmHisRdy'}
			,{ header: '전표번호', name:'itmHisNum'}
			,{ header: '업체명', name:'operName'}
			,{ header: '제품명', name:'itmName' }
			,{ header: '비고', name:'itmNote' }
	
	    ]
	});
	//출고번호검색
	function getItemHisNumList() {
		let data;
		$.ajax({
			async: false,
			url : "ItemHisNumList",
			type : "get",
			data : {
				 aDate : aDate
				,bDate : bDate
				,itmHisNum1: itmHisNum1
				},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					itmHisNum1 = result[result.length -1].itmHisNum;
				}
				console.log(result);
				data = result;
				
			} // end success
		}); // end ajax 
		return data;
	} 
	
	grid2.on('scrollEnd', () => {
	    grid2.appendRows(getItemHisNumList());
	  })
	  //검색버튼
	$('#searchHisBtn').click(function(){
		itmHisNum1 = null;
		grid2.resetData(getItemHisNumList());
		$("#myModal").on('shown.bs.modal', function () {
			grid2.refreshLayout();
		});
		hisNumSearch.onclick = function() {
			itmHisNum1 = null;
			aDate = $(".modal-body").find('input[name="aDate"]').val();
			bDate = $(".modal-body").find('input[name="bDate"]').val();

			grid2.resetData(getItemHisNumList());
		}
		hisNumSearchReset.onclick = function() {
			itmHisNum1 = null;
			aDate = null;
			bDate = null;
			grid2.resetData(getItemHisNumList());
		}
		
		hisNumY.onclick=function() {
			itmHisNum = grid2.getCheckedRows()[0]['itmHisNum'];
			itmHisDNum1 = null;
			ordNum = null;
			grid.resetData(getList());
			
			// 주문일련이나 계획일련이 있는 row 구하기
			rows = grid.findRows((row) => {
			    return (row.ordNum != null);
			});
		}
		
	})
	
	
	insert.onclick = function() {
		grid.appendRow();
	}
	
	save.onclick = function() {

	
		
		
		let size = grid.getData().length;
		for(let i =0; i<size; i++){
			let itmVol = grid.getData()[i]['itmVol'];
			itmVol *=1;
			if(grid.getData()[i]['itmNoutVol']<itmVol || grid.getData()[i]['itmStock'] < itmVol || itmVol ==0){
				$.toast({ 
					  text : "출고수량을 확인해주세요", 
					  showHideTransition : 'slide',
					  bgColor : 'red',
					  textColor : 'white',
					  allowToastClose : false,
					  hideAfter : 2000,
					  stack : 1,
					  textAlign : 'center',
					  position : 'top-center'
					});
				return null;
			}
		}
		
		for(let i =0; i<size; i++){
			let itmPrice = grid.getData()[i]['itmPrice'];
			itmPrice *=1;
			if(itmPrice == 0){
				$.toast({ 
					  text : "단가를 입력해주세요", 
					  showHideTransition : 'slide',
					  bgColor : 'red',
					  textColor : 'white',
					  allowToastClose : false,
					  hideAfter : 2000,
					  stack : 1,
					  textAlign : 'center',
					  position : 'top-center'
					});
				return null;
			}
		}
		for(let i =0; i<size; i++){
		
			if(grid.getData()[i]['lotNum'] == '' || grid.getData()[i]['lotNum'] == null ){
				$.toast({ 
					  text : "단가를 입력해주세요", 
					  showHideTransition : 'slide',
					  bgColor : 'red',
					  textColor : 'white',
					  allowToastClose : false,
					  hideAfter : 2000,
					  stack : 1,
					  textAlign : 'center',
					  position : 'top-center'
					});
				return null;
			}
		}
		for(let i =0; i<size; i++){
			
			if(grid.getData()[i]['itmCode'] == '' || grid.getData()[i]['itmCode'] == null ){
				$.toast({ 
					  text : "단가를 입력해주세요", 
					  showHideTransition : 'slide',
					  bgColor : 'red',
					  textColor : 'white',
					  allowToastClose : false,
					  hideAfter : 2000,
					  stack : 1,
					  textAlign : 'center',
					  position : 'top-center'
					});
				return null;
			}
		}
		if($("#itmHisRdy").val()==""){
			$.toast({ 
				  text : "출고일자를 입력해주세요.", 
				  showHideTransition : 'slide',
				  bgColor : 'red',
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
			gridData["itemHistoryVO"] ={
										itmHisRdy : $("#itmHisRdy").val()
									   ,ordNum : $("#ordNum").val()
									   ,itmHisNum : $("#itmHisNum").val()
									   ,operCode : $("#operCode").val()
									   ,itmNote : $("#itmNote").val()
										};
			$.ajax({
					async: false, 
					url : "ItemHistoryUpdate",
					type : "post",
					data : JSON.stringify(gridData),
					dataType: "json",
					contentType:"application/json",
					success : console.log("updatesuccess")
					
					});
			if($( 'input#itmHisNum' ).val()==null || $( 'input#itmHisNum' ).val()==""){
				$.ajax({
					async: false,
					url : "getItmHisNum",
					type : "get",
					data : {
						ordNum : $('input#ordNum' ).val()
						},
					dataType: "json",
					success : function(result){
						itmHisNum = result[0]['itmHisNum'];
						$( 'input#itmHisRdy' ).val(result[0]['itmHisRdy']);
						$( 'input#operCode' ).val(result[0]['operCode']);
						$( 'input#itmNote' ).val(result[0]['itmNote']);
						$( 'input#itmHisNum' ).val(result[0]['itmHisNum']);
						$( 'input#operName' ).val(result[0]['operName']);
						$( 'input#ordNum' ).val(result[0]['ordNum']);
					} // end success
				});
				
			
		}
			itmHisDNum1=null;
			grid.resetData(getList());
			grid2.resetData(getItemHisNumList());
	}
	
	deleteItm.onclick = function() {
		let size = grid.getCheckedRows().length;
		if(size == 0){
			$.toast({ 
				  text : "삭제할 데이터가 없습니다.", 
				  showHideTransition : 'slide',
				  bgColor : 'red',
				  textColor : 'white',
				  allowToastClose : false,
				  hideAfter : 2000,
				  stack : 1,
				  textAlign : 'center',
				  position : 'top-center'
				});
			return null;
		}
		
		for(let i =0; i<size; i++){
		let delHisDNum = grid.getCheckedRows()[i]['itmHisDNum'];
		delHisDNum *=1;
		
			
		}
		grid.removeCheckedRows();
		
		
	}
	
	
	
	
	// 주문일련이나 계획일련이 있으면 제품번호 수정 못하게 막는 function
	grid.on('dblclick', (e) => { 
// 		let check = false;
// 		if(e.columnName == "itmCode") {
			
// 			for(let i=0; i<rows.length; i++) {
// 				if(e.rowKey == rows[i].rowKey) {
// 					check = true;
// 					e.stop();
// 				}
// 			}
// 		}
// 		if(!check) {
	itmCode1 = null;
			key = grid.getFocusedCell()['rowKey'];
			if(grid.getFocusedCell()['columnName'] == "itmCode"){
				grid3.resetData(setItemCode());
				$('#selectItemCode').modal('toggle');
				$('#selectItemCode').on('shown.bs.modal', function(){
					 grid3.refreshLayout();
						itmCodeY.onclick=function() {
							grid.focusAt(0,1,false);
							grid.setValue(key,'itmCode',grid3.getCheckedRows()[0]['itmCode']);
							grid.setValue(key,'itmName',grid3.getCheckedRows()[0]['itmName']);
							grid.setValue(key,'itmSize',grid3.getCheckedRows()[0]['itmSize']);
							grid.setValue(key,'itmUnit',grid3.getCheckedRows()[0]['itmUnit']);
							grid.setValue(key,'ordVol',grid3.getCheckedRows()[0]['ordVol']);
							grid.setValue(key,'ordOutVol',grid3.getCheckedRows()[0]['ordOutVol']);
							grid.setValue(key,'itmNoutVol',grid3.getCheckedRows()[0]['itmNoutVol']);
							grid.focusAt(key,7,false);
						}
				});
			}
			if(grid.getFocusedCell()['columnName'] == "lotNum" && grid.getData()[key]['itmCode'] != null && grid.getData()[key]['itmCode'] != "" && grid.getData()[key]['ordNum'] == null){
			grid4.resetData(setLotNum(grid.getData()[key]['itmCode']));
				$('#selectLotNum').modal('toggle');
				$('#selectLotNum').on('shown.bs.modal', function(){
					 grid4.refreshLayout();
					 lotNoY.onclick=function() {
							grid.focusAt(0,0,false);
							grid.setValue(key,'lotNum',grid4.getCheckedRows()[0]['lotNum']);
							grid.setValue(key,'itmStock',grid4.getCheckedRows()[0]['itmVol']);
							grid.focusAt(key,7,false);
						}
					 
					 
				});
			}
// 		}
		
	});
	


	

	const grid3 = new tui.Grid({
	    el: document.getElementById('grid3'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: setItemCode(),
	    rowHeaders: ['rowNum',{type : 'checkbox',header: ' '}],
	    columns: [
			{ header: '제품코드', name:'itmCode'},
			{ header: '제품명', name:'itmName'},
			{ header: '규격', name:'itmSize'},
			{ header: '단위', name:'itmUnit'},
			{ header: '주문량', name:'ordVol'}
	    ]
	});
	function setItemCode() {
		let data;
		$.ajax({
			async: false,
			url : "setItemCode",
			type : "get",
			data : {
				ordNum : $('input#ordNum' ).val(),
				itmCode1 : itmCode1
				},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					itmCode1 = result[result.length -1].itmCode;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	const grid4 = new tui.Grid({
	    el: document.getElementById('grid4'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: null,
	    rowHeaders: ['rowNum',{type : 'checkbox',header: ' '}],
	    columns: [
			{ header: '제품코드', name:'itmCode'},
			{ header: 'lot_no', name:'lotNum'},
			{ header: '재고', name:'itmVol'}
	    ]
	});
	function setLotNum(test) {
		let data;
		$.ajax({
			async: false,
			url : "setLotNum",
			type : "get",
			data : {
				itmCode : test
				},
			dataType: "json",
			success : function(result){
				console.log('lotNum');
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}

	$('#ordNum').on('dblclick', () => { 
		ordNum1 = null;
		grid5.resetData(setOrdNum());
		$('#selectOrdNum').modal('toggle');
		$('#selectOrdNum').on('shown.bs.modal', function(){
			grid5.refreshLayout();
			
			ordNumSearch.onclick = function() {
				date = $(".modal-body").find("input[name='date']:checked").val();
				ordADate = $(".modal-body").find('input[name="ordADate"]').val();
				ordBDate = $(".modal-body").find('input[name="ordBDate"]').val();
				grid5.resetData(setOrdNum());
			}
			ordNumSearchReset.onclick = function() {
				date = null;
				ordADate = null;
				ordBDate = null;
				grid5.resetData(setOrdNum());
			}
			ordNumY.onclick = function() {
				ordNum = grid5.getCheckedRows()[0]['ordNum'];
				$('input#ordNum' ).val(grid5.getCheckedRows()[0]['ordNum']);
				$('input#operCode' ).val(grid5.getCheckedRows()[0]['operCode']);
				$('input#operName' ).val(grid5.getCheckedRows()[0]['operName']);
				$( 'input#itmHisNum' ).val(null);
				$( 'input#itmNote').val(null);
				let list = [];
				grid.resetData(list);
				
			}
			
		})
	});
		const grid5 = new tui.Grid({
		    el: document.getElementById('grid5'),
		    scrollX: false,
		    scrollY: true,
		    bodyHeight: 200,
		    data: setOrdNum(),
		    rowHeaders: ['rowNum',{type : 'checkbox',header: ' '}],
		    columns: [
				{ header: '주문번호', name:'ordNum'},
				{ header: '주문일자', name:'ordRequestDate'},
				{ header: '납기일자', name:'ordDeliveryDate'},
				{ header: '업체명', name:'operName'}
		    ]
		});
		function setOrdNum() {
			let data;
			$.ajax({
				async: false,
				url : "setOrdNum",
				type : "get",
				data : {
					ordNum1 : ordNum1
					,ordADate : ordADate
					,ordBDate : ordBDate
					,date : date
					},
				dataType: "json",
				success : function(result){
					if(result.length > 0) {
						ordNum1 = result[result.length -1].ordNum;
					}
					console.log(result);
					data = result;
				} // end success
			}); // end ajax 
			return data;
		}
		grid5.on('scrollEnd', () => {
		    grid5.appendRows(setLotNum());
		  })
	grid2.on('check', (e) => {
		let rows = grid2.getCheckedRowKeys(); 
		if(rows.length > 1) { 
			for(let i in rows){ 
				if(e.rowKey != rows[i]){ 
					grid2.uncheck(rows[i]); 
					} 
				}
		}
	})
	grid3.on('check', (e) => {
		let rows = grid3.getCheckedRowKeys(); 
		if(rows.length > 1) { 
			for(let i in rows){ 
				if(e.rowKey != rows[i]){ 
					grid3.uncheck(rows[i]); 
					} 
				}
		}
	})
	grid4.on('check', (e) => {
		let rows = grid4.getCheckedRowKeys(); 
		if(rows.length > 1) { 
			for(let i in rows){ 
				if(e.rowKey != rows[i]){ 
					grid4.uncheck(rows[i]); 
					} 
				}
		}
	})
	grid5.on('check', (e) => {
		let rows = grid5.getCheckedRowKeys(); 
		if(rows.length > 1) { 
			for(let i in rows){ 
				if(e.rowKey != rows[i]){ 
					grid5.uncheck(rows[i]); 
					} 
				}
		}
	})
	grid5.on('scrollEnd', () => {
	    grid5.appendRows(getList());
	  })
})


</script>
</head>
<body>
<input type="hidden" id="test" name="test" value="test"/>
	<!-- Page-header start -->
	<div class="page-header">
		<div class="page-block">
			<div class="row align-items-center">
				<div class="col-md-8">
					<div class="page-header-title">
						<h5 class="m-b-10">출고관리</h5>
					</div>
				</div>
				<div class="col-md-4">
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.jsp"> <i
								class="fa fa-home"></i>
						</a></li>
						<li class="breadcrumb-item"><a href="#!">출고관리</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- Page-header end -->
	<div class="pcoded-inner-content">
	<div class="main-body">
	<div class="page-wrapper">
		<div class="row" >
			<div class="d-inline-block col-xl-12">
				<div class="card" >
					<form id="frm" name = "frm">
						<div style="margin: 10px">

					<table >
						<tr>
							<th>출고일자*</th>
							<td><input class="form-control" type="date" name="itmHisRdy" id="itmHisRdy"/>
						</tr>
						<tr>
							<th>주문번호*</th>
							<td><input class="form-control" type="text" name="ordNum" id="ordNum" readonly="readonly"/>
						</tr>
						<tr>
							<th>출고번호</th>
							<td><input class="form-control" type="text" name="itmHisNum" id="itmHisNum" readonly="readonly"/>
						</tr>
						<tr>
							<th>고객사코드*</th>
							<td><input  class="form-control" type="text" name="operCode" id="operCode" />
						</tr>
						<tr>
							<th>고객사명</th>
							<td><input class="form-control" type="text" name="operName" id="operName"  readonly="readonly" />
						</tr>
						<tr>
							<th>특이사항</th>
							<td><input class="form-control" type="text" name="itmNote" id="itmNote" />
						</tr>
						
						
					</table>
					<div align="left">
						<button type="button" class="btn btn-info btn-sm" id="searchHisBtn" data-toggle="modal" data-target="#myModal">검색</button>&nbsp;
					
					<button type="reset" class="btn btn-info btn-sm" id= "reset">새자료</button>
					</div>
			
		</div>
			</form>
			</div></div></div></div></div></div>

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
												<div align="right">
													<button  class="btn btn-info btn-sm" type="button" id="insert">추가</button>
													<button  class="btn btn-info btn-sm" type="button" id="deleteItm">삭제</button>
													<button type="button" class="btn btn-info btn-sm" id="save">저장</button>
												</div>
											</ul>
										</div>

										<div id="grid"></div>
									</div>
								</div>

							</div>
						</div>
					</div>
		</div>


	<!-- 출고번호 검색 모달 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">출고번호검색</h4>
					<button class="close" type="button" data-dismiss="modal"aria-label="Close">
						&times;
					</button>
				</div>
				<div class="modal-body" >
					<form>
						<div class="form-group row">
							<div class="col">
								출고일자<input type="date" name="bDate" /> ~ <input type="date" name="aDate" /><br> 
							</div>
						</div>
						<div class="col-md-3">
							<button type="button" class="btn btn-info btn-sm" id="hisNumSearch">검색</button>
							<button type="reset" class="btn btn-info btn-sm" id="hisNumSearchReset">초기화</button>
						</div>
					</form>
					<br />
					<div id="grid2"></div>
				</div>
				<div class="modal-footer">
					<a class="btn" id="hisNumY" data-dismiss="modal">예</a>
					<button class="btn" type="button" data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 출고번호 검색 모달 종료-->
	
	<!-- 제품코드 검색 해당 주문에 해당하는 제품코드 -->
	<div class="modal fade" id="selectItemCode" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">제품코드검색</h4>
					<button class="close" type="button" data-dismiss="modal"aria-label="Close">
						&times;
					</button>
				</div>
				<div class="modal-body" >
						<div class="form-group row">
						</div>
						<div class="col-md-3">
						</div>
					<br />
					<div id="grid3"></div>
				</div>
				<div class="modal-footer">
					<a class="btn" id="itmCodeY" data-dismiss="modal">예</a>
					<button class="btn" type="button" data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 제품코드 검색 종료-->
		<!-- 제품lotNO 검색 해당  제품에 해당하는 lotno -->
	<div class="modal fade" id="selectLotNum" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">lotNo 검색</h4>
					<button class="close" type="button" data-dismiss="modal"aria-label="Close">
						&times;
					</button>
				</div>
				<div class="modal-body" >
						<div class="form-group row">
						</div>
						<div class="col-md-3">
						</div>
					<br />
					<div id="grid4"></div>
				</div>
				<div class="modal-footer">
					<a class="btn" id="lotNoY" data-dismiss="modal">예</a>
					<button class="btn" type="button" data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>
	<!-- lotno 검색 종료-->
	
		<!-- 주문번호 검색 -->
	<div class="modal fade" id="selectOrdNum" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">주문번호검색</h4>
					<button class="close" type="button" data-dismiss="modal"aria-label="Close">
						&times;
					</button>
				</div>
				<div class="modal-body" >
						<form>
						<div class="form-group row">
							<div class="col">
								주문일자<input type ="radio" id="date" name = "date" value = "request" checked="checked"/>
								납기일자<input type ="radio" id="date" name = "date" value = "delivery"/><br/>
								<input type="date" name="ordBDate" /> ~ <input type="date" name="ordADate" /><br> 
							</div>
						</div>
						<div class="col-md-3">
							<button type="button" class="btn btn-info btn-sm" id="ordNumSearch">검색</button>&nbsp;&nbsp;
							<button type="reset" class="btn btn-info btn-sm" id="ordNumSearchReset" >초기화</button>
						</div>
						</form>
					<br />
					<div id="grid5"></div>
				</div>
				<div class="modal-footer">
					<a class="btn" id="ordNumY" data-dismiss="modal">예</a>
					<button class="btn" type="button" data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 주문번호 검색 종료-->
	
	


</body>
</html>