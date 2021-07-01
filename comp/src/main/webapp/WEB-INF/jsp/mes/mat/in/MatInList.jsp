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

<script type="text/javaScript" language="javascript" defer="defer">
let matHisDateS = null;
let matHisDateE = null;
let matCode = null;
let operCode = null;
$(function(){
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
	    rowHeaders: ['checkbox'],
	    columns: [
	    	{ header: '입고일자', name:'matHisDate', editor: {type: 'datePicker'}},
	    	{ header: '자재코드', name:'matCode'},
			{ header: '자재명', name:'matName'},
			{ header: '규격', name:'matSize'},
			{ header: '업체명', name:'matOutOper'},
			{ header: '발주번호', name:'matComNum'},
			{ header: '입고량', name:'matHisDVol'},
			{ header: '단가', name:'matHisPrice'},
			{ header: '금액', name:'amount'},
			{ header: 'Lot No', name:'lotNo'},
	    ]
	}); // end const grid
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getList());
	  })
	  
	function getList() {
		let data;
		$.ajax({
			async: false,
			url : "MatInList",
			type : "get",
			data : {matCode: matCode,
					matHisDateS: matHisDateS,
					matHisDateE: matHisDateE
					},
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
	<%--
	const grid2 = new tui.Grid({
		el: document.getElementById('grid2'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: getMatCodeList(),
	    rowHeaders: ['rowNum', 'checkbox'],
	    columns: [
	    	{ header: '자재코드', name:'matCode'},
			{ header: '자재명', name:'matName'},
			{ header: '관리단위', name:'matUnit'}
	    ]
	}); // end const grid2
	
	function getMatCodeList() {
		let data;
		$.ajax({
			async: false,
			url : "MatCodeList",
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
	
	const grid3 = new tui.Grid({
		el: document.getElementById('grid3'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: getOperCodeList(),
	    rowHeaders: ['rowNum', 'checkbox'],
	    columns: [
	    	{ header: '업체코드', name:'matCode'},
			{ header: '업체명', name:'matName'},
			{ header: '사업자등록번호', name:'matUnit'},
			{ header: '전화번호', name:'matUnit'}
	    ]
	}); // end const grid3
	
	function getOperCodeList() {
		let data;
		$.ajax({
			async: false,
			url : "OperCodeList",
			type : "get",
			data : {operCode: operCode},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					operCode = result[result.length -1].operCode;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	$('#mobile-collapse').click(function() {
	      grid.refreshLayout();
	   });
	   
	$('#searchMatBtn').click(function(){
		console.log("aaaaaa");
		$("#searchMatModal").modal("toggle");
		$("#searchMatModal").on('shown.bs.modal', function () {
			grid2.refreshLayout();
		});
		
	})
	
	$('#searchOperBtn').click(function(){
		$("#searchOperModal").modal("toggle");
		$("#searchOperModal").on('shown.bs.modal', function () {
			grid3.refreshLayout();
		});
		
	})
	--%>
	
	$('#testBtn').click(function() {
		console.log("aaaaaaaaa");
		console.log(grid.getCheckedRows());
		matHisDateS = $('#startpicker-input').val();
		matHisDateE = $('#endpicker-input').val();
		matCode = $('#matCode').val();
		operCode = $('#operCode').val();
		grid.resetData(getList());
	});
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
						<%-- 
							<!-- 자재 검색 모달 -->
							<div class="modal fade" id="searchMatModal" tabindex="-1" role="dialog"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title" id="exampleModalLabel">자재 검색</h4>
											<button class="close" type="button" data-dismiss="modal"
												aria-label="Close">
												&times;
											</button>
										</div>
										<div class="modal-body">
											<form id="matCodeSearch" name="matCodeSearch" method="post"
												action="matCodeList.do" onsubmit="return false">
												<div class="form-group row">
													<div class="col">
														<input type="text" name="matCode" />
														&nbsp;
														&nbsp;
														자재코드 <input type="text" name="matName" />
														&nbsp;
														&nbsp;
														자재명
													</div>
												</div>
												<div class="col-md-3">
													<button type="button" class="btn btn-info btn-sm"
														id="matCodeSearch">검색</button>
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
							<!-- end 자재 검색 모달 -->

							<!-- 업체 검색 모달 -->
							<div class="modal fade" id="searchOperModal" tabindex="-1" role="dialog"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title" id="exampleModalLabel">업체 검색</h4>
											<button class="close" type="button" data-dismiss="modal"
												aria-label="Close">
												&times;
											</button>
										</div>
										<div class="modal-body">
											<form id="operCodeSearch" name="operCodeSearch" method="post"
												action="operCodeList.do" onsubmit="return false">
												<div class="form-group row">
													<div class="col">
														업체 코드 <input type="text" name="operCode" /> 업체명 <input
															type="text" name="operName" />
													</div>
												</div>
												<div class="col-md-3">
													<button type="button" class="btn btn-info btn-sm"
														id="operCodeSearch">검색</button>
												</div>
											</form>
											<br />
											<div id="grid3"></div>
										</div>
										<div class="modal-footer">
											<a class="btn" id="modalY" href="#">예</a>
											<button class="btn" type="button" data-dismiss="modal">아니요</button>
										</div>
									</div>
								</div>
							</div>
							<!-- end 업체 검색 모달 -->
							--%>
							
							<!-- 타이틀 -->
							<div id="title" class="mb-4">
								<h3>자재 입고 조회</h3>
							</div>
							<!-- // 타이틀 -->
							<div class="row">
								<div class="col-lg-12">
									<div class="table">
									<table class="table">
										<tr>
											<td>
												<div class="d-inline-block align-middle">작업일자</div>
											</td>
											<td>
												<div class="row align-items-center text-center col-lg-8">
												    <div class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
												        <input type="text" id="startpicker-input" class=" form-control w-25" aria-label="Date-Time" name="matHisDate"/>
												        <span class="tui-ico-date"></span>
												        <div id="startpicker-container" style="margin-left: -1px;"></div>
												    </div>
												    <div id="date1" style="margin-top: -1px;"></div>
							
													<label class="col-form-label text-center"> ~ </label>
													<div class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
												        <input type="text" id="endpicker-input" class=" form-control w-25" aria-label="Date-Time" name="matHisDate"/>
												        <span class="tui-ico-date"></span>
												        <div id="endpicker-container" style="margin-left: -1px;"></div>
												    </div>
												    <div id="date2" style="margin-top: -1px;"></div>
												</div>
												<div class="col-lg-4">
												</div>
											</td>
										</tr>
										<tr>
											<td>
										 		<label class="col-form-label text-center">자재코드</label>
										 	</td>
										 	<td>
											 	<div class="row align-items-center text-center col-lg-8">
													<input type="text" class="form-control w-25 ml-3" id="matCode" name="matCode" value="${result.matCode }"></input>
													<input type="text" class="form-control w-25 ml-3" id="matName" name="matName" value="${result.matName }" readonly></input>
													<button type="button" class="btn btn-sm btn-primary waves-effect waves-light ml-3"
														id="searchMatBtn" data-toggle="modal" data-target="#searchMatModal">검색</button>
												</div>
												<div class="col-lg-4">
												</div>
											</td>
										</tr>
										<tr>
											<td>
										 		<label class="col-form-label text-center">업체코드</label>
										 	</td>
										 	<td>
											 	<div class="row align-items-center text-center col-lg-8">
													<input type="text" class="form-control w-25 ml-3" id="operCode" name="operCode" value="${result.operCode }"></input>
													<input type="text" class="form-control w-25 ml-3" id="operName" name="operName" value="${result.operName }" readonly></input>
													<button type="button" class="btn btn-sm btn-primary waves-effect waves-light ml-3"
														id="searchOperBtn" data-toggle="modal" data-target="#searchOperModal">검색</button>
												</div>
												<div class="col-lg-4">
												</div>
											</td>
										</tr>
									</table>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-6"></div>
								<div class="col-sm-6 text-right">
									<div class="btn-group">
										<button type="button" id="testBtn" class="btn waves-effect waves-light btn-primary btn-outline-primary"> 조회 </button>
										<input type="reset" value=" 리셋 " class="btn waves-effect waves-light btn-primary btn-outline-primary"></input>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-12">
									<div id="grid"></div>
								</div>
							</div>
	
						</div>
					</div>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>
