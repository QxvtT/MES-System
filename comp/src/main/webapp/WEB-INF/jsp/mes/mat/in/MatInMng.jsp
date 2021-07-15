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
let matHisNum2 = null;
let matHisDNum = null;
let matHisDNum1 = null;
let matHisDNum2 = null;
let matHisNum = null;
let matOrdNum = null;
let matHisDateS = null;
let matHisDateE = null;
let matCode = null;
let operCode = null;
let matOrdOper = null;
let operCodes = null;
let matHisDate = null;
let sDate = null;
let eDate = null;

$(function(){
	
	let Indate = new Date();
    let picker = tui.DatePicker.createRangePicker({
        startpicker: {
            date: Indate,
            input: '#InStartpicker-input',
            container: '#InStartpicker-container'
        },
        endpicker: {
            date: Indate,
            input: '#InEndpicker-input',
            container: '#InEndpicker-container'
        },
        language: 'ko',
        type: 'date',
        format: 'yyyy-MM-dd'
  
    });
    
    let nDate = new Date();
    let npicker = tui.DatePicker.createRangePicker({
        startpicker: {
            date: nDate,
            input: '#nStartpicker-input',
            container: '#nStartpicker-container'
        },
        endpicker: {
            date: nDate,
            input: '#nEndpicker-input',
            container: '#nEndpicker-container'
        },
        language: 'ko',
        type: 'date',
        format: 'yyyy-MM-dd'
  
    });
    
    let MatInDate = new Date();
    var datepicker = new tui.DatePicker('#MatInpicker-container', {
    	language: 'ko',
        date: MatInDate,
        input: {
            element: '#MatInpicker-input',
            format: 'yyyy-MM-dd',
        }
    });
    
	const grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: null,
	    rowHeaders: ['rowNum', 'checkbox'],
	    columns: [
	    	{ 
	    		header: '일련번호', 
	    		name:'matHisDNum', 
	    		hidden: true
	    	},
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
    			editor: "text",
    			formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}
	    	},
			{ 
	    		header: '단가', 
	    		name:'matHisPrice',
    			editor: "text",
    			formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}
	    	},
			{ 
	    		header: '금액', 
	    		name:'amount',
    			editor: "text",
    			formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}
	    	},
			{ 
	    		header: 'Lot No', 
	    		name:'lotNum',
	    		editor: "text"
	    	},
			{ 
	    		header: '자재재고', 
	    		name:'matVol',
	    		formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}
	    	},
	    	{ 
	    		header: '관리번호', 
	    		name:'matHisNum',
	    		hidden: true
	    	},
	    	{ 
	    		header: '업체코드', 
	    		name:'operCode',
	    		hidden: true
	    	},
	    	{ 
	    		header: '입고업체명', 
	    		name:'matOrdOper',
	    		hidden: true
	    	},
	    	{ 
	    		header: '발주일련', 
	    		name:'matOrdNum',
// 	    		hidden: true
	    	}
	    ],
	    summary: {
	        position: 'bottom',
	        height: 30,  // by pixel
	        columnContent: {
	          matCode: '합계',
	          matHisDVol: {
	            template(valueMap) {
	              return valueMap.sum;
	            }
	          }
	        }
	    }
	}); // end const grid
	
	function getList() {
		let data;
		$.ajax({
			async: false,
			url : "MatInMng",
			type : "get",
			data : {
				matHisNum: matHisNum,
				matHisDNum1: matHisDNum1
			},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					matHisDNum1 = result[result.length -1].matHisDNum;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	
	// 자재 미입고 자료 조회
	function getNordList() {
		let data;
		$.ajax({
			async: false,
			url : "NordList",
			type : "get",
			data : {
				matHisNum: matHisNum,
				matOrdNum: matOrdNum,
				matHisDNum1: matHisDNum1,
				matComDateS: matComDateS,
				matComDateE: matComDateE,
				operName: operName
			},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					matHisDNum1 = result[result.length -1].matHisDNum;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	// END 자재 미입고 자료 조회
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getList());
	})
	
	const grid2 = new tui.Grid({
	    el: document.getElementById('grid2'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: getMatInDayList(),
	    rowHeaders: [
	    	{type:'rowNum'}, {type:'checkbox', header: ' '}
	    ],
	    columns: [
	    	{ 
	    		header: '입고일자', 
	    		name:'matHisDate'
	    	},
			{ 
	    		header: '입고번호', 
	    		name:'matHisNum'
	    	},
			{ 
	    		header: '입고업체명', 
	    		name:'matOrdOper'
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

	function getMatInDayList() {
		let data;
		$.ajax({
			async: false,
			url : "MatInDayList",
			type : "get",
			data : {
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
	
	$('#mobile-collapse').click(function() {
	      grid.refreshLayout();
	   });
	   
	$('#matInDayBtn').click(function(){
		matHisNum1 = null;
		grid2.resetData(getMatInDayList());
		$("#myModal").modal("toggle");
		$("#myModal").on('shown.bs.modal', function () {
			grid2.refreshLayout();
		});
		
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
	
	// 자재 입고 관리 수정 및 생성
	matInSaveBtn.onclick = function(){
		let gridData = grid.getModifiedRows({});
		
		gridData["materialHistoryVO"]={
 				matHisDate : $("#MatInpicker-input").val()
				,operCode : $("#operCode").val()
				,operName : $("#operName").val()
				,matHisNum :  matHisNum
				}
		console.log(gridData);
		console.log(matHisNum);
		
		if($('#operCode').val()==""){
			alert('입고 업체를 넣어주세요.');
		} else {
		
		$.ajax({
			async: false,
			url: "matHisMngUpdate",
			type : "post",
			data : JSON.stringify(gridData),
			dataType: "json",
			contentType: "application/json",
			success : function(data){
				console.log(data);
				matHisNum = data;
			}
		});
		console.log(matHisNum);
		matHisDNum1 = null;
		}
		
	}
	
	resetBtn.onclick=function(){
		grid.clear();
	}

	// 일입고리스트 모달창 단일 체크 구현
	grid2.on('check', (e) => {
		let rows = grid2.getCheckedRowKeys();
		if(rows.length > 1) {
			for(let i in rows){
				if(e.rowKey != rows[i]){
					grid2.uncheck(rows[i]);
				}
			}
		}
	});
	
	/* 일 입고 자료 리스트 검색 모달 */
	modalY.onclick=function() {
		matHisDate = null;
		if(grid2.getCheckedRows() != null){
			matHisDNum1 = null;
			console.log("일 입고 자료 리스트 검색 모달 '예' 버튼");
			console.log(grid2.getCheckedRows()[0]);
			operCode = grid2.getCheckedRows()[0].operCode;
			operName = grid2.getCheckedRows()[0].matOrdOper;
			matHisDate = grid2.getCheckedRows()[0].matHisDate;
			matHisNum = grid2.getCheckedRows()[0].matHisNum;
			grid.resetData(getList());
			
		}
		console.log(operCode);
		console.log(matHisDate);
		console.log(operName);
		console.log(matHisNum);
		console.log('======================');
	
	grid2.resetData(getMatInDayList());
	document.getElementById("MatInpicker-input").value=matHisDate;
	document.getElementById("operCode").value=operCode;
	document.getElementById("operName").value=operName;
	document.getElementById("matHisNum").value=matHisNum;
	}
	
	grid2.on('scrollEnd', () => {
		  grid2.appendRows(getMatInDayList());
		})
	
	searchBtn.onclick = function(){
		matHisNum1 = null;
		console.log(matHisNum1)
		
		sDate = $(".modal-body").find('input[name="sDate"]').val();
		console.log(sDate)
		eDate = $(".modal-body").find('input[name="eDate"]').val();
		console.log(eDate)
		
		grid2.resetData(getMatInDayList());
	}
	
	// 그리드 행 추가
	addRowBtn.onclick = function(){
		grid.appendRow();
	}
	
	// 그리드 행 삭제
	deleteRowBtn.onclick = function(){
		grid.removeCheckedRows(true);
	}
	
	nOrdBtn.onclick = function(){
		matHisDNum1 = null;
		matHisNum = null;
		console.log(matHisDNum1)
		grid.clear();

		matComDateS = $('input[name="matComDateS"]').val();
		console.log(matComDateS)
		matComDateE = $('input[name="matComDateE"]').val();
		console.log(matComDateE)
		operCode = $('input[name="operCode"]').val();
		console.log(operCode)
		operName = $('input[name="operName"]').val();
		console.log(operName)
		
		if($('#operCode').val()==""){
			alert('입고 업체를 넣어주세요.');
		} else{
			let nordList = getNordList();
			for(let i in nordList){
				grid.appendRow(nordList[i]);
				/* if(grid.getCheckedRows() != null){
					matHisDNum1 = null;
					console.log("미입고 자료 조회 버튼");
					matHisNum = grid2.getCheckedRows()[0].matHisNum;
					console.log(matHisNum)
				} */
			}
		}
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
							<!-- 타이틀 -->
							<div id="title">
								<h3>자재 입고 관리</h3>
								<br />
							</div>
							<!-- // 타이틀 -->
							<div class="text-right">
								<button id="matInDayBtn" type="button"
									class="btn btn-info btn-sm">조회</button>
								<input id="resetBtn" class="btn btn-info btn-sm" type="reset"
									value="리셋"></input>
								<button type="button" id="matInSaveBtn" name="matInSaveBtn"
									class="btn btn-info btn-sm">저장</button>
								<button type="button" id="matInDeleteBtn" name="matInDeleteBtn"
									class="btn btn-info btn-sm">삭제</button>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="table">
										<table class="table">
											<tr>
												<td>
													<div class="d-inline-block align-middle">입고 일자 *</div>
												</td>
												<td>
													<div class="row align-items-center text-center col-lg-12">
														<div
															class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
															<input type="text" id="MatInpicker-input"
																class=" form-control w-25" aria-label="Date-Time"
																name="matHisDate" /> <span class="tui-ico-date"></span>
															<div id="MatInpicker-container"
																style="margin-left: -1px;"></div>
														</div>
														<div id="date1" style="margin-top: -1px;"></div>
													</div>
												</td>
											</tr>
											<tr>
												<td><label class="col-form-label text-center">입고업체
														*</label></td>
												<td>
													<div class="row align-items-center text-center col-lg-12">
														<input type="text" class="form-control w-25 ml-3"
															id="operCode" name="operCode"></input> <input type="text"
															class="form-control w-25 ml-3" id="operName"
															name="operName" readonly></input>
														<%@ include
															file="/WEB-INF/jsp/mes/common/modal/OperationList.jsp"%>
													</div>
												</td>
											</tr>
											<tr>
												<td><label class="col-form-label text-center">입고번호</label>
												</td>
												<td>
													<div class="row align-items-center text-center col-lg-12">
														<input type="text" readonly name="matHisNum"
															id="matHisNum" class=" form-control w-25 ml-3" />
													</div>
												</td>
											</tr>
										</table>
									</div>
								</div>
								<div class="col-md-6">
									<div class="card">
										<div class="card-body">
											<h5 class="d-inline-block pt-3">미입고 자료</h5>
											<div class="row mt-3 mb-3 pb-3 pt-3">
												<div class="d-inline-block align-middle ml-3">일자 *</div>
												<div
													class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
													<input type="text" id="nStartpicker-input"
														class=" form-control w-25" aria-label="Date-Time"
														name="matComDateS" /> <span class="tui-ico-date"></span>
													<div id="nStartpicker-container" style="margin-left: -1px;"></div>
												</div>
												<div id="date4" style="margin-top: -1px;"></div>
												<div
													class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
													<input type="text" id="nEndpicker-input"
														class=" form-control w-25" aria-label="Date-Time"
														name="matComDateE" /> <span class="tui-ico-date"></span>
													<div id="nEndpicker-container" style="margin-left: -1px;"></div>
												</div>
												<div id="date5" style="margin-top: -1px;"></div>
												<input type="button" id="nOrdBtn" name="nOrdBtn"
													class="btn btn-info btn-sm" value="미입고 자료 조회" />

											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-12 text-right">
									<button type="button" class="btn btn-primary btn-sm"
										id="addRowBtn">추가</button>
									<button type="button" class="btn btn-primary btn-sm"
										id="deleteRowBtn">삭제</button>
								</div>
							</div>
							<div class="row">
								<div class="col-xl-12">
									<div id="grid" />
								</div>
							</div>


						</div>
					</div>
				</div>
			</div>
		</div>
	</form:form>

	<!-- 일 입고 자료 리스트 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">일 입고 자료 LIST</h4>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						&times;
					</button>
				</div>
				<div class="modal-body">
					<div>
						<div class="d-inline-block align-middle">입고 일자 *</div>
						<div
							class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
							<input type="text" id="InStartpicker-input"
								class=" form-control w-25" aria-label="Date-Time" name="sDate" />
							<span class="tui-ico-date"></span>
							<div id="InStartpicker-container" style="margin-left: -1px;"></div>
						</div>
						<div id="date2" style="margin-top: -1px;"></div>
						<div
							class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
							<input type="text" id="InEndpicker-input"
								class=" form-control w-25" aria-label="Date-Time" name="eDate" />
							<span class="tui-ico-date"></span>
							<div id="InEndpicker-container" style="margin-left: -1px;"></div>
						</div>
						<div id="date3" style="margin-top: -1px;"></div>
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