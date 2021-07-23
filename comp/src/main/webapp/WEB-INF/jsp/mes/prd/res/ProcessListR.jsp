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
<style type="">
	.tui-datepicker-input>.tui-ico-date {
		top: 20%;
		left: 80%;
	}
</style>
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
			{ header: '지시량', name:'prdComVol',formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}},
			{ header: '입고량', name:'prcComVol',formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}},
			{ header: '실적량', name:'prcBckVol',formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}},
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
		let list=[];
		grid2.resetData(list);
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
			{ header: '입고량', name:'prcComDVol',formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}},
			{ header: '실적량', name:'prcResVol',formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}},
			{ header: '불량량', name:'prcErrVol',formatter: (ev)=>{return (ev.value == null)? null : String(ev.value).replace(/\B(?=(\d{3})+(?!\d))/g, ",");}},
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
	
	$('#printResultBtn').click(function() {	
		$("#grid").print({
        	globalStyles: true,
        	mediaPrint: false,
        	stylesheet: null,
        	noPrintSelector: ".no-print",
        	iframe: true,
        	append: null,
        	prepend: null,
        	manuallyCopyFormValues: true,
        	deferred: $.Deferred(),
        	timeout: 750,
        	title: null,
        	doctype: '<!doctype html>'
		});
	})
	function info_print() {
	var initBody = document.body.innerHTML;
	window.onbeforeprint = function () {
		document.body.innerHTML = document.getElementById("grid").innerHTML;
	}
	window.onafterprint = function () {
		document.body.innerHTML = initBody;
	}
	window.print();
}
	
	$('#excelResultBtn').click(function() {
	ReportToExcelConverter();
})
function ReportToExcelConverter() { 
	$("#grid").table2excel({ 
		exclude: ".noExl", 
		name: "Excel Document Name", 
		filename: "OrderList" +'.xls', //확장자를 여기서 붙여줘야한다. fileext: ".xls", exclude_img: true, exclude_links: true, exclude_inputs: true 
		}); 
	};
	reset.onclick = function() {
		let list = []
		grid.resetData(list);
		grid2.resetData(list);
	}
	// 이쁜달력
	let today = new Date();
	var datepicker = new tui.DatePicker('#aadate', {
        date: today,
        language: 'ko',
        input: {
            element: '#aDate',
            format: 'yyyy-MM-dd'
        }
    });
	
	var datepicker = new tui.DatePicker('#bbdate', {
        date: today,
        language: 'ko',
        input: {
            element: '#bDate',
            format: 'yyyy-MM-dd'
        }
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
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/index.jsp"> <i
								class="fa fa-home"></i>
						</a></li>
						<li class="breadcrumb-item">생산관리</li>
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
				<form>
					<div align="right" style="margin-top: 5px">
					 	<button class="btn btn-info btn" type ="button" id ="search" name = "search">검색</button>
						<button class="btn btn-info btn" type ="reset" id ="reset" name = "reset">새자료</button>
						<button class="btn btn-info btn" type="button" id ="printOrderBtn" name = "printOrderBtn" >인쇄</button>
						<button class="btn btn-info btn" type="button" id ="excelOrderBtn" name = "excelOrderBtn" >Excel</button>
					</div>
					<br/>
					<div class="row">
						<div class="d-inline-block col-xl-12">
							<div class="card">
								<!-- 타이틀 -->
								<div id="title" class="card-header">
									<div>
										<table>
											<tr>
												<td width="130px">진행구분</td>
												<td width="100px">진행<input type = "radio" id="prcComY" name="prcComY" value="N" checked="checked"/></td>
												<td width="100px">완료<input type = "radio" id="prcComY" name="prcComY" value="Y"/></td>
												<td width="100px">전체<input type = "radio" id="prcComY" name="prcComY" value=""/></td>
												<td width="100px"></td>
											</tr>
											<tr>
												<td>지시일자</td>
												<td colspan="2">
													<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
														<input type="text" id="bDate" name="bDate" class=" form-control" aria-label="Date-Time"
																style="text-align: center;" /> <span class="tui-ico-date" ></span>
													</div>
													<div id="bbdate" style="margin-top: -1px;"></div>
												</td>
												<td align="center"><h3>  ~ </h3></td>
												<td colspan="2">
													<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
														<input type="text" id="aDate" name="aDate"
																class=" form-control" aria-label="Date-Time"
																style="text-align: center;" /> <span class="tui-ico-date"></span>
													</div>
													<div id="aadate" style="margin-top: -1px;"></div>
												</td>
											</tr>
										</table>
									
										</div>
									</div>
								<div id="grid"></div>
							</div>
						</div>
					</div>
				</form>
		
				<div class="row">
					<div class="col-xl-12">
					
						<div class="card">
							<!-- 타이틀 -->
							<div id="title" class="card-header">
								<div align="right">
								</div>
								
							</div>
							<div id="grid2"></div>
						</div>
					</div>

				</div>
		</div>
	</div>
</div>


</body>
</html>


