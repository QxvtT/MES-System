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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/printThis/1.15.0/printThis.min.js"
	integrity="sha512-d5Jr3NflEZmFDdFHZtxeJtBzk0eB+kkRXWFQqEc1EKmolXjHm2IKCA7kTvXBNjIYzjXfD5XzIjaaErpkZHCkBg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javaScript" language="javascript" defer="defer">

let prdDate = null;
$(function(){
	const grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 500,
	    rowWidth: 100,
	    data: null,
	    columns: [
	    	{ header: '계획일자', name:'prdDate'},
	    	{ header: '고객사명', name:'operName'},
	    	{ header: '제품코드', name:'itmCode'},
			{ header: '제품명', name:'itmName'},
			{ header: '주문번호', name:'ordNum'},
			{ header: '납기일자', name:'ordDeliveryDate'},
			{ header: '주문량', name:'ordVol'},
			{ header: '계획량', name:'prdWorkVol'},
			{ header: '작업일자', name:'prdPlanDate'},
			{ header: '순서', name:'prdNo'}
	    ]
	}); // end const grid
	
	// 고객사 검색 모달
	const grid2 = new tui.Grid({
	    el: document.getElementById('grid2'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: getOperList(),
	    rowHeaders: [{
            type: 'checkbox',
            header: ' '
    	}],
	    columns: [
	    	{ 
	    		header: '업체코드', 
	    		name:'operCode',
	    		align: 'center'
	    		},
			{ 
	    		header: '업체명', 
	    		name:'operName',
	    		align: 'center'
	    		}
	    ]
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
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getPrdComList());
	  })
	  
	// toast datePicker 관련 Script
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
    
	// 생산계획조회 날짜조건
	function getPrdComList() {
		let data;
		$.ajax({
			async: false,
			url : "ProducePlanList",
			type : "get",
			data : {
				startDate : startDate,
				endDate : endDate
				},
			dataType: "json",
			success : function(result){
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	// 제품코드 입력 모달창 제품 테이블 Select 데이터
	function getItemList() {
		let data;
		$.ajax({
			async: false,
			url: 'ItemList',
			type: 'get',
			success: function(result){
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	// 고객사 모달 고객사 정보 Select List
	function getOperList() {
		let data;
		$.ajax({
			async: false,
			url : "OperationList",
			type : "get",
			success : function(result){
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}

	// 고객사 모달창 단일 체크
	grid2.on('check', (e) => {
		let rows = grid2.getCheckedRowKeys();
		if(rows.length > 1) {
			for(let i in rows){
				if(e.rowKey != rows[i]){
					grid2.uncheck(rows[i]);
				}
			}
			rows = grid2.getCheckedRowKeys();
		}
		// 고객사 모달창 체크된 로우 업체명 칼럼 값 가져오기
		$('#operCheckSearchBtn').click(function() {
			$('#operModal').modal("hide");
			let operName = grid2.getValue(rows, 'operName');
			$('#preOperName').val(operName);
			$('#preOperName1').val(operName);
		})
	});

	grid2.on('dblclick', (e) => {
		var selectItm = grid.getFocusedCell();
		if(getKeyByValue(selectItm, "itmCode") != null){
			$('#itmModal').modal("hide");
			let selectItm = grid2.getFocusedCell();
			itmCode = selectItm.value;
			selectItem(itmCode);
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
			let itmCode = grid3.getValue(rows, 'itmCode');
			$('#itmCode').val(itmCode);
			$('#itmCode1').val(itmCode);
		})
	});
	
	$('#mobile-collapse').click(function() {
		grid.refreshLayout();
	});
	
	
	// 생산계획조회 그리드 생성
	$('#searchBtn').click(function() {
		startDate = $('#startDate').val();
		endDate = $('#endDate').val();
		grid.resetData(getPrdComList());
	})
	
	$('#searchOperBtn').click(function(){
		$('#operModal').modal('toggle');
		$('#operModal').on('shown.bs.modal', function(){
			grid2.refreshLayout();
		});
	});
	
	$('#itemSearchBtn').click(function() {
		$('#itmModal').modal('toggle');
		$('#itmModal').on('shown.bs.modal', function(){
			grid3.refreshLayout();
		});
	})
	
	$('#printBtn').click(function() {
		$(document.body).printThis();
	})
	
})

</script>
</head>
<body>
	<div class="print">
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
														<div>
															<input type="text" class="form-control" id="preOperName"
																name="preOperName" /> <input type="text"
																class="form-control" id="preOperName1"
																name="preOperName1" readonly="readonly" />
															<button type="button" id="searchOperBtn">검색</button>
														</div>
														<span style="margin: 10px;"> ~ </span>
														<div>
															<input type="text" class="form-control" id="endOperName"
																name="endOperName" /> <input type="text"
																class="form-control" id="endOperNam" name="endOperNam"
																readonly="readonly" />
															<button type="button">검색</button>
														</div>

													</div>
												</td>

											</tr>
											<tr>
												<td><label class="col-form-label text-center">제품코드</label>
												</td>
												<td>
													<div class="row">
														<div>
															<input type="text" class="form-control" id="itmCode"
																name="itmCode" /> <input type="text"
																class="form-control" id="itmCode1" name="itmCode2"
																readonly="readonly" />
															<button type="button" id="itemSearchBtn">검색</button>
														</div>
													</div>
												</td>
											</tr>
										</table>
									</div>
								</div>
							</div>


							<div class="row">
								<div class="col-sm-12" style="z-index: 100">
									<div id="grid"></div>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>

		<!-- 고객사 선택 모달 -->
		<div class="modal fade" id="operModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="myModalLabel">고객사</h3>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">&times;</button>
					</div>
					<div class="modal-body">
						<div id="grid2"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							id="operCheckSearchBtn">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
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
					<button type="button" class="btn btn-primary"
						id="itmCheckSearchBtn">확인</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

