<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	/**
* @Class Name : MaterialStockList.jsp
* @Description : MaterialStock List 화면
* @Modification Information
* 
* @author materialStock
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
let matHisNum1 = null;
let matCode = null;
let matHisNum = null;
let matHisDate = null;
let sDate = null;
let eDate = null;
let operCode = null;
let matOutOper = null;

$(function(){
	
	let MatOutDate = new Date();
    var datepicker = new tui.DatePicker('#MatOutpicker-container', {
    	language: 'ko',
        date: MatOutDate,
        input: {
            element: '#MatOutpicker-input',
            format: 'yyyy-MM-dd',
        }
    });
    
    let Outdate = new Date();
    let picker = tui.DatePicker.createRangePicker({
        startpicker: {
            date: Outdate,
            input: '#OutStartpicker-input',
            container: '#OutStartpicker-container'
        },
        endpicker: {
            date: Outdate,
            input: '#OutEndpicker-input',
            container: '#OutEndpicker-container'
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
	    data: getList(),
	    rowHeaders: ['rowNum'],
	    columns: [
	    	{ header: '자재코드', name:'matCode'},
			{ header: '자재명', name:'matName'},
			{ header: '규격', name:'matSize'},
			{ header: '단위', name:'matUnit'},
			{ header: '출고량', name:'matHisDVol'},
			{ header: 'Lot No', name:'lotNo'},
			{ header: '자재재고', name:'matVol'}
	    ]
	}); // end const grid
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getList());
	  })
	  
	function getList() {
		let data;
		$.ajax({
			async: false,
			url : "MatOutMng",
			type : "get",
			data : {matCode: matCode},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					matCode = result[result.length -1].matCode;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	} 
	
	$('#matOutDayBtn').click(function(){
		matHisNum1 = null;
		grid2.resetData(getMatOutDayList());
		$("#myModal").modal("toggle");
		$("#myModal").on('shown.bs.modal', function () {
			grid2.refreshLayout();
		});
		
	})
	
	const grid2 = new tui.Grid({
	    el: document.getElementById('grid2'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: getMatOutDayList(),
	    rowHeaders: ['rowNum', 'checkbox'],
	    columns: [
	    	{ 
	    		header: '반품일자', 
	    		name:'matHisDate'
	    	},
			{ 
	    		header: '반품번호', 
	    		name:'matHisNum'
	    	},
	    	{ 
	    		header: '자재코드', 
	    		name:'matCode',
	    		hidden: true
	    	},
			{ 
	    		header: '반품자재', 
	    		name:'matName'
	    	},
			{ 
	    		header: '건수', 
	    		name:'matHisVol'
	    	},
	    	{ 
	    		header: '업체코드', 
	    		name:'operCode',
	    		hidden: true
	    	}
	    ]
	}); // end const grid2
	
	function getMatOutDayList() {
		let data;
		$.ajax({
			async: false,
			url : "MatOutDayList",
			type : "get",
			data : {
				matHisNum: matHisNum,
				matHisNum1: matHisNum1,
				sDate: sDate,
				eDate: eDate
				},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					matHisNum1 = result[result.length -1].matHisNum;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	} 
	
	grid2.on('scrollEnd', () => {
		  grid2.appendRows(getMatOutDayList());
		})
	
	searchBtn.onclick = function(){
		console.log('test')
		
		sDate = $(".modal-body").find('input[name="sDate"]').val();
		console.log(sDate)
		eDate = $(".modal-body").find('input[name="eDate"]').val();
		console.log(eDate)
		
		grid2.resetData(getMatInDayList());
	}
	
	// 추가 버튼 클릭 이벤트, 그리드 row 생성 미완성
	var rowData = [];
	$('#addRowBtn').click(function() {
		grid.appendRow(rowData)
	})
	
	$('#mobile-collapse').click(function() {
	      grid.refreshLayout();
	   });
	
	matOutDeleteBtn.onclick = function(){
		grid.removeCheckedRows()
		console.log(grid.removeCheckedRows());
	}
	
})
</script>
</head>
<body>
	<form:form commandName="searchVO" name="listForm" id="listForm"
		method="post">
		<input type="hidden" name="matCode" />
		<div class="pcoded-inner-content">
			<div class="main-body">
				<div class="page-wrapper">
					<div class="row">
						<div class="col-xl-12">
							<div id="datePicker"></div>
							<!-- 타이틀 -->
							<div id="title" class="card-header">
								<h3>자재 출고 관리</h3>
								<br />
							</div>
							<!-- // 타이틀 -->
							<div>
								<div class="d-inline-block align-middle">출고 일자 *</div>
								<div
									class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
									<input type="text" id="MatOutpicker-input"
										class=" form-control w-25" aria-label="Date-Time"
										name="matHisDate" /> <span class="tui-ico-date"></span>
									<div id="MatOutpicker-container" style="margin-left: -1px;"></div>
								</div>
								<div id="date1" style="margin-top: -1px;"></div>
							</div>
							<div>
								출고업체 <input type="text" id="operCode" name="operCode" /> 출고업체명
								<input type="text" disabled id="matOutOper" name="matOutOper" />
								<%@ include
									file="/WEB-INF/jsp/mes/common/modal/OperationList.jsp"%>
							</div>
							<div>
								<button id="matOutDayBtn" type="button"
									class="btn btn-info btn-sm">조회</button>
								<input id="resetBtn" class="btn btn-info btn-sm" type="reset"
									value="리셋"></input>
								<button type="button" id="matInSaveBtn" name="matInSaveBtn"
									class="btn btn-info btn-sm">저장</button>
								<button type="button" id="matOutDeleteBtn" name="matInDeleteBtn"
									class="btn btn-info btn-sm">삭제</button>
							</div>
							<br />
							<div class="page-wrapper">
								<div class="text-right">
									<button type="button" class="btn btn-primary btn-sm"
										id="addRowBtn">추가</button>
									<button type="button" class="btn btn-primary btn-sm"
										id="deleteRowBtn">삭제</button>
								</div>
								<br />
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
				</div>
			</div>
		</div>
	</form:form>

	<!-- 일 반품자료 리스트 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">일 반품 자료 LIST</h4>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						&times;
					</button>
				</div>
				<div class="modal-body">
					<div>
						<div class="d-inline-block align-middle">반품 일자 *</div>
						<div
							class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
							<input type="text" id="OutStartpicker-input"
								class=" form-control w-25" aria-label="Date-Time" name="sDate" />
							<span class="tui-ico-date"></span>
							<div id="OutStartpicker-container" style="margin-left: -1px;"></div>
						</div>
						<div id="date5" style="margin-top: -1px;"></div>
						<div
							class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
							<input type="text" id="OutEndpicker-input"
								class=" form-control w-25" aria-label="Date-Time" name="eDate" />
							<span class="tui-ico-date"></span>
							<div id="OutEndpicker-container" style="margin-left: -1px;"></div>
						</div>
						<div id="date2" style="margin-top: -1px;"></div>
						<div>
							<input type="button" id="searchBtn" name="searchBtn" value="검색"></input>
						</div>
					</div>
					<div id='grid2' />
				</div>
				<div class="modal-footer">
					<button class="btn" id="modalY" name="modalY" type="button"
						data-dismiss="modal">예</button>
					<button class="btn" type="button" data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
