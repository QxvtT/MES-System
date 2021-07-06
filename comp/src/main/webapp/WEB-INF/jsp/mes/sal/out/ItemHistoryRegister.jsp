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

<c:set var="registerFlag"
	value="${empty itemHistoryVO.itmHisNum ? '등록' : '수정'}" />

<title><c:out value="${registerFlag}" /></title>
<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/sample.css'/>" />
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

let str = '';
let number = 0;

let data;

let oldVal;
let newVal;


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
  				,str : str
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
						number = result.length;
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
	
// 	모달
	const grid2 = new tui.Grid({
		
		el: document.getElementById('grid2'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: getItemHisNumList(),
	    rowHeaders: ['rowNum', 'checkbox'],
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
	modalY.onclick=function() {
		itmHisDNum = null;
		test = null;
		str = '';
		for(let i =0; i<grid2.getCheckedRows().length; i++) {
			if(i == grid2.getCheckedRows().length-1){
				str = str + grid2.getCheckedRows()[i]['itmHisNum'];
			}
			else{
				str = str + grid2.getCheckedRows()[i]['itmHisNum']+"' , '";
			}
		}
		console.log(str);
		console.log('======================');
	grid.resetData(getList());
	grid2.resetData(getItemHisNumList());
	
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
	
	
	$('#ordNum').on('dblclick', () => { 
		$('#ordNum').val('SO2106300026');
		
	});
	
	deleteItm.onclick = function() {
		grid.removeCheckedRows()
		console.log(grid.removeCheckedRows());
		
	}
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

										<!-- // 타이틀 -->
										<!-- List -->
										<div id="grid"></div>
									</div>
								</div>

							</div>
						</div>
					</div>
			
		</div>


	<!-- 주문코드 검색 모달 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">출고리스트검색</h4>
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
					<a class="btn" id="modalY" data-dismiss="modal">예</a>
					<button class="btn" type="button" data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 주쿤코드 검색 모달 종료-->


</body>
</html>





