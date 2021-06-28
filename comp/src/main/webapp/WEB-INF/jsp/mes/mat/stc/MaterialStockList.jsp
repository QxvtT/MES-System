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
<link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<script src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
let matCode = null;
$(function(){
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
			{ header: '규격', name:'matDiv'},
			{ header: 'Lot No', name:'lotNo'},
			{ header: '입고량', name:'matHisDVol'},
// 			{ header: '출고량', name:''},
			{ header: '현재고', name:'matVol'},
			{ header: '미달량', name:'short'},
// 			{ header: '특기사항', name:''},
	    ]
	}); // end const grid
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getList());
	  })
	  
	function getList() {
		let data;
		$.ajax({
			async: false,
			url : "MaterialStockList",
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
})

$('#mobile-collapse').click(function() {
      grid.refreshLayout();
   });
   
$('#searchMatBtn').click(function(){
	$("#myModal").modal("toggle");
	$("#myModal").on('shown.bs.modal', function () {
		grid.refreshLayout();
	});
	
})

</script>
</head>
<body>
	<form:form commandName="searchVO" name="listForm" id="listForm"	method="post">
		<input type="hidden" name="matCode" />
		<div class="pcoded-inner-content">
<div class="main-body">
<div class="page-wrapper">
<div class="row">
<div class="col-xl-12">
<div id="datePicker"></div>
<button type="button" class="btn btn-info btn-sm" id="searchMatBtn" data-toggle="modal" data-target="#myModal">조회(검색팝업)</button>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="exampleModalLabel">
					모달테스트
				</h3>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					&times;
				</button>
			</div>
			<p>작성일자</p>
			<div class="col-sm-6">
				<input type="date" name="dateRangeS" />
			</div>
			<p> ~ </p>
			<div class="col-sm-6">
				<input type="date" name="dateRangeE" />
			</div>
			<div id="grid"></div>
			<div class="modal-footer">
				<a class="btn" id="modalY" href="#">예</a>
				<button class="btn" type="button" data-dismiss="modal">아니요</button>
			</div>
		</div>
	</div>
</div>
			<!-- 타이틀 -->
			<div id="title" class="card-header">
				<h3>자재 재고 조회</h3>
				<br />
			</div>
			<!-- // 타이틀 -->
			<div>
			작업일자
			<input type="date" id="matHisDate" name="matHisDate" value=${result.matHisDate } /> ~ <input type="date" id="matHisDate" name="matHisDate" value=${result.matHisDate } /></div><br/>
			<div>
			자재코드
			<input type="text" id="matCode" name="matCode" value=${result.matCode }></input><input type="button" value="검색"></input> ~ <input type="text" id="matCode" name="matCode" value=${result.matCode }></input><input type="button" value="검색"></input>
			</div><br/>
			<div>
			<button onclick="location.href=''">조회</button>
			<input type="reset" value="리셋"></input>
			</div><br/>
			<div id="grid">
			</div>
	</form:form>
</body>
</html>
