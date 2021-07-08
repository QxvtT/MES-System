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
let prdComNum = null;
let data;
let prcCode = null;
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
	    	{ header: '공정순서', name:'prcResNo'},
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
				prcResDNum : prcResDNum,
				prcCode : prcCode
				},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					prcResDNum = result[result.length -1].prcResDNum;
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
	  })
	
	$('#mobile-collapse').click(function() {
	      grid.refreshLayout();
	   });
	
	grid.on('dblclick', () => { 
		let key = grid.getFocusedCell()['rowKey'];
		let result = grid.getColumnValues('prcResDNum')[key];
		getProcessResultSelect(result);
		let keyt = grid.getFocusedCell()['rowKey'];
		let prdComDNum = grid.getColumnValues('prdComDNum')[keyt];
		console.log(prdComDNum);
		prcCode = grid.getColumnValues('prcCode')[keyt];;
		console.log(prcCode );
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
					console.log('test123123');
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}

	search.onclick = function() {
		prcResDNum = null;
		prcCode = $("input#prcCode").val();
		console.log(prcCode);
		grid.resetData(getProcessResulList());
		$( 'td#prdComNum' ).text();
		$( 'td#itmCode' ).text();
		$( 'td#itmName' ).text();
		$( 'td#operName' ).text();
		$( 'td#prcComDVol' ).text();
		$( 'td#prcResVol' ).text();
		$( 'td#prcNVol' ).text();
	}
	
	
	

	 
	
})
	
</script>
</head>
<body>
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
										작업공정<input type="text" id="prcCode" name ="prcCode"/>
										<%@ include file="/WEB-INF/jsp/mes/common/modal/ProcessList.jsp" %>
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

								<!-- // 타이틀 -->
								<!-- List -->
								<div id="table1">
									<table class = "table">
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


</body>
</html>



