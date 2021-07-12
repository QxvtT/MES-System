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
let itmHisRdy = null;
let operCode = null;

// 모달 검색 
let aDate = null;
let bDate = null;
let test = null;
let ordDNum = null;
let itmHisNum = null;

let data;

let oldVal;
let newVal;

let key =0;
let itmCode1 = null;
let ordNum1 =null;
let ordNum =null;

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
			{ header: '단가', name:'itmPrice',editor:"text"},
			{ header: '금액', name:'totalPrice',editor:"text"},
			{ header: '비고', name:'itmNoteD',editor:"text"}
	    ]
	}); // end const grid
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getList());
	  })
	  
	function getList() { 
		$.ajax({
			async: false, 
			url : "ItemHistoryRegist",
			type : "get",
			data : {
  				 itmHisDNum : itmHisDNum
  				,itmHisRdy : itmHisRdy
  				,operCode : operCode
  				,itmHisNum : itmHisNum
  				,ordNum : ordNum
				},
			dataType: "json",
			success : function(result){
						if(result.length > 0) {
							itmHisDNum = result[result.length -1].itmHisDNum;
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
		
	//조회버튼
	button.onclick = function(){
		itmHisDNum = null;
		test = null;
		ordNum = $( 'input#ordNum' ).val();
		grid.resetData(getList());
		grid2.resetData(getItemHisNumList());
		
		

	} 
	$('#mobile-collapse').click(function() {
	      grid.refreshLayout();
	   });
	
// 	주문번호 검색 모달
	const grid2 = new tui.Grid({
		
		el: document.getElementById('grid2'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: getItemHisNumList(),
	    rowHeaders: ['rowNum', {type : 'checkbox',header: ' '}],
	    columns: [
			 { header: '출고일자', name:'itmHisRdy'}
			,{ header: '전표번호', name:'itmHisNum'}
			,{ header: '업체명', name:'operName'}
			,{ header: '비고', name:'itmNote' }
	
	    ]
	});
	function getItemHisNumList() {
		if(test ==null && itmHisDNum !=null) {
		itmHisDNum = null;
		test = 'test';
		}
		let data2;
		$.ajax({
			async: false,
			url : "ItemHisNumList",
			type : "get",
			data : {
				 aDate : aDate
				,bDate : bDate
				,itmHisDNum: itmHisDNum
				
				},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					itmHisDNum = result[result.length -1].itmHisDNum;
				}
				console.log(result);
				data2 = result;
				
			} // end success
		}); // end ajax 
		return data2;
	} 
	
	grid2.on('scrollEnd', () => {
	    grid2.appendRows(getItemHisNumList());
	  })
	  
	$('#searchHisBtn').click(function(){
		$("#myModal").on('shown.bs.modal', function () {
			grid2.refreshLayout();
		});
	})
	ordNumSearch.onclick = function(){
		console.log('test')
		itmHisDNum = null;
		aDate = $(".modal-body").find('input[name="aDate"]').val();
		console.log(aDate)
		bDate = $(".modal-body").find('input[name="bDate"]').val();
		grid2.resetData(getItemHisNumList());
	}
	hisNumY.onclick=function() {
		itmHisDNum = null;
		itmHisNum = grid2.getCheckedRows()[0]['itmHisNum'];
		test = null;
		grid.resetData(getList());
		
		// 주문일련이나 계획일련이 있는 row 구하기
		rows = grid.findRows((row) => {
		    return (row.ordNum != null);
		});
	}
	
	insert.onclick = function() {
		grid.appendRow();
	}
	
	save.onclick = function() {
		itmHisDNum = null;
		test = null;
		console.log(grid.getModifiedRows({}));
		let gridData = grid.getModifiedRows({});
		gridData["itemHistoryVO"] ={
									itmHisRdy : $("#itmHisRdy").val()
								   ,ordNum : $("#ordNum").val()
								   ,itmHisNum : $("#itmHisNum").val()
								   ,operCode : $("#operCode").val()
								   ,itmNote : $("#itmNote").val()
									}
		$.ajax({
				async: false, 
				url : "ItemHistoryUpdate",
				type : "post",
				data : JSON.stringify(gridData),
				dataType: "json",
				contentType:"application/json",
				success : console.log("updatesuccess")
				});
		
		grid2.resetData(getItemHisNumList());
		
		
	}
	
	

	
	deleteItm.onclick = function() {
		grid.removeCheckedRows()
		console.log(grid.removeCheckedRows());
		
	}
	
	// 주문일련이나 계획일련이 있으면 제품번호 수정 못하게 막는 function
	grid.on('dblclick', (e) => { 
		let check = false;
		if(e.columnName == "itmCode") {
			
			for(let i=0; i<rows.length; i++) {
				if(e.rowKey == rows[i].rowKey) {
					check = true;
					e.stop();
				}
			}
		}
		if(!check) {
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
		}
		
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
					itmCode1 = result[result.length -1].itmCode1;
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
		grid5.resetData(setOrdNum());
		$('#selectOrdNum').modal('toggle');
		$('#selectOrdNum').on('shown.bs.modal', function(){
			grid5.refreshLayout();
			ordNumY.onclick = function() {
				$('input#ordNum' ).val(grid5.getCheckedRows()[0]['ordNum']);
				$('input#operCode' ).val(grid5.getCheckedRows()[0]['operCode']);
				$('input#operName' ).val(grid5.getCheckedRows()[0]['operName']);
				ordNum = grid5.getCheckedRows()[0]['ordNum'];
				$( 'input#itmHisNum' ).val(' ');
				$( 'input#itmNote').val(' ');
				itmHisDNum = null;
				itmHisNum = null;
				grid.resetData(getList());
				itmHisDNum = null;
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
					},
				dataType: "json",
				success : function(result){
					if(result.length > 0) {
						ordNum1 = result[result.length -1].ordNum1;
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
	
			<form id="frm" name="frm">
			
				<div id="table">
					<button type="button" class="btn btn-info btn-sm" id="searchHisBtn" data-toggle="modal" data-target="#myModal">검색</button>&nbsp;
					<button type="button" class="btn btn-info btn-sm" id="save">저장</button>
					<button type="reset" class="btn btn-info btn-sm" id= "reset">새자료</button>
					<table width="100%" border="1" cellpadding="0" cellspacing="0">
						<colgroup>
							<col width="150" />
							<col width="" />
						</colgroup>

						<c:if test="${registerFlag == '수정'}">
							<tr>
								<th>ITM_HIS_NUM *</th>
								<td><input type ="text" name ="itmHisNum" id = "itmHisNum"/></td>
							</tr>
							
						</c:if>
						<tr>
							<th>출고일자</th>
							<td><input type="date" name="itmHisRdy" id="itmHisRdy"/>
						</tr>
						<tr>
							<th>주문번호</th>
							<td><input type="text" name="ordNum" id="ordNum" readonly="readonly"/>
						</tr>
						<tr>
							<th>출고번호</th>
							<td><input type="text" name="itmHisNum" id="itmHisNum" readonly="readonly"/>
						</tr>
						<tr>
							<th>고객사코드</th>
							<td><input type="text" name="operCode" id="operCode" />
						</tr>
						<tr>
							<th>고객사명</th>
							<td><input type="text" name="operName" id="operName"  readonly="readonly" />
						</tr>
						<tr>
							<th>특이사항</th>
							<td><input type="text" name="itmNote" id="itmNote" />
						</tr>
						
						
					</table>
					<button type="button" id="button" name="button">조회</button>
				</div>
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
												<div align="right">
													<button type="button" id="insert">추가</button>
													<button type="button" id="deleteItm">삭제</button>
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
						<div class="form-group row">
							<div class="col">
								납기일자<input type="date" name="bDate" /> ~ <input type="date" name="aDate" /><br> 
							</div>
						</div>
						<div class="col-md-3">
							<button type="button" class="btn btn-info btn-sm" id="ordNumSearch">검색</button>
						</div>
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
	<!-- 주쿤코드 검색 모달 종료-->
	
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
						<div class="form-group row">
						</div>
						<div class="col-md-3">
							<button type="button" class="btn btn-info btn-sm" id="ordNumSearch">검색</button>
						</div>
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