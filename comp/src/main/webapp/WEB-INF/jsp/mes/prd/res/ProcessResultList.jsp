<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : ProcessResultList.jsp
  * @Description : ProcessResult List 화면
  * @Modification Information
  * 
  * @author seongwon
  * @since 20210706
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
let prcResDNum = null;
let prcResDNum1 = null;
let prdComNum = null;
let prdComDNum = null
let ordDNum = null
let data;
let prcCode = null;

let empId = null;
let macCode = null;
let macName = null;
let prcState = null;
let prcEndTime = null;
let prcStrTime = null;
let macCode1 = null;

let prcResNo = 0;
let prcBefState = null;

$(function(){
	const grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: null,
	    rowHeaders: ['rowNum'],
	    columns: [
	    	{ header: '작업시작날짜', name:'prdComDDate'},
	    	{ header: '지시번호', name:'prdComNum'},
	    	{ header: '제품코드', name:'itmCode'},
	    	{ header: '순번', name:'prcResNo'},
			{ header: '제품명', name:'itmName'},
			{ header: '입고량', name:'prcComDVol'},
			{ header: '작업량', name:'prcResVol'},
			{ header: '미실적량', name:'prcNVol'},
			{ header: '지시구분', name:'prcComDiv'},
	    ]
	}); // end const grid
	function getProcessResulList() { 
		$.ajax({
			async: false, 
			url : "ProcessResultList",
			type : "get",
			data : {
				prcResDNum1 : prcResDNum1,
				prcCode : prcCode
				},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					prcResDNum1 = result[result.length -1].prcResDNum;
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
	    data: null,
	    rowHeaders: ['rowNum'],
	    columns: [
	    	{ header: '순서', name:'prdComMatO'},
	    	{ header: '소재LOT_NO', name:'lotNum'},
	    	{ header: '입고량', name:'prcComDVol'},
	    	{ header: '기실적량', name:'prcResVol'},
			{ header: '미실적량', name:'prcNVol'},
			{ header: '불량량', name:'prcErrVol'},
			{ header: '상태', name:'prcFState', escapeHTML:false},
	    ]
	});
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getProcessResulList());
	  });
	
	$('#mobile-collapse').click(function() {
	      grid.refreshLayout();
	   });
	search.onclick = function() {
		prcResDNum1 = null;
		if($('#prcCode').val() == '') {
			$.toast({ 
				  text : "공정코드입력해주세요.", 
				  showHideTransition : 'slide',
				  bgColor : 'red',
				  textColor : 'white',
				  allowToastClose : false,
				  hideAfter : 2000,
				  stack : 1,
				  textAlign : 'center',
				  position : 'top-center'
				});
			return null;
			}
			prcCode = $("input#prcCode").val();
			grid.resetData(getProcessResulList());
			$( 'td#prdComNum' ).text('');
			$( 'td#itmCode' ).text('');
			$( 'td#itmName' ).text('');
			$( 'td#operName' ).text('');
			$( 'td#prcComDVol' ).text('');
			$( 'td#prcResVol' ).text('');
			$( 'td#prcNVol' ).text('');
			let testt=[];
			grid3.resetData(testt);
		}
	grid.on('dblclick', () => { 
		let key = grid.getFocusedCell()['rowKey'];
		let result = grid.getColumnValues('prcResDNum')[key];
		ordDNum = grid.getData()[key]['ordDNum'];
		getProcessResultSelect(result);
		prdComDNum = grid.getColumnValues('prdComDNum')[key];
		prcCode = grid.getColumnValues('prcCode')[key];;
		grid3.resetData(getProduceSelect(prdComDNum,prcCode));
		
	});
	
function getProcessResultSelect(key) { 
		$.ajax({
			async: false, 
			url : "ProcessResultSelect",
			type : "get",
			data : {
				prcResDNum : key
				,ordDNum : ordDNum
				},
			dataType: "json",
			success : function(result){
				console.log(result);
				$( 'td#prdComNum' ).text(result[0]['prdComNum']);
				$( 'td#itmCode' ).text(result[0]['itmCode']);
				$( 'td#itmName' ).text(result[0]['itmName']);
				$( 'td#prcComDVol' ).text(result[0]['prcComDVol']);
				$( 'td#prcResVol' ).text(result[0]['prcResVol']);
				$( 'td#prcNVol' ).text(result[0]['prcNVol']);
				if( result[0]['operName'] == null || result[0]['operName'] ==""){
					
					$( 'td#operName' ).text('');
					
				}
				else{
					$( 'td#operName' ).text(result[0]['operName']);
				}
				
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	function getProduceSelect(prdComDNum,prcCode) { 
		$.ajax({
			async: false, 
			url : "ProduceSelect",
			type : "get",
			data : {
				prdComDNum : prdComDNum,
				prcCode : prcCode,
				ordDNum : ordDNum
				},
			dataType: "json",
			success : function(result){
				for(let i = 0; i<result.length; i++){
					console.log(result[i]['prcFState']);
					if(result[i]['prcState'] =='진행'){
						result[i]['prcFState'] = '<div align="center"><div style="height: 15px; width: 20px; background-color: yellow;"></div></div>'
					}
					else if(result[i]['prcState'] =='완료'){
						if(result[i]['prcFState']=='진행'){
							result[i]['prcFState'] = '<div align="center"><div style="height: 15px; width: 20px; background-color: green;"></div></div>'
						}else{
							result[i]['prcFState'] = '<div align="center"><div style="height: 15px; width: 20px; background-color: blue;"></div></div>'
						}
					}else{
						result[i]['prcFState'] = '<div align="center"><div style="height: 15px; width: 20px; background-color: red;"></div></div>'
					}
					
					
					
					
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}

	
	

	const grid4 = new tui.Grid({
	    el: document.getElementById('grid4'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 100,
	    data: null,
	    rowHeaders: ['rowNum'],
	    columns: [
			{ header: '입고량', name:'prcComDVol'},
			{ header: '작업량', name:'prcResVol',editor:"text"},
			{ header: '불량량', name:'prcErrVol',editor:"text"},
			{ header: '비고', name:'prcResultDNote',editor:"text"}
	    ]
	});
	grid3.on('dblclick', () => { 
		let key = grid3.getFocusedCell()['rowKey'];
		
			prcResDNum = grid3.getColumnValues('prcResDNum')[key];
			
			empId = grid3.getColumnValues('empId')[key]
			macCode = grid3.getColumnValues('macCode')[key]
			grid4.resetData(setProduceSelect(prcResDNum));
			
			$('#myModal').modal('toggle');
			$('#myModal').on('shown.bs.modal', function(){
				 grid4.refreshLayout();
			});
		
	});
	
	function setProduceSelect(key) { 
		$.ajax({
			async: false, 
			url : "SetProduceSelect",
			type : "get",
			data : {
				prcResDNum : key
				,empId : empId
				,macCode : macCode
				},
			dataType: "json",
			success : function(result){
				console.log(result);
				data = result;
				$( 'input#prdComDDate' ).val(result[0]['prdComDDate']);
				$( 'input#prdComNum' ).val(result[0]['prdComNum']);
				$( 'input#prcNameM' ).val(result[0]['prcName']);
				$( 'input#prcWorkNum' ).val(result[0]['prcWorkNum']);
				$( 'input#empName' ).val(result[0]['empName']);
				$( 'input#empId' ).val(result[0]['empId']);
				if(result[0]['macCode'] !=null){
				macCode = result[0]['macCode'];
					
				}
				if(result[0]['empId'] !=null){
				empId = result[0]['empId'];
					}
				$( 'input#macName' ).val(result[0]['macName']);
				$( 'input#macCode' ).val(result[0]['macCode']);
				$( 'input#prcStrTime' ).val(result[0]['prcStrTime']);
				$( 'input#prcEndTime' ).val(result[0]['prcEndTime']);
				prcStrTime =result[0]['prcStrTime'];
				prcEndTime =result[0]['prcEndTime'];
				prcBefState =result[0]['prcBefState'];
				prcResNo = result[0]['prcResNo'];
				console.log(result[0]['prcResVol']+result[0]['prcErrVol']);
				if(result[0]['prcResVol']+result[0]['prcErrVol'] < result[0]['prcComDVol'] || result[0]['prcEndTime'] != null || prcBefState == "진행"){
					$("#prcEnd").attr("disabled", true);

				}
				if(result[0]['prcResVol']+result[0]['prcErrVol'] == result[0]['prcComDVol'] && result[0]['prcEndTime'] == null && prcBefState != "진행"){
					$("#prcEnd").attr("disabled", false);

				}

			} // end success
		}); // end ajax 
		return data;
	}
	save.onclick= function() {
		
		if($('input#empId').val() != empId && empId !=null) {
			//토스트메시지 
			$.toast({ 
				  text : "작업자 변경 불가", 
				  showHideTransition : 'slide',
				  bgColor : 'red',
				  textColor : 'white',
				  allowToastClose : false,
				  hideAfter : 2000,
				  stack : 1,
				  textAlign : 'center',
				  position : 'top-center'
				});
			return null;
		}
		if($('input#macCode').val() != macCode && macCode !=null) {
			//토스트메시지 
			$.toast({ 
				  text : "작업중인 설비 변경 불가", 
				  showHideTransition : 'slide',
				  bgColor : 'red',
				  textColor : 'white',
				  allowToastClose : false,
				  hideAfter : 2000,
				  stack : 1,
				  textAlign : 'center',
				  position : 'top-center'
				});
			return null;
		}
		if($('input#prcStrTime').val() == "") {
			//토스트메시지 
			$.toast({ 
				  text : "시작되지 않은 작업", 
				  showHideTransition : 'slide',
				  bgColor : 'red',
				  textColor : 'white',
				  allowToastClose : false,
				  hideAfter : 2000,
				  stack : 1,
				  textAlign : 'center',
				  position : 'top-center'
				});
			return null;
		}
		let comDVol = grid4.getData()[0]['prcComDVol'];
		comDVol *=1;
		let resVol = grid4.getData()[0]['prcResVol'];
		resVol *=1;
		let errVol = grid4.getData()[0]['prcErrVol'] ;
		errVol *=1;
		if(comDVol < resVol+errVol) {
			//토스트메시지 
			$.toast({ 
				  text : "작업량확인하세요", 
				  showHideTransition : 'slide',
				  bgColor : 'red',
				  textColor : 'white',
				  allowToastClose : false,
				  hideAfter : 2000,
				  stack : 1,
				  textAlign : 'center',
				  position : 'top-center'
				});
			return null;
		}
	
		
		let gridData = grid4.getModifiedRows({});
		gridData["processResultVO"] ={
										macCode : $('input#macCode').val(),
										empId : $('input#empId').val()
										
										}
		console.log(gridData);
			$.ajax({
			async: false, 
			url : "resultSuccess",
			type : "post",
			data : JSON.stringify(gridData),
			dataType: "json",
			contentType:"application/json",
			success : function(result){
				console.log("updatesuccess");
				
			}
			});
		grid3.resetData(getProduceSelect(prdComDNum,prcCode));
		prcResDNum1=null;
		grid.resetData(getProcessResulList());
		macCode = $('input#macCode').val();
		empId = $('input#empId').val();
		grid4.resetData(setProduceSelect(prcResDNum));
		
			
	}

	prcEnd.onclick = function() {
		if(prcEndTime != null) {
			//토스트메시지 
			$.toast({ 
				  text : "종료된작업입니다", 
				  showHideTransition : 'slide',
				  bgColor : 'red',
				  textColor : 'white',
				  allowToastClose : false,
				  hideAfter : 2000,
				  stack : 1,
				  textAlign : 'center',
				  position : 'top-center'
				});
			return null;
		}
		if(prcBefState != "완료" && prcResNo > 1) {
			//토스트메시지 
			$.toast({ 
				  text : "이전공정이 완료되지 않았습니다", 
				  showHideTransition : 'slide',
				  bgColor : 'red',
				  textColor : 'white',
				  allowToastClose : false,
				  hideAfter : 2000,
				  stack : 1,
				  textAlign : 'center',
				  position : 'top-center'
				});
			return null;
		}
		let prcErrVol = grid4.getData()[0]['prcErrVol'];
		prcErrVol *=1;
		let prcResVol = grid4.getData()[0]['prcResVol'];
		prcResVol *=1;
		let prcStrVol = grid4.getData()[0]['prcComDVol']
		prcStrVol *=1;
		if(prcStrVol !=  prcErrVol+prcResVol){
			$.toast({ 
				  text : "작업이종료되지않았습니다", 
				  showHideTransition : 'slide',
				  bgColor : 'red',
				  textColor : 'white',
				  allowToastClose : false,
				  hideAfter : 2000,
				  stack : 1,
				  textAlign : 'center',
				  position : 'top-center'
					  
				});
			return null;
		}
		let dateTime = new Date();
		let dateDate = new Date();
		let time = formatTime(dateTime);
		let date = formatDate(dateDate);
		$('input#prcEndTime').val(time);
		let list = {prcEndTime : date
					,prcResDNum : prcResDNum} ;
			
		$.ajax({
			async: false, 
			url : "updatePrcEnd",
			type : "post",
			data : JSON.stringify(list),
			dataType: "json",
			contentType:"application/json",
			success : function(){
				
				}
			});
		prcResDNum1=null;
		grid.resetData(getProcessResulList());
		grid3.resetData(getProduceSelect(prdComDNum,prcCode));
	$("#myModal").modal("toggle");
	}
		
	prcStr.onclick = function() {
		if($('input#empId').val() == '') {
			//토스트메시지 
			$.toast({ 
				  text : "작업자를 입력해주세요.", 
				  showHideTransition : 'slide',
				  bgColor : 'red',
				  textColor : 'white',
				  allowToastClose : false,
				  hideAfter : 2000,
				  stack : 1,
				  textAlign : 'center',
				  position : 'top-center'
				});
			return null;
		}
		if($('input#macCode').val() == '') {
			//토스트메시지 
			$.toast({ 
				  text : "설비를 입력해주세요.", 
				  showHideTransition : 'slide',
				  bgColor : 'red',
				  textColor : 'white',
				  allowToastClose : false,
				  hideAfter : 2000,
				  stack : 1,
				  textAlign : 'center',
				  position : 'top-center'
				});
			return null;
		}
		if(prcStrTime != null) {
			//토스트메시지 
			$.toast({ 
				  text : "이미시작된작업입니다", 
				  showHideTransition : 'slide',
				  bgColor : 'red',
				  textColor : 'white',
				  allowToastClose : false,
				  hideAfter : 2000,
				  stack : 1,
				  textAlign : 'center',
				  position : 'top-center'
				});
			return null;
		}
		let dateTime = new Date();
		let dateDate = new Date();
		let time = formatTime(dateTime);
		let date = formatDate(dateDate);
		 $("input#prcStrTime").val(time);
		 let strMacCode = $('input#macCode').val();
		 let strEmpId = $('input#empId').val();
		let list = {prcStrTime : date
					,prcResDNum : prcResDNum
					, macCode : strMacCode
					, empId : strEmpId} ;
			
		$.ajax({
			async: false, 
			url : "updatePrcStr",
			type : "post",
			data : JSON.stringify(list),
			dataType: "json",
			contentType:"application/json",
			success : function(){
				
				}
			});
		
	}
	 function leadZero(num, n) {
         var leadZero = "";
         num = num.toString();
         if (num.length < n) {
        	 for (var i = 0; i < n - num.length; i++) leadZero += "0"; }
         return leadZero + num;
     }
	 function formatDate(dateDate) {
			let date =dateDate.getFullYear() + "-" + leadZero((dateDate.getMonth() + 1), 2) + "-" 
         + leadZero(dateDate.getDate(), 2) + "  " + leadZero(dateDate.getHours(), 2) + ":" 
         + leadZero(dateDate.getMinutes(), 2) + ":" + leadZero(dateDate.getSeconds(), 2);
         return date;
     }
	 function formatTime(dateTime){
			let time = leadZero(dateTime.getHours(), 2) + ":" 
	         + leadZero(dateTime.getMinutes(), 2) + ":" + leadZero(dateTime.getSeconds(), 2);
		    return time;
		}
	 
	 
	 const usableMachine = new tui.Grid({
		    el: document.getElementById('usableMachine'),
		    scrollX: false,
		    scrollY: true,
		    bodyHeight: 200,
		    rowWidth: 100,
		    data: null,
		    rowHeaders: ['rowNum',{type:'checkbox',header:' '}],
		    columns: [
		    	{ header: '설비코드', name:'macCode'},
				{ header: '설비명', name:'macName'},
		    ]
		}); // end const grid
		
		
		  
		function getUsalbeMachine() {
			let data;
			$.ajax({
				async: false,
				url : "${pageContext.request.contextPath}/usableMachine",
				type : "get",
				data : {macCode1: macCode1,
					    prcResDNum : prcResDNum},
				dataType: "json",
				success : function(result){
					if(result.length > 0) {
						macCode1 = result[result.length -1].macCode;
					}
					console.log(result);
					data = result;
				} // end success
			}); // end ajax 
			return data;
		}
		usableMachine.on('scrollEnd', () => {
			usableMachine.appendRows(getUsalbeMachine());
		  })
		  
		$('#mobile-collapse').click(function() {
			usableMachine.refreshLayout();
		});
		
		$('#searchMacBtn').click(function(){
			macCode1= null;
			usableMachine.resetData(getUsalbeMachine());
			$("#macModal").modal("toggle");
			$("#macModal").on('shown.bs.modal', function () {
				usableMachine.refreshLayout();
			});
		});
		
		$('#choiceM').click(function(){
			
			$('input[id="macCode"]').val(usableMachine.getCheckedRows()[0]['macCode']);
			$('input[id="macName"]').val(usableMachine.getCheckedRows()[0]['macName']);
			$("#macModal").modal("toggle");
		});
		
		$('#btnM').click(function(){
			$("#macModal").modal("toggle");
		});
		
			usableMachine.on('check', (e) => {
		let rows = usableMachine.getCheckedRowKeys(); 
		if(rows.length > 1) { 
			for(let i in rows){ 
				if(e.rowKey != rows[i]){ 
					usableMachine.uncheck(rows[i]); 
					} 
				}
		}
	})
	dataReset.onclick = function() {
				if(grid4.getData()[0]['prcState'] == "완료"){
					$.toast({ 
						  text : "종료된작업은 초기화불가", 
						  showHideTransition : 'slide',
						  bgColor : 'red',
						  textColor : 'white',
						  allowToastClose : false,
						  hideAfter : 2000,
						  stack : 1,
						  textAlign : 'center',
						  position : 'top-center'
						});
					return null;
				}
			let list = {prcResDNum : prcResDNum} ;
				
			$.ajax({
				async: false, 
				url : "dataReset",
				type : "post",
				data : JSON.stringify(list),
				dataType: "json",
				contentType:"application/json",
				success : function(){
					
					}
				});
			prcResDNum1 = null;
			grid.resetData(getProcessResulList());
			grid3.resetData(getProduceSelect(prdComDNum,prcCode));
			grid4.resetData(setProduceSelect(prcResDNum));
			
	}
		
		
	 
	 
})
	
</script>
</head>

<body>
	<div class="page-header">
		<div class="page-block">
			<div class="row align-items-center">
				<div class="col-md-8">
					<div class="page-header-title">
						<h5 class="m-b-10">공정실적관리</h5>
					</div>
				</div>
				<div class="col-md-4">
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/index.jsp"> <i
								class="fa fa-home"></i>
						</a></li>
						<li class="breadcrumb-item">생산관리</li>
						<li class="breadcrumb-item"><a href="#!">공정실적관리</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
<!-- 공정실적관리List -->
	<div class="pcoded-inner-content">
			<div class="main-body">
				<div class="page-wrapper">
					<div align="right" style="margin-top: 5px">
						<button type ="button" class="btn btn-info btn" id ="search" name = "search">검색</button>
					</div>
					<br/>
					<div class="row">
						<div class="d-inline-block col-xl-12">
						
							<div class="card">
								<!-- 타이틀 -->
								<div id="title" class="card-header">
									<table>
										<tr>
											<td><div class="mr-3">공정코드</div></td>
											<td><input class="form-control" type="text" id="prcCode" name ="prcCode" /></td>
											<td><%@ include file="/WEB-INF/jsp/mes/common/modal/ProcessList.jsp" %></td>
											<td><div class="ml-3 mr-3">공정명</div></td>
											<td><input  class="form-control" type="text" id="prcName" name ="prcName" readonly="readonly"/></td>
										</tr>
									</table>
										
									</ul>
									<ul>
										
									</ul>
									<ul>
										
									</ul>
								</div>

								<!-- // 타이틀 -->
								<!-- List -->
								<div id="grid"></div>
							</div>
						</div>

					</div>
<!-- 		123 -->
					<div class="row">
						<div class="col-xl-4">
						
							<div class="card pt-3">
								<!-- 타이틀 -->
								<div class="ml-3 mt-2"><p class="font-weight-bold" style="font-size:15px">작업실적대상제품자료</p></div>
								<div id="table1">
									<table class = "table" >
										<tr>
											<th>작업 지시 번호</th>
											<td id="prdComNum" name="prdComNum"></td>
										</tr>
										<tr>
											<th>제품코드</th>
											<td id="itmCode" name="itmCode"></td>
										</tr>
										<tr>
											<th>제품명</th>
											<td id="itmName" name="itmName"></td>
										</tr>
										<tr>
											<th>고객사</th>
											<td id="operName" name="operName"></td>
										</tr>
										<tr>
											<th>입고량</th>
											<td id="prcComDVol" name="prcComDVol"></td>
										</tr>
										<tr>
											<th>포장량</th>
											<td id="prcResVol" name="prcResVol"></td>
										</tr>
										<tr>
											<th>미포장량</th>
											<td id="prcNVol" name="prcNVol"></td>
										</tr>
									
									</table>
								</div>
							</div>
						</div>
						<div class="col-xl-8">
						
							<div class="card pt-3">
								<!-- 타이틀 -->
								<div class="ml-3 mt-2"><p class="font-weight-bold" style="font-size:15px">list</p></div>
								<!-- // 타이틀 -->
								<!-- List -->
								<div id="grid3"></div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>


<div class="modal fade bd-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
		<div class="modal-dialog modal-lg" role="document" >
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">공정실적관리</h4>
				</div>
				<div class="modal-body" name = "res" id = "res" >
						<div class="form-group row">
							<table class="table">
								<tr>
										
									<th>작업일자</th>
									<td><input id = "prdComDDate" namd = "prdComDDate"/></td>
									<th>공정명</th>
									<td><input id = "prcNameM" namd = "prcNameM" readonly="readonly"/></td>
									<th>작업자</th>
									<td><input id = "empName" namd = "empName" /><%@ include file="/WEB-INF/jsp/mes/common/modal/EmployeesList.jsp" %></td>									
								   <input type="hidden" id="empId" name = "empId"/>
									
									
								</tr>
								<tr >
									<th>지시번호</th>
									<td><input id = "prdComNum" namd = "prdComNum" readonly="readonly"/></td>
									<td></td>
									<td></td>
									<th>설비</th>
									<td><input id = "macName" namd = "macName" />
									<button type="button" class="btn btn-info btn-sm" id="searchMacBtn"
									 data-toggle="modal" data-target="#macModal">검색</button></td>
									
									<input type="hidden" id="macCode" name = "macCode"/>
								</tr>
								<tr>
									<th colspan="2" style="text-align: center;">시작시간</th>
									<td ><input id = "prcStrTime" namd = "prcStrTime" readonly="readonly"/></td>
									<th colspan="2" style="text-align: center;" >종료시간</th>
									<td ><input id = "prcEndTime" namd = "prcEndTime" readonly="readonly" /></td>
								</tr>
								<tr>
									<td colspan="3" align="center"><button  class="btn btn-info btn-sm" id ="prcStr" name ="prcStr">작업시작</button></td>
									<td colspan="3" align="center"><button class="btn btn-info btn-sm" id ="prcEnd" name ="prcEnd" >작업종료</button></td>								
								</tr>
							</table>
							
							
						</div>
						<div class="col-lg-4">
						</div>
					<br />
					<div align="right">
					<button class="btn btn-info btn-sm" id="save" >저장</a>
					<button class="btn btn-info btn-sm" id="dataReset">작업초기화</a>
					</div>
						
						<div id="grid4"></div>
				
				</div>
				<div class="modal-footer">
					<button class="btn btn-info btn-sm" type="button" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
<div class="modal fade" id="macModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel" align="center">설비선택</h3>

				</div>

				<div class="form-group row"></div>
				<div id="usableMachine"></div>
				<div class="modal-footer">
					<button class="btn" id="choiceM" name="choiceM" type="button">선택</button>
					<button class="btn" type="reset" id="btnM">취소</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>


