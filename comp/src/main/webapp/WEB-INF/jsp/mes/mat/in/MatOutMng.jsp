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
let matHisNum = null;
let matHisNum1 = null;
let matHisDNum = null;
let matHisDNum1 = null;
let matCode = null;
let prcCode = null;
let matOut = null;
let matHisDate = null;
let sDate = null;
let eDate = null;

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
	    	{ 
	    		header: '일련번호', 
	    		name:'matHisDNum', 
	    		hidden: true
	    	},
	    	{ 
	    		header: '관리번호', 
	    		name:'matHisNum',
	    		hidden: true
	    	},
	    	{ 
	    		header: '공정코드', 
	    		name:'prcCode',
	    		hidden: true
	    	},
	    	{ 
	    		header: '공정명', 
	    		name:'matOut',
	    		hidden: true
	    	},
	    	{ 
	    		header: '자재코드',
	    		name:'matCode'
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
				header: '출고량',
				name:'matHisDVol'
			},
			{ 
				header: 'Lot No',
				name:'lotNum'
			},
			{ 
				header: '자재재고',
				name:'matVol'
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
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getList());
	  })
	  
	function getList() {
		let data;
		$.ajax({
			async: false,
			url : "MatOutMng",
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
	    rowHeaders: [
	    	{ type:'rowNum' },
	    	{ type:'checkbox', header: ' ' }
	    	],
	    columns: [
	    	{ 
	    		header: '출고일자', 
	    		name:'matHisDate'
	    	},
			{ 
	    		header: '출고번호', 
	    		name:'matHisNum'
	    	},
			{ 
	    		header: '출고경로', 
	    		name:'matOut'
	    	},
			{ 
	    		header: '건수', 
	    		name:'matHisVol'
	    	},
	    	{ 
	    		header: '공정코드', 
	    		name:'prcCode',
	    		hidden: false
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
		matHisNum1 = null;
		console.log('일 반품 자료 리스트 검색 버튼 test')
		
		sDate = $(".modal-body").find('input[name="sDate"]').val();
		console.log(sDate)
		eDate = $(".modal-body").find('input[name="eDate"]').val();
		console.log(eDate)
		
		grid2.resetData(getMatOutDayList());
	}
	
	// 일 출고 자료 리스트 모달창 단일 체크 구현
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
	
	// 일 출고 자료 리스트 검색 모달
	modalY.onclick=function() {
		matHisDate = null;
		if(grid2.getCheckedRows() != null){
			matHisDNum1 = null;
			console.log("일 반품 자료 리스트 검색 모달 '예' 버튼");
			console.log(grid2.getCheckedRows()[0]);
			prcCode = grid2.getCheckedRows()[0].prcCode;
			prcName = grid2.getCheckedRows()[0].matOut;
			matHisDate = grid2.getCheckedRows()[0].matHisDate;
			matHisNum = grid2.getCheckedRows()[0].matHisNum;
			grid.resetData(getList());
			
		}
		console.log(prcCode);
		console.log(matHisDate);
		console.log(prcName);
		console.log(matHisNum);
		console.log('======================');
	
	grid2.resetData(getMatOutDayList());
	document.getElementById("MatOutpicker-input").value=matHisDate;
	document.getElementById("prcCode").value=prcCode;
	document.getElementById("prcName").value=prcName;
	}
	
	$('#mobile-collapse').click(function() {
	      grid.refreshLayout();
	   });
	
	resetBtn.onclick=function(){
		grid.clear();
	}
	
	// 자재 입고 관리 수정 및 생성
	matOutSaveBtn.onclick = function(){
		let gridData = grid.getModifiedRows({});
		
		gridData["materialHistoryVO"]={
 				matHisDate : $("#MatInpicker-input").val()
				,prcCode : $("#prcCode").val()
				,matHisNum :  matHisNum
				}
		console.log(gridData);
		
		$.ajax({
			async: false,
			url: "matHisOutMngUpdate",
			type : "post",
			data : JSON.stringify(gridData),
			dataType: "json",
			contentType: "application/json",
			success : function(data){
				console.log(data);
				matHisNum = data;
			}
		});
		
		matHisDNum1 = null;
		grid.resetData(getList());
		
	}
	
	// 그리드 행 추가
	addRowBtn.onclick = function(){
		grid.appendRow();
	}
	
	// 그리드 행 삭제
	deleteRowBtn.onclick = function(){
		grid.removeCheckedRows(true);
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
								<h3>자재 출고 조회</h3>
								<br />
							</div>
							<!-- // 타이틀 -->
							<div>
								<div class="d-inline-block align-middle">출고 일자</div>
								<div
									class="tui-datepicker-input tui-datetime-input tui-has-focus ml-3">
									<input type="text" id="MatOutpicker-input"
										class=" form-control w-25" aria-label="Date-Time"
										name="matHisDate" /> <span class="tui-ico-date"></span>
									<div id="MatOutpicker-container" style="margin-left: -1px;"></div>
								</div>
								<div id="date1" style="margin-top: -1px;"></div>
							</div><br />
							<div>
								출고 공정 <input type="text" id="prcCode" name="prcCode" /> 출고 공정명
								<input type="text" disabled id="prcName" name="prcName" />
<%-- 								<%@ include
									file="/WEB-INF/jsp/mes/common/modal/ProcessList.jsp"%> --%>
							</div><br />
							<div>
								<button id="matOutDayBtn" type="button"
									class="btn btn-info btn-sm">조회</button>
								<input id="resetBtn" class="btn btn-info btn-sm" type="reset"
									value="리셋"></input>
								<!-- <button type="button" id="matOutSaveBtn" name="matOutSaveBtn"
									class="btn btn-info btn-sm">저장</button>
								<button type="button" id="matOutDeleteBtn" name="matInDeleteBtn"
									class="btn btn-info btn-sm">삭제</button> -->
							</div>
							<br />
							<div class="page-wrapper">
								<!-- <div class="text-right">
									<button type="button" class="btn btn-primary btn-sm"
										id="addRowBtn">추가</button>
									<button type="button" class="btn btn-primary btn-sm"
										id="deleteRowBtn">삭제</button>
								</div> -->
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
					<h4 class="modal-title" id="exampleModalLabel">일 출고 자료 LIST</h4>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						&times;
					</button>
				</div>
				<div class="modal-body">
					<div>
						<div class="d-inline-block align-middle">출고 일자 *</div>
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
