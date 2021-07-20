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
let movNum1 = null;
let aDate = null;
let bDate = null;
let prcComY = null; 

let movNum = null;
let prcResDNum = null;
$(function(){
	const grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: null,
	    rowHeaders: ['rowNum'],
	    columns: [
	    	{ header: '지시번호', name:'prdComNum'},
	    	{ header: '이동번호', name:'movNum'},
	    	{ header: '아이템명', name:'itmName'},
			{ header: '지시량', name:'prdComVol'},
			{ header: '입고량', name:'prcComVol'},
			{ header: '실적량', name:'prcBckVol'},
			{ header: '지시일자', name:'prdComDDate'},
			{ header: '구분', name:'prcComDiv'},
			{ header: '완료구분', name:'prcComY'}
	    ]
	}); // end const grid
	function getProcessResulList() { 
		let data;
		$.ajax({
			async: false, 
			url : "ProcessListR",
			type : "get",
			data : {
				movNum1 : movNum1
				,aDate : aDate
				,bDate : bDate
				,prcComY : prcComY
				},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					movNum1 = result[result.length -1].movNum;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getProcessResulList());
	  });
	
	$('#mobile-collapse').click(function() {
	      grid.refreshLayout();
	   });
	
		
	search.onclick = function() {
		movNum1 = null;
		aDate = $("input#aDate").val(); 
		bDate = $("input#bDate").val();
		prcComY = $("input[name='prcComY']:checked").val();
		grid.resetData(getProcessResulList());		
	}
		
	grid.on('dblclick', () => { 
		let key = grid.getFocusedCell()['rowKey'];
		
		movNum = grid.getColumnValues('movNum')[key];
		grid2.resetData(getMovNum());
		
	});
	const grid2 = new tui.Grid({
	    el: document.getElementById('grid2'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: null,
	    rowHeaders: ['rowNum'],
	    columns: [
	    	{ header: '이동번호', name:'movNum'},
	    	{ header: '순서', name:'prcResNo'},
	    	{ header: '공정명', name:'prcName'},
			{ header: '설비명', name:'macName'},
			{ header: '입고량', name:'prcComDVol'},
			{ header: '실적량', name:'prcResVol'},
			{ header: '불량량', name:'prcErrVol'},
			{ header: '작업시작시간', name:'prcStrTime'},
			{ header: '작업종료시간', name:'prcEndTime'},
			{ header: '비고', name:'prcResultDNote'}
	    ]
	}); 
	function getMovNum() { 
		let data;
		$.ajax({
			async: false, 
			url : "ProcessSelectMovNum",
			type : "get",
			data : {
				prcResDNum : prcResDNum,
				movNum : movNum
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
	grid2.on('scrollEnd', () => {
	    grid.appendRows(getProcessResulList());
	  });
})
	
</script>
</head>
<body>
	<div class="page-header">
		<div class="page-block">
			<div class="row align-items-center">
				<div class="col-md-8">
					<div class="page-header-title">
						<h5 class="m-b-10">공정실적조회</h5>
					</div>
				</div>
				<div class="col-md-4">
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.jsp"> <i
								class="fa fa-home"></i>
						</a></li>
						<li class="breadcrumb-item"><a href="#!">공정실적조회</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
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
										지시일자<input type ="date" id="bDate" name = "bDate" />~<input type ="date" id="aDate" name = "aDate" />
									</ul>
									<div>
										<ul>
											진행<input type = "radio" id = "prcComY" name = "prcComY" value = "N"/>
											완료<input type = "radio" id = "prcComY" name = "prcComY" value = "Y"/>
											전체<input type = "radio" id = "prcComY" name = "prcComY" value = "" checked="checked"/>
										</ul>
									</div>
									<ul>
										<div align="right">
											<button class="btn btn-info btn-sm" type ="button" id ="search" name = "search">검색</button>
										</div>
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
		<div class="pcoded-inner-content">
			<div class="main-body">
				<div class="page-wrapper">
					<div class="row">
						<div class="col-xl-12">
						
							<div class="card">
								<!-- 타이틀 -->
								<div id="title" class="card-header">
									
									
								</div>

								<!-- // 타이틀 -->
								<!-- List -->
								<div id="grid2"></div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		

</body>
</html>

