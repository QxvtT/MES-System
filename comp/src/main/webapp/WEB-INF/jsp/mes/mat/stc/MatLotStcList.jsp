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
<style type="">

</style>
<script type="text/javaScript" language="javascript" defer="defer">
let matCode = null;
$(function(){
	var today = new Date();
    var picker = tui.DatePicker.createRangePicker({
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
        language: 'ko'
        
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
			{ header: '자재구분', name:'matDiv'},
			{ header: '안전재고', name:'matSafeStock'},
// 			{ header: '이월량', name:''},
			{ header: '입고량', name:'matHisDVol'},
// 			{ header: '출고량', name:''},
			{ header: '현재고', name:'matVol'},
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
			url : "MaterialLotStockList",
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
	
	$('#mobile-collapse').click(function() {
	   grid.refreshLayout();
	});
	
})

<!--
	/* 글 수정 화면 function */

	function fn_egov_select(lotNum, matCode) {
		document.getElementById("listForm").lotNum.value = lotNum;
		document.getElementById("listForm").matCode.value = matCode;
		document.getElementById("listForm").action = "<c:url value='/materialStock/updateMaterialStockView.do'/>";
		document.getElementById("listForm").submit();
	}

	/* 글 등록 화면 function */
	function fn_egov_addView() {
		document.getElementById("listForm").action = "<c:url value='/materialStock/addMaterialStockView.do'/>";
		document.getElementById("listForm").submit();
	}

	/* pagination 페이지 링크 function */
	function fn_egov_link_page(pageNo) {
		document.getElementById("listForm").pageIndex.value = pageNo;
		document.getElementById("listForm").action = "<c:url value='/materialStock/MaterialStockList.do'/>";
		document.getElementById("listForm").submit();
	}
// -->
</script>
</head>
<body>
	<form:form commandName="searchVO" name="listForm" id="listForm"	method="post">
		<input type="hidden" name="matCode" />
<div class="pcoded-inner-content">
<div class="main-body">
<div class="page-wrapper">
<div class="row">
<div class="col-sm-12">
<!-- 타이틀 -->
<div id="title" class="mb-4">
	<h3>자재 LOT 재고 조회</h3>
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
						<input type="text" class="form-control w-25 ml-3" id="matName" name="matCode" value="${result.matName }" readonly></input>
						<button type="button" class="btn btn-sm btn-primary waves-effect waves-light ml-3">검색</button>
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
				<button onclick="location.href=''" class="btn waves-effect waves-light btn-primary btn-outline-primary"> 조회 </button>
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
