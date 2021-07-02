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
let prdPlanDNum = null;
let prdNum = null;
let prdName = null;
let prdNote = null;
$(function(){
	
	class CustomTextEditor {
		  constructor(props) {
		    const el = document.createElement('input');

		    el.type = 'text';
		    el.name = 'itmCode'
		    el.value = String(props.value);

		    this.el = el;
		  }

		  getElement() {
		    return this.el;
		  }

		  getValue() {
		    return this.el.value;
		  }

		  mounted() {
		    this.el.select();
		  }
		}
	
	// 생산계획 디테일 그리드
	const grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 400,
	    data: [],
	    rowHeaders: ['checkbox'],
	    columns: [
			{ 
	    		header: '제품코드', 
	    		name:'itmCode',
	    		align: 'center',
	    		editor: {
	    			type: CustomTextEditor,
	    	        options: {
	    	          myCustomOptions: {
	    	        	  }// end of myCustomOptions
	    	        }//end of options
	    		}
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
	}); 
	
	// 생산계획 마스터 테이블(조회시 사용)
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
	
	// 조회 모달에서 계획번호 cell만 선택하기 위해 조건문에서 사용되는 함수
	function getKeyByValue(object, value) {
		return Object.keys(object).find(key => object[key] === value);
	}
	
	// 조회된 리스트에서 특정 생산계획의 계획번호를 더블클릭 시 cell의 계획번호 값을 가져와서 디테일테이블 select 후 생산계획 디테일 그리드에 적용
	grid2.on('dblclick', () => { 
		var selectPrd = grid2.getFocusedCell();
		if(getKeyByValue(selectPrd, "prdNum") != null){
			let prdNum = Object.values(selectPrd)[2];
			$('#searchModal').modal("hide");
			$('#prdName').val(prdName);
			$('#prdNote').val(prdNote);
			grid.resetData(getList());
		}
	});
	
	// 조회 모달창 선택 날짜에 해당되는 생산계획 마스터 테이블 Select 데이터
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
				prdName = result[0].prdName;
				prdNote = result[0].prdNote;
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	// 조회에서 선택한 생산계획 디테일 테이블 Select 데이터
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
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	// 제품코드 입력 모달창 제품 테이블 Select 데이터
	function getItemList() {
		let itmCode = null;
		let data;
		$.ajax({
			async: false,
			url : "ItemList",
			type : "get",
			data : {
				itmCode : itmCode
				},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					itmCode = result[result.length -1].itmCode;
				}
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	// 선택한 제품코드 값만 받아오기
	function selectItem() {
		let itmCode = null;
		let data;
		$.ajax({
			async: false,
			url : "SelectItem",
			type : "get",
			data : {
				itmCode : itmCode
				},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					itmCode = result[result.length -1].itmCode;
				}
				data = result;
			} // end success
		}); // end ajax
		return data;
	}
	
	// toast datePicker 관련 Script
	var today = new Date();
	var preDay = new Date();
	preDay.setDate(today.getDate() - 7);
	
	// 새자료 버튼 사용시 날짜 정보가 공란이 되는 것을 막기 위해 리셋시 함수로 실행함
	function setDatePicker(){
	  	var datepicker = new tui.DatePicker('#wrapper', {
	  		 language: 'ko',
	         date: new Date(),
	         input: {
	             element: '#datepicker-input',
	             format: 'yyyy-MM-dd'
	         }
	    });
		
	    var picker = tui.DatePicker.createRangePicker({
	        startpicker: {
	        	language: 'ko',
	            date: today,
	            input: '#startDate',
	            container: '#startDate-container'
	        },
	        endpicker: {
	        	language: 'ko',
	            date: today,
	            input: '#endDate',
	            container: '#endDate-container'
	        }
	    });
	    
	    var picker2 = tui.DatePicker.createRangePicker({
	        startpicker: {
	        	language: 'ko',
	            date: preDay,
	            input: '#unpStartDate',
	            container: '#unpStartDate-container'
	        },
	        endpicker: {
	        	language: 'ko',
	            date: today,
	            input: '#unpEndDate',
	            container: '#unpEndDate-container'
	        }
	    });
	}
	setDatePicker(); // 페이지 생성시 날짜 입력창 세팅
	
	// 해당 그리드 스크롤 형태로 변경
	grid.on('scrollEnd', () => {
	    grid.appendRows(getList());
	  })
	
	// 사이드메뉴 접고 펼 때 그리드 깨짐 방지를 위한 그리드 새로고침
	$('#mobile-collapse').click(function() {
		grid.refreshLayout();
	})
	
	// 조회버튼 클릭 이벤트, 모달창 오픈 그리드 refreshLayout 적용으로 바로 불러옴
	$('#searchBtn').click(function(){
		$('#searchModal').modal('toggle');
		$('#searchModal').on('shown.bs.modal', function(){
			grid2.refreshLayout();
		});
	});
	
	// 조회 모달창의 검색 버튼 이벤트, 선택한 startDate와 endDate 값을 getPrdList에 넘겨 해당 날짜의 생산계획만 검색
	$('#prdSearchBtn').click(function() {
		startDate = $('#startDate').val();
		endDate = $('#endDate').val();
		grid2.resetData(getPrdList());
	});
	
	// 새자료 버튼 클릭 이벤트, 마스터 Form과 디테일 그리드 데이터 remove, 날짜 정보 초기화를 위한 setDatePicker();
	$('#resetBtn').click(function(){
		$('#master').each(function() {
			this.reset();
			grid.clear();
			setDatePicker();
		});
	});
	
	// 추가 버튼 클릭 이벤트, 그리드 row 생성 미완성
	var rowData = [];
	$('#addRowBtn').click(function() {
		grid.appendRow(rowData)
	})
	
	// 제품코드 입력란 더블클릭 시 제품코드별 제품명을 볼 수 있는 모달창 생성
	grid.on('dblclick', () => {
		var selectItm = grid.getFocusedCell();
		if(getKeyByValue(selectItm, "itmCode") != null){
			$('#itmModal').modal('toggle');
			$('#itmModal').on('shown.bs.modal', function(){
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
		}
	});
	
	
	
	// 제품코드 모달창 제품코드 더블클릭 시 디테일 테이블 로우 데이터 값 수정
	grid3.on('dblclick', (e) => {
		var selectItm = grid.getFocusedCell();
		if(getKeyByValue(selectItm, "itmCode") != null){
			$('#itmModal').modal("hide");
			var a = getItemList();
			console.log(a);
			//$('input[name=itmCode]').val();
		}
	});
	
	
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
												aria-label="Date-Time"/> <span class="tui-ico-date"></span>
										</div>
										<div id="wrapper" style="margin-top: -1px;"></div>
									</td>
								</tr>
								<tr>
									<th>생산계획명*</th>
									<td><input type="text" id="prdName" /></td>
								</tr>
								<tr>
									<th>특기사항</th>
									<td><input type="text" id="prdNote" /></td>
								</tr>
							</table>
						</div>
						<div class="col border"
							style="background-color: white; padding: 10px;">
							<h5>미생산 계획 검색</h5>
							<div>납기일자</div>
							<div class="row">
								<div
									class="tui-datepicker-input tui-datetime-input tui-has-focus">
									<input id="unpStartDate" name="unpStartDate" type="text"
										aria-label="Date" /> <span class="tui-ico-date"></span>
									<div id="unpStartDate-container" style="margin-left: -1px;"></div>
								</div>
								<span>~</span>
								<div
									class="tui-datepicker-input tui-datetime-input tui-has-focus">
									<input id="unpEndDate" name="unpEndDate" type="text"
										aria-label="Date" /> <span class="tui-ico-date"></span>
									<div id="unpEndDate-container" style="margin-left: -1px;"></div>
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

	<!-- 조회 Modal-->
	<div class="modal fade" id="searchModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel">
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
					<form id="prdSearch" name="prdSearch" method="post"
						action="/prd/pln/ProducePlanList" onsubmit="return false">
						<div class="form-group row">
							<div class="col-md-3">계획일자</div>
							<div class="col">
								<div
									class="tui-datepicker-input tui-datetime-input tui-has-focus">
									<input id="startDate" name="startDate" type="text"
										aria-label="Date" /> <span class="tui-ico-date"></span>
									<div id="startDate-container" style="margin-left: -1px;"></div>
								</div>
								<span>~</span>
								<div
									class="tui-datepicker-input tui-datetime-input tui-has-focus">
									<input id="endDate" name="endDate" type="text"
										aria-label="Date" /> <span class="tui-ico-date"></span>
									<div id="endDate-container" style="margin-left: -1px;"></div>
								</div>
							</div>
							<div class="col-md-3">
								<button type="button" class="btn btn-primary btn-sm"
									id="prdSearchBtn">검색</button>
							</div>
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
					<button type="button" class="btn btn-primary">확인</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
