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
let matCode = null;
let matName = null;
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
			{ header: '자재구분', name:'matDiv'},
			{ header: '안전재고', name:'matSafeStock'},
// 			{ header: '이월량', name:'matSafeStock'},
			{ header: '입고량', name:'matHisDVol'},
 			{ header: '출고량', name:'out'},
			{ header: '현재고', name:'matVol'},
			{ header: '미달량', name:'mShort'},
// 			{ header: '특기사항', name:''},
	    ]
	}); // end const grid
	
	function getList() {
		let data;
		$.ajax({
			async: false,
			url : "MatStcList",
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
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getList());
	  })
	  
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
			data : {matCode: matCode, matName: matName},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					matName = result[result.length -1].matName;
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
	   
	$('#searchMatBtn').click(function(){
		grid2.clear();
		grid2.resetData(getMatCodeList());
		$("#myModal").modal("toggle");
		$("#myModal").on('shown.bs.modal', function () {
			grid2.refreshLayout();
		});
	})
	
	searchMatCodeBtn.onclick = function(){
		matCode = null;
		matName = null;
		
		console.log('test')
		
		matCode = $(".modal-body").find('input[name="matCode"]').val();	
		console.log(matCode)
		
		matName = $(".modal-body").find('input[name="matName"]').val();
		console.log(matName)
		
		grid2.resetData(getMatCodeList());
	}
	
	modalY.onclick=function() {
		matCode = null;
		matName = null;
		test = null;
		str = '';
		for(let i =0; i<grid2.getCheckedRows().length; i++) {
			if(i == grid2.getCheckedRows().length-1){
				str = str + grid2.getCheckedRows()[i]['matCode'];
			}
			else{
				str = str + grid2.getCheckedRows()[i]['matCode']+"' , '";
			}
		}
		console.log(str);
		console.log('======================');
	grid.resetData(getList());
	grid2.resetData(getMatCodeList());
	document.getElementById("matCode").value=matCode;
	document.getElementById("matName").value=matName;
	}
	
	resetBtn.onclick=function(){
		grid.clear();
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
								<h3>자재 재고 조회</h3>
								<br />
							</div>
							<!-- // 타이틀 -->
							<div>
								작업일자 <input type="date" id="matHisDate" name="matHisDate"
									value=${result.matHisDate } /> ~ <input type="date"
									id="matHisDate" name="matHisDate" value=${result.matHisDate } />
							</div>
							<br />
							<div id="matDiv">
								자재코드 <input type="text" id="matCode" name="matCode"
								></input> &nbsp; &nbsp;
								<button type="button" class="btn btn-info btn-sm"
									id="searchMatBtn" name="searchMatBtn" data-toggle="modal"
									data-target="#myModal">검색</button>
								&nbsp; &nbsp; ~ &nbsp; &nbsp; <input type="text" id="matName"
									name="matName" ></input> &nbsp; &nbsp;
								<button type="button" class="btn btn-info btn-sm"
									id="searchMatBtn" data-toggle="modal" data-target="#myModal">검색</button>
								&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 자재구분 &nbsp; &nbsp;
							</div>
							<br />
							<div>
								<button class="btn btn-info btn-sm" onclick="location.href=''">조회</button>
								<input id="resetBtn" class="btn btn-info btn-sm" type="reset" value="리셋"></input>
									<form action="/examples/test/excelDown.do" method="post">
									   <input type="submit" value='엑셀 다운로드'>
									</form>
							</div>
							<br />
							<div id="grid"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 검색조건 유지 -->
		<input type="hidden" name="searchCondition"
			value="<c:out value='${searchVO.searchCondition}'/>" />
		<input type="hidden" name="searchKeyword"
			value="<c:out value='${searchVO.searchKeyword}'/>" />
		<input type="hidden" name="pageIndex"
			value="<c:out value='${searchVO.pageIndex}'/>" />
	</form:form>

	<!-- 자재 검색 모달 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
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
								<input type="text" id="matCode" name="matCode" /> 자재코드 <input
									type="text" id="matName" name="matName" /> 자재명
							</div>
						</div>
						<div class="col-md-3">
							<button type="button" class="btn btn-info btn-sm"
								id="searchMatCodeBtn">검색</button>
						</div>
					</form>
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
</body>
</html>
