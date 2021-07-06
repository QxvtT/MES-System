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
let operCode = null;
let matHisDate = null;
let number = 0;
let data;

$(function(){
	
	const grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: getList(),
	    rowHeaders: ['rowNum', 'checkbox'],
	    columns: [
	    	{ 
	    		header: '자재코드', 
	    		name:'matCode', 
	    		editor: "text"
	    	},
			{ 
	    		header: '자재명', 
	    		name:'matName'
	    	},
			{ 
	    		header: '규격', 
	    		name:'matSize'
	    	},
			{ 
	    		header: '단위', 
	    		name:'matUnit'
	    	},
			{ 
	    		header: '발주번호', 
	    		name:'matComNum'
	    	},
			{ 
	    		header: '입고량', 
	    		name:'matHisDVol',
    			editor: "text"
	    	},
			{ 
	    		header: '단가', 
	    		name:'matHisPrice',
    			editor: "text"
	    	},
			{ 
	    		header: '금액', 
	    		name:'amount',
    			editor: "text"
	    	},
			{ 
	    		header: 'Lot No', 
	    		name:'lotNo'
	    	},
			{ 
	    		header: '자재재고', 
	    		name:'matVol'
	    	},
	    	{ 
	    		header: '관리번호', 
	    		name:'matHisNum'
// 	    		hidden: true
	    	}
	    ]
	}); // end const grid
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getList());
	  })
	  
	function getList() {
		$.ajax({
			async: false,
			url : "MatInMng",
			type : "get",
			data : {
				matCode: matCode
				},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					matCode = result[result.length -1].matCode;
				}
				console.log(result);
				if(result.length != 0){
// 					$('input#matHisDate').val(result[0]['matHisDate']);
					$('input#matOutOper').val(result[0]['matOutOper']);
				}
				data = result;
				number = result.length;
			} // end success
		}); // end ajax 
		return data;
	} 
	
	$('#mobile-collapse').click(function() {
	      grid.refreshLayout();
	   });
	   
// 	$('#searchMatBtn').click(function(){
// 		$("#myModal").modal("toggle");
// 		$("#myModal").on('shown.bs.modal', function () {
// 			grid.refreshLayout();
// 		});
		
// 	})
	
	// 추가 버튼 클릭 이벤트, 그리드 row 생성 미완성
	var rowData = [];
	$('#addRowBtn').click(function() {
		grid.appendRow(rowData)
	})
	
	$(document).on('click','#matInDeleteBtn',function(){
	//선택한 그리드가 있으면 삭제
	var datas = grid.getCheckedRows();    
		if ( datas.length  > 0 ) {
			if ( confirm("선택한 입고자료를 삭제하시겠습니까?") == false ) {
				return false;
			} else fnDeleteD();
		//선택한 그리드가 없으면 알림
		} else{
		    toastr.warning( '삭제할 데이터를 선택해주세요.');
		}
	});
	
	$("#matInSaveBtn").click(function(){
		console.log(grid.getModifiedRows({}));
		let gridData = grid.getModifiedRows({});
		
		gridData["materialHistoryVO"]={
// 				matHisDate : $("#matHisDate").val()
				matOutOper : $("#matOutOper").val()
				}
		
		$.ajax({
			async: false,
			url: "updateMatIn",
			type : "post",
			data : JSON.stringify(gridData),
			dataType: "json",
			contentType: "application/json",
			success : function(){
				alret("insert success")
			}
		});
		grid.resetData(getList());
	});
	
	resetBtn.onclick=function(){
		grid.clear();
	}
	
	searchBtn.onclick = function(){
		matHisNum = null;
		test = null;
		
		grid.resetData(getList());
		operation.resetData(getOperationList());
		
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
										<p>작성일자</p>
										<div class="col-sm-6">
											<input type="date" name="dateRangeS" /> ~ <input type="date"
												name="dateRangeE" />
										</div>
										<div class="modal-footer">
											<a class="btn" id="modalY" href="#">예</a>
											<button class="btn" type="button" data-dismiss="modal">아니요</button>
										</div>
									</div>
								</div>
							</div>
							<!-- 타이틀 -->
							<div id="title" class="card-header">
								<h3>자재 입고 관리</h3>
								<br />
							</div>
							<!-- // 타이틀 -->
							<div>
								입고일자 * <input type="date" id="matHisDateS" name="matHisDateS" />
								~ <input type="date" id="matHisDateE" name="matHisDateE" />
							</div>
							<br />
							<div>
								입고업체 * <input type="text" id="operCode" name="operCode"></input>
								<input type="text" id="operName" name="operName"></input>
								<%@ include
									file="/WEB-INF/jsp/mes/common/modal/OperationList.jsp"%>
							</div>
							<br />
							<div>
								<button id="searchBtn" type="button" class="btn btn-info btn-sm">조회</button>
								<input id="resetBtn" class="btn btn-info btn-sm" type="reset"
									value="리셋"></input>
								<button type="button" id="matInSaveBtn" name="matInSaveBtn"
									class="btn btn-info btn-sm">저장</button>
								<button type="button" id="matInDeleteBtn" name="matInDeleteBtn"
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
	<script>
// 	$('#choiceO').click(function(){
// 		matHisNum = null;
// 		test = null;
// 		str = '';
// 		for(let i = 0; i<operation.getCheckedRows().length; i++){
// 			if(i == operation.getCheckedRows().length-1){
// 				str = str + operation.getCheckedRows()[i]['matHisNum']
// 			}
// 			else{
// 				str = str + operation.getCheckedRows()[i]['matHisNum']+"' , '";
// 			}	
// 		}
// 		console.log(str);
// 		console.log("---");
// 	grid.resetData(getList());
// 	operation.resetData(getOperationList());
// 	});
	</script>
</body>
</html>