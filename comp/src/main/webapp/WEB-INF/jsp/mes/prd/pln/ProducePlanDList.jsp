<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	/**
* @Class Name : ProducePlanDList.jsp
* @Description : ProducePlanD List 화면
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>목록</title>
<!-- Toast Grid CDN -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
	/* 글 수정 화면 function */

	function fn_egov_select(prdPlanDNum) {
		document.getElementById("listForm").prdPlanDNum.value = prdPlanDNum;
		document.getElementById("listForm").action = "<c:url value='/prd/pln/updateProducePlanDView.do'/>";
		document.getElementById("listForm").submit();
	}

	/* 글 등록 화면 function */
	function fn_egov_addView() {
		document.getElementById("listForm").action = "<c:url value='/prd/pln/addProducePlanDView.do'/>";
		document.getElementById("listForm").submit();
	}

	/* pagination 페이지 링크 function */
	function fn_egov_link_page(pageNo) {
		document.getElementById("listForm").pageIndex.value = pageNo;
		document.getElementById("listForm").action = "<c:url value='/prd/pln/ProducePlanDList.do'/>";
		document.getElementById("listForm").submit();
	}
// -->

let prdPlanDNum = null;
let prdNum = null;
$(function(){
	const grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 400,
	    data: [],
	    columns: [
			{ 
	    		header: '제품코드', 
	    		name:'itmCode',
	    		align: 'center',
	    		editor: 'text'
	    	},
			{ 
	    		header: '제품명', 
	    		name:'itmName',
	    		align: 'center'
	    	},
			{ 
	    		header: '규격', 
	    		name:'matCode',
	    		align: 'center'
	    	},
			{ 
	    		header: '주문서관리번호', 
	    		name:'ordNum',
	    		align: 'center'
	    	},
			{
	    		header: '납기일자', 
	    		name:'ordDeliveryDate',
	    		align: 'center'
	    	},
			{
	    		header: '주문량', 
	    		name:'ordVol',
	    		align: 'center'
	    	},
			{
	    		header: '작업량', 
	    		name:'prdWorkVol',
	    		align: 'center',
	    	},
			{ 
	    		header: '일생산량', 
	    		name:'itmDayOutput',
	    		align: 'center'
	    	},
			{ 
	    		header: '생산일수', 
	    		align: 'center'
	    	},
			{ 
	    		header: '작업일자', 
	    		name:'prdPlanDate',
	    		format: 'yyyy/MM/dd',
	    		align: 'center',
	    		editor: {
	    			type: 'datePicker'
	    		}
	    	},
			{ 
	    		header: '작업순서', 
	    		name:'prdNo',
	    		align: 'center',
	    		editor: 'text'
	    	},
			{ 
	    		header: '비고', 
	    		name:'prdDNote',
	    		align: 'center',
	    		editor: 'text'
	    	}
	    ]
	}); // end const grid
	
	const grid2 = new tui.Grid({
	    el: document.getElementById('grid2'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: [],
	    columns: [
	    	{ 
	    		header: '계획일자', 
	    		name:'prdDate',
	    		align: 'center'
	    		},
			{ 
	    		header: '계획번호', 
	    		name:'prdNum',
	    		align: 'center'
	    		},
	    	{ 
		    	header: '계획명', 
		    	name:'prdName',
		    	align: 'center'
		    	},
			{ 
	    		header: '비고', 
	    		name:'prdDNote',
	    		align: 'center'
	    		}
	    ]
	}); // end const grid
	
	function getKeyByValue(object, value) {
		return Object.keys(object).find(key => object[key] === value);
	}
	
	grid2.on('dblclick', () => { 
		var selectPrd = grid2.getFocusedCell();
		if(getKeyByValue(selectPrd, "prdNum") != null){
			let prdNum = Object.values(selectPrd)[2];
			$('#searchModal').modal("hide");
			grid.resetData(getList());
		}
	});
	
	function getList() {
		let data;
		$.ajax({
			async: false,
			url : "ProducePlanDList",
			type : "get",
			data : {
				prdPlanDNum: prdPlanDNum,
				prdNum : prdNum
				},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					prdPlanDNum = result[result.length -1].prdPlanDNum;
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
	  
	$('#mobile-collapse').click(function() {
		grid.refreshLayout();
	})
	
	/* $(".datePicker").datepicker({
		changeMonth: true, 
		changeYear: true, 
		minDate: '-50y', 
		nextText: '다음 달', 
		prevText: '이전 달', 
		yearRange: 'c-50:c+20', 
		showButtonPanel: true, 
		currentText: '오늘 날짜', 
		closeText: '닫기', 
		dateFormat: "yy-mm-dd", 
		showMonthAfterYear: true,
		showOn:"both", 
		buttonImage:"${pageContext.request.contextPath}/assets/images/btn_calendar.png", 
		buttonImageOnly:true,
		dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	}); */
	
	var datepicker = new tui.DatePicker('.wrapper',
            {
            language: 'ko',
            date: new Date(),
            input: {
                element: '.datepicker-input',
                format: 'yyyy-MM-dd'
            }
    });
	
	$("#prevDate").datepicker("setDate", '-7D');
	$(".nowDate").datepicker("setDate", 'today');
	
	$('#searchBtn').click(function(){
		$('#searchModal').modal('toggle');
		$('#searchModal').on('shown.bs.modal', function(){
			grid2.refreshLayout();
		});
	});
	
	$('#resetBtn').click(function(){
		$('#master').each(function() {
			this.reset();
			$("#prevDate").datepicker("setDate", '-7D');
			$(".nowDate").datepicker("setDate", 'today');
		});
	});
	
	
	$('#prdSearchBtn').click(function() {
		startDate = $('#startDate').val();
		endDate = $('#endDate').val();
		grid2.resetData(getPrdList());
	});
	
	function getPrdList() {
		grid2.clear();
		let data;
		$.ajax({
			async: false,
			url : "ProducePlanList",
			type : "get",
			data : {
				startDate : startDate,
				endDate : endDate,
				prdNum: prdNum
				},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					prdNum = result[result.length -1].prdNum;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	var rowData = [];
	$('#addRowBtn').click(function() {
		grid.appendRow(rowData)
	})
});


</script>
<style>
	
	.modal-content {
		padding: 5px;
	}

</style>
</head>
<body>
	<!-- 생산계획관리  -->
	<div class="page-header">
		<div class="page-block">
			<div class="row align-items-center">
				<div class="col-md-8">
					<div class="page-header-title">
						<h5 class="m-b-10">생산계획관리</h5>
					</div>
				</div>
				<div class="col-md-4">
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="/comp"> <i
								class="fa fa-home"></i>
						</a></li>
						<li class="breadcrumb-item">생산관리</li>
						<li class="breadcrumb-item">생산계획관리</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Page-header end -->
	<div class="pcoded-inner-content">
		<br />
		<!-- 조회 Modal-->
		<div class="modal fade" id="searchModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="exampleModalLabel">생산계획 조회</h3>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							&times;
						</button>
					</div>
					<div class="modal-body">
						<form id="prdSearch" name="prdSearch" method="post" action="/prd/pln/ProducePlanList" onsubmit="return false">
							<div class="form-group row">
								<div class="col-md-3">계획일자</div>
								<div class="col">
									<div
										class="tui-datepicker-input tui-datetime-input tui-has-focus">
										<input type="text" class="datepicker-input nowDate" id="startDate" name="startDate"
											aria-label="Date-Time" /> <span class="tui-ico-date"></span>
									</div>
									<div class="wrapper" style="margin-top: -1px;"></div>
								</div>
								<span>~</span>
								<div class="col">
									<div
										class="tui-datepicker-input tui-datetime-input tui-has-focus">
										<input type="text" class="datepicker-input nowDate" id="endDate" name="endDate"
											aria-label="Date-Time" /> <span class="tui-ico-date"></span>
									</div>
									<div class="wrapper" style="margin-top: -1px;"></div>
								</div>
								<div class="col-md-3"><button type="button" class="btn btn-primary btn-sm"  id="prdSearchBtn">검색</button></div>
							</div>
						</form>
						<div id="grid2"></div>
					</div>
					<div class="modal-footer">
						<a class="btn" id="modalY" href="#">예</a>
						<button class="btn" type="button" data-dismiss="modal">아니요</button>
					</div>
				</div>
			</div>
		</div>


		<div class="main-body">
			<div class="page-wrapper">
				<div class="text-right">
					<button type="button" class="btn btn-primary" id="searchBtn">조회</button>
					<button type="button" class="btn btn-primary" id="resetBtn">새자료</button>
					<button type="button" class="btn btn-primary" id="saveBtn">저장</button>
					<button type="button" class="btn btn-primary" id="removeBtn">삭제</button>
				</div>
				<br />
				<form action="" id="master" name="master">
					<div class="row">
						<div class="col">
							<table class="table" style="background-color: white;">
								<tr>
									<th>계획일자*</th>
									<td>
										<div
											class="tui-datepicker-input tui-datetime-input tui-has-focus">
											<input type="text" id="datepicker-input"
												aria-label="Date-Time" /> <span class="tui-ico-date"></span>
										</div>
										<div id="wrapper" style="margin-top: -1px;"></div>
									</td>
								</tr>
								<tr>
									<th>생산계획명*</th>
									<td><input type="text" id="prd_name" /></td>
								</tr>
								<tr>
									<th>특기사항</th>
									<td><input type="text" id="prd_note" /></td>
								</tr>
							</table>
						</div>
						<div class="col border"
							style="background-color: white; padding: 10px;">
							<h5>미생산 계획 검색</h5>
							<div>납기일자</div>
							<div class="row">
								<div class="col">
									<input type="text" class="datePicker" id="prevDate" />
								</div>
								<span>~</span>
								<div class="col">
									<input type="text" class="datePicker nowDate" />
								</div>
								<div class="col">
									<button type="submit" class="btn btn-primary btn-sm">미생산 계획
										조회</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="page-wrapper">
			<div class="text-right">
					<button type="button" class="btn btn-primary btn-sm" id="addRowBtn">추가</button>
					<button type="button" class="btn btn-primary btn-sm" id="deleteRowBtn">삭제</button>
				</div><br/>
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
</body>
</html>
