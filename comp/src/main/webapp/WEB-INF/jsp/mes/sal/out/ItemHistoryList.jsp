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
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<script
	src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
let itmHisDNum = null;
let aDate = null;
let bDate = null;
let operCode = null;
$(function(){
	const grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: getList(),
	    rowHeaders: ['rowNum'],
	    columns: [
	    	{ header: '전표번호', name:'itmHisNum'},
			{ header: '주문번호', name:'ordNum'},
			{ header: '구분', name:'itmDiv'},
			{ header: '출고일자', name:'itmHisRdy'},
			{ header: '특이사항', name:'itmNote'},
			{ header: '제품코드', name:'itmCode'},
			{ header: '자재LOT_NO', name:'lotNum'},
			{ header: '수량', name:'itmVol'},
			{ header: '단가', name:'itmPrice'},
			{ header: '금액', name:'totalPrice'},
			{ header: '비고', name:'itmNoteD'}
	    ]
	}); // end const grid
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getList());
	  })
	function getList() { 
		let data;
		$.ajax({
			async: false, 
			url : "ItemHistoryList",
			type : "get",
			data : {
  				operCode: operCode,
  				itmHisDNum : itmHisDNum
				},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					itmHisDNum = result[result.length -1].itmHisDNum;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	button.onclick = function(){
		itmHisDNum = null;
		operCode = $( 'input#operCode' ).val();
		grid.resetData(getList());
		console.log(operCode);
	}
	
	$('#mobile-collapse').click(function() {
	      grid.refreshLayout();
	   });
	
	const grid2 = new tui.Grid({
		el: document.getElementById('grid2'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: getItemHisNumList(),
	    rowHeaders: ['rowNum'],
	    columns: [
	    	{ header: '자재코드', name:'itmHisNum'},
			{ header: '출고일자', name:'itmHisRdy'},
			{ header: '업체명', name:'operName'},
			{ header: '자재명', name:'itmName'},
			{ header: '  ', name:'checkbox'}
	    ]
	});
	function getItemHisNumList() {
		itmHisDNum = null;
		console.log('tttt');
		let data2;
		$.ajax({
			async: false,
			url : "ItemHisNumList",
			type : "get",
			data : {
				aDate : aDate,
  				bDate : bDate,
				itmHisDNum: itmHisDNum
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
	$('#searchHisNumBtn').click(function(){
		$("#myModal").modal("toggle");
		$("#myModal").on('shown.bs.modal', function () {
			console.log(aDate);
			grid2.refreshLayout(getItemHisNumList());
		});
	});
	
	HisNumSearch.onclick = function(){
		itmHisDNum = null;
		bDate = $("#modal-body").find('input[name="bDate"]').val();
		aDate = $("#modal-body").find('input[name="aDate"]').val();
		grid2.resetData(getItemHisNumList());
		console.log(bDate);
		console.log('aaaaa');
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
						<h5 class="m-b-10">출고조회</h5>
					</div>
				</div>
				<div class="col-md-4">
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.jsp"> <i
								class="fa fa-home"></i>
						</a></li>
						<li class="breadcrumb-item"><a href="#!">출고조회</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- Page-header end -->
	
	
	<button type="button" class="btn btn-info btn-sm"
			id="searchHisNumBtn" data-toggle="modal" data-target="#myModal">검색</button>
	<form id="frm" name="frm">
		날짜<input type="date" id="bDate" name=""bDate"" ></input>~<input
			type="date" id="aDate" name="aDate"></input><br> 업체<input
			type="text" id="operCode" name="operCode"></input><br>
		<button type="button" id="button" name="button">조회</button>
	</form>

	<form:form commandName="searchVO" name="listForm" id="listForm"
		method="post">
		<input type="hidden" name="itmHisDNum" />
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
	</form:form>



	<!-- 출고번호 검색 모달 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">출고 검색</h4>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						&times;
					</button>
				</div>
				<div class="modal-body" id= "modal-body" name ="modal-body">
					<form id="matCodeSearch" name="matCodeSearch" method="post"
						action="OrderNumList" onsubmit="return false">
						<div class="form-group row">
							<div class="col" id="test">
								출고일자<input type="date" name="bDate"/>~<input type="date" name="aDate"/>
							</div>
						</div>
						<div class="col-md-3">
							<button type="button" class="btn btn-info btn-sm"
								id="HisNumSearch" name ="HisNumSearch">검색</button>
						</div>
					</form>
					<br />
					<div id="grid2"></div>
				</div>
				<div class="modal-footer">
					<a class="btn" id="modalY" href="#">예</a>
					<button class="btn" type="button" data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
