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
let data;
let prcCode = null;

let matVol = 0;
let empId = null;
let macCode = null;
let prcState = null;
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
					prcResDNum1 = result[result.length -1].prcResDNum1;
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
			{ header: '상태', name:'prcFState'},
	    ]
	});
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getProcessResulList());
	  });
	
	$('#mobile-collapse').click(function() {
	      grid.refreshLayout();
	   });
	search.onclick = function() {
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
				},
			dataType: "json",
			success : function(result){
				console.log(result);
				$( 'td#prdComNum' ).text(result[0]['prdComNum']);
				$( 'td#itmCode' ).text(result[0]['itmCode']);
				$( 'td#itmName' ).text(result[0]['itmName']);
				$( 'td#operName' ).text(result[0]['operName']);
				$( 'td#prcComDVol' ).text(result[0]['prcComDVol']);
				$( 'td#prcResVol' ).text(result[0]['prcResVol']);
				$( 'td#prcNVol' ).text(result[0]['prcNVol']);
				
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
				prcCode : prcCode
				},
			dataType: "json",
			success : function(result){
				for(let i = 0; i<result.length; i++){
					console.log(result[i]['prcFState']);
					if(result[i]['prcState'] =='진행'){
						result[i]['prcFState'] = '노랑'
					}
					else if(result[i]['prcState'] =='완료'){
						if(result[i]['prcFState']=='진행'){
							result[i]['prcFState'] = '초록'
						}else{
							result[i]['prcFState'] = '파랑'
						}
					}else{
						result[i]['prcFState'] = '빨강'
					}
				}
				matVol = result[0]['matVol'];
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
			{ header: '비고', name:'prcResltDNote'}
	    ]
	});
	grid3.on('dblclick', () => { 
		let key = grid3.getFocusedCell()['rowKey'];
		prcResDNum = grid3.getColumnValues('prcResDNum')[key];
		empId = grid3.getColumnValues('empId')[key]
		macCode = grid3.getColumnValues('macCode')[key]
		grid4.resetData(setProduceSelect(prcResDNum));
		console.log(prcResDNum);
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
				$( 'input#prcName' ).val(result[0]['prcName']);
				$( 'input#prcWorkNum' ).val(result[0]['prcWorkNum']);
				$( 'input#empName' ).val(result[0]['empName']);
				$( 'input#empId' ).val(result[0]['empId']);
				$( 'input#macName' ).val(result[0]['macName']);
				$( 'input#macCode' ).val(result[0]['macCode']);
				$( 'input#prcStrTime' ).val(result[0]['prcStrTime']);
				$( 'input#prcEndTime' ).val(result[0]['prcEndTime']);
				
			} // end success
		}); // end ajax 
		return data;
	}
	sibalY.onclick= function() {
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
				
						grid3.resetData(getProduceSelect(prdComDNum,prcCode));
						grid.resetData(getProcessResulList());
			}
			});
			
	}
	sibal.onclick = function() {
		let date = new Date();
		date.toString();
		console.log(date.getSeconds())
	}
	prcEnd.onclick = function() {
		if($('input#prcEnd').val()!=null){
			alert("종료된작업입니다");
			
			return null;
		}
		
		let date = new Date();
		function formatDate(datet){
		    datet = datet.getHours() + ":" + datet.getMinutes() + ":" + datet.getSeconds();
		    
		    return datet;
		}
		let prcEndTime = formatDate(date);
		console.log(prcEndTime);
		$.ajax({
			async: false, 
			url : "updatePrcEnd",
			type : "post",
			data : {
				prcEndTime : prcEndTime
				,prcResDNum : prcResDNum
				},
			dataType: "json",
			contentType:"application/json",
			success : function(){
				$('input#prcEnd').val(prcEndTime);
				}
			});
	}
	prcStr.onclick = function() {
		if($('input#prcStr').val()!="" || $('input#prcStr').val()!=null){
			alert("이미시작한작업입니다");
			return null;
		}
		
	}
})
	
</script>
</head>
<body>
<button id ="sibal" name ="sibal">sibal</button>
<!-- 공정실적관리List -->
	<div class="pcoded-inner-content">
			<div class="main-body">
				<div class="page-wrapper">
					<div class="row">
						<div class="col-xl-12">
						
							<div class="card">
								<!-- 타이틀 -->
								<div id="title" class="card-header">
									<ul>
										공정코드<input type="text" id="prcCode" name ="prcCode" readonly="readonly"/>
										<%@ include file="/WEB-INF/jsp/mes/common/modal/ProcessList.jsp" %>
									</ul>
									<ul>
										공정이름<input type="text" id="prcName" name ="prcName" readonly="readonly"/>
									</ul>
									
										<button type ="button" id ="search" name = "search">검색</button>
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
<!-- 		123 -->
		<div class="pcoded-inner-content">
			<div class="main-body">
				<div class="page-wrapper">
					<div class="row">
						<div class="col-xl-4">
						
							<div class="card">
								<!-- 타이틀 -->
								<div id="title" class="card-header">
									<ul>
										<li>작업실적대상제품자료</li>
									</ul>
								</div>
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
						
							<div class="card">
								<!-- 타이틀 -->
								<div id="title" class="card-header">
									<ul>
										<li>list</li>
									</ul>
								</div>

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
				<div class="modal-body" >
						<div class="form-group row">
							<table class="table">
								<tr>
										
									<th>작업일자</th>
									<td><input id = "prdComDDate" namd = "prdComDDate"/></td>
									<th>공정명</th>
									<td><input id = "prcName" namd = "prcName" readonly="readonly"/></td>
									<th>작업자</th>
									<td><input id = "empName" namd = "empName" /><%@ include file="/WEB-INF/jsp/mes/common/modal/EmployeesList.jsp" %></td>									
								   <input type="hidden" id="empId" name = "empId"/>
									
									
								</tr>
								<tr >
									<th>지시번호</th>
									<td><input id = "prdComNum" namd = "prdComNum" readonly="readonly"/></td>
									<th>작업번호</th>
									<td><input id = "prcWorkNum" namd = "prcWorkNum" readonly="readonly"/></td>
									<th>설비</th>
									<td><input id = "macName" namd = "macName" /><%@ include file="/WEB-INF/jsp/mes/common/modal/MachineList.jsp" %></td>
									<input type="hidden" id="macCode" name = "macCode"/>
								</tr>
								<tr>
									<th colspan="2" style="text-align: center;">시작시간</th>
									<td ><input id = "prcStrTime" namd = "prcStrTime" readonly="readonly"/></td>
									<th colspan="2" style="text-align: center;" >종료시간</th>
									<td ><input id = "prcEndTime" namd = "prcEndTime" readonly="readonly"/></td>
								</tr>
								<tr>
									<td colspan="3" align="center"><button  class="btn btn-info btn-sm" id ="prcStr" name ="prcStr">작업시작</button></td>
									<td colspan="3" align="center"><button class="btn btn-info btn-sm" id ="prcEnd" name ="prcEnd">작업종료</button></td>								
								</tr>
							</table>
							
							
						</div>
						<div class="col-lg-4">
						</div>
					<br />
					
						
						<div id="grid4"></div>
				
				</div>
				<div class="modal-footer">
					<a class="btn" id="sibalY" >예</a>
					<button class="btn" type="button" data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
