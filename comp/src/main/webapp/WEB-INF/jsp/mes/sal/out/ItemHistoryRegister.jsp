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
/* 글 목록 화면 function */
function fn_egov_selectList() {
   	document.getElementById("detailForm").action = "<c:url value='/ItemHistoryList.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 삭제 function */
function fn_egov_delete() {
   	document.getElementById("detailForm").action = "<c:url value='/deleteItemHistory.do'/>";
   	document.getElementById("detailForm").submit();		
}

/* 글 등록 function */
function fn_egov_save() {	
	frm = document.getElementById("detailForm");

	/* TODO Validation기능 보완 */
	
  	frm.action = "<c:url value="${registerFlag == '등록' ? '/addItemHistory.do' : '/updateItemHistory.do'}"/>";
    frm.submit();

}
// 전체주문페이지 
let ordNum = null;
let itmHisDNum = null;

// 모달 검색 
let aDate = null;
let bDate = null;
let test = null;

let str = '';

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
  				 itmHisDNum : itmHisDNum
  				,ordNum : ordNum
  				,str : str
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
			,{ header: '자재명', name:'itmName'}
			,{ header: '비고', name:'itmNoteD'}
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
	<button type="button" class="btn btn-info btn-sm" id="searchHisBtn"
		data-toggle="modal" data-target="#myModal">검색</button>

	<form:form commandName="itemHistoryVO" name="detailForm"
		id="detailForm">
		<div id="content_pop">
		
			<form id="frm" name="frm">
				<div id="table">
					<table width="100%" border="1" cellpadding="0" cellspacing="0">
						<colgroup>
							<col width="150" />
							<col width="" />
						</colgroup>

						<c:if test="${registerFlag == '수정'}">
							<tr>
								<th>ITM_HIS_NUM *</th>
								<td><form:input path="itmHisNum" cssClass="essentiality"
										readonly="true" /></td>
							</tr>
						</c:if>
						<tr>
							<th>ORD_NUM</th>
							<td><input type="text" name="ordNum" id="ordNum" value = "${ItemHistoryVO.ordNum }"/> <a
								href="SearchOrder.do">조회</a></td>
						</tr>
					</table>
					<button type="button" id="button" name="button">조회</button>
				</div>
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
			
		</div>
		<!-- 검색조건 유지 -->
		<input type="hidden" name="searchCondition"
			value="<c:out value='${searchVO.searchCondition}'/>" />
		<input type="hidden" name="searchKeyword"
			value="<c:out value='${searchVO.searchKeyword}'/>" />
		<input type="hidden" name="pageIndex"
			value="<c:out value='${searchVO.pageIndex}'/>" />
	</form:form>


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





