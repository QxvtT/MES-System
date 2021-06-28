<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : ProduceCommandDList.jsp
  * @Description : ProduceCommandD List 화면
  * @Modification Information
  * 
  * @author soyeon
  * @since 20210625
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
<link rel="stylesheet" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
let prdComDNum = null;
$(function(){
	const grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    rowWidth: 100,
	    data: getList(),
	    rowHeaders: ['rowNum'],
	    columns: [
	    	{ header: 'PrdComDNum', name:'prdComDNum'},
			{ header: 'PrdComNum', name:'prdComNum'},
			{ header: 'MatCode', name:'matCode'},
			{ header: 'LotNum', name:'lotNum'},
			{ header: 'ItmCode', name:'itmCode'},
			{ header: 'PrcFNo', name:'prcFNo'},
			{ header: 'PrdComVol', name:'prdComVol'},
			{ header: 'PrdComDDate', name:'prdComDDate'},
			{ header: 'PrcComNo', name:'prcComNo'},
			{ header: 'PrcComDiv', name:'prcComDiv'},
			{ header: 'MatVol', name:'matVol'},
			{ header: 'PrdComNote', name:'prdComNote'},
			{ header: 'DivMatCode', name:'divMatCode'},
			{ header: 'DivLotNum', name:'divLotNum'},
			{ header: 'PrdPlanNum', name:'prdPlanNum'}
	    ]
	}); // end const grid
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getList());
	  })
	  
	function getList() {
		let data;
		$.ajax({
			async: false,
			url : "ProduceCommandDList",
			type : "get",
			data : {prdComDNum: prdComDNum},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					prdComDNum = result[result.length -1].prdComDNum;
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
	
	const gridData = [
	      {
	        c1: '1992/03/25',
	        c3: '2014-04-16'
	      }
	    ];
	<%--
	const datePicker = new tui.Grid({
	      el: document.getElementById('datePicker'),
	      scrollX: false,
	      scrollY: false,
	      data: gridData,
	      columns: [
	        {
	          name: 'c1',
	          editor: 'datePicker'
	        },
	        {
	          name: 'c3',
	          editor: {
	            type: 'datePicker',
	            options: {
	              selectableRanges: [[new Date(2014, 3, 10), new Date(2014, 5, 20)]]
	            }
	          }
	        }
		]
	}) // end const datePicker
	--%>
	
	$('#searchComBtn').click(function(){
		$("#myModal").modal("toggle");
		$("#myModal").on('shown.bs.modal', function () {
			grid.refreshLayout();
		});
		
	})
	
})





<%--
  $(function(){
	  const dataSource = { 
				api : { 
				    readData : {  url : '${pageContext.request.contextPath}/prd/com/ProduceCommandDList' ,  method : 'GET'  }
				},
				contentType: 'application/json',
				serializer(params) {
					console.log("dd");
					console.log(params);
					return JSON.stringify(params);
				}
			} ;
			
		const grid = new tui.Grid({
		    el: document.getElementById('grid'),
		    data: dataSource,
		    scrollX: false,
		    scrollY: false,
		    minBodyHeight: 30,
		    rowHeaders: ['rowNum'],
		    columns: [
		    	{ header: 'PrdComDNum', name:'prdComDNum'},
				{ header: 'PrdComNum', name:'prdComNum'},
				{ header: 'MatCode', name:'matCode'},
				{ header: 'LotNum', name:'lotNum'},
				{ header: 'ItmCode', name:'itmCode'},
				{ header: 'PrcFNo', name:'prcFNo'},
				{ header: 'PrdComVol', name:'prdComVol'},
				{ header: 'PrdComDDate', name:'prdComDDate'},
				{ header: 'PrcComNo', name:'prcComNo'},
				{ header: 'PrcComDiv', name:'prcComDiv'},
				{ header: 'MatVol', name:'matVol'},
				{ header: 'PrdComNote', name:'prdComNote'},
				{ header: 'DivMatCode', name:'divMatCode'},
				{ header: 'DivLotNum', name:'divLotNum'},
				{ header: 'PrdPlanNum', name:'prdPlanNum'}
		    ]
		  }); // end const grid
	  
		  //console.log(grid.request('readData'));
		  grid.request('readData');
 
  });
--%>

 


<!--
/* 글 수정 화면 function */


function fn_egov_select(prdComDNum) {
	document.getElementById("listForm").prdComDNum.value = prdComDNum;
   	document.getElementById("listForm").action = "<c:url value='/prd/com/updateProduceCommandDView.do'/>";
   	document.getElementById("listForm").submit();
}

/* 글 등록 화면 function */
function fn_egov_addView() {
   	document.getElementById("listForm").action = "<c:url value='/prd/com/addProduceCommandDView.do'/>";
   	document.getElementById("listForm").submit();		
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	document.getElementById("listForm").pageIndex.value = pageNo;
	document.getElementById("listForm").action = "<c:url value='/prd/com/ProduceCommandDList.do'/>";
   	document.getElementById("listForm").submit();
}

 // -->
</script>
</head>
<body>
<form:form commandName="searchVO" name="listForm" id="listForm" method="post">
	<input type="hidden" name="prdComDNum" />
<div class="pcoded-inner-content">
<div class="main-body">
<div class="page-wrapper">
<div class="row">
<div class="col-xl-12">
<div id="datePicker"></div>
<button type="button" class="btn btn-info btn-sm" id="searchComBtn" data-toggle="modal" data-target="#myModal">조회(검색팝업)</button>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="exampleModalLabel">
					모달테스트
				</h3>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					&times;
				</button>
			</div>
			<div class="form-group row">
				<p>작성일자</p>
				<div class="col-sm-6">
					<input type="date" name="dateRangeS" />
				</div>
				<p> ~ </p>
				<div class="col-sm-6">
					<input type="date" name="dateRangeE" />
				</div>
			</div>
			<div id="grid"></div>
			<div class="modal-footer">
				<a class="btn" id="modalY" href="#">예</a>
				<button class="btn" type="button" data-dismiss="modal">아니요</button>
			</div>
		</div>
	</div>
</div>
  
<div class="card">


	<!-- 타이틀 -->
	<div id="title" class="card-header">
		<ul>
			<li> List </li>
		</ul>
	</div>
	<!-- // 타이틀 -->
	<!-- List -->
	<div id="grid">
	</div>
	<%--
	<div id="table">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<colgroup>
								<col/>				
								<col/>				
								<col/>				
								<col/>				
								<col/>				
								<col/>				
								<col/>				
								<col/>				
								<col/>				
								<col/>				
								<col/>				
								<col/>				
								<col/>				
								<col/>				
								<col/>				
							</colgroup>		  
			<tr>
								<th align="center">PrdComDNum</th>
								<th align="center">PrdComNum</th>
								<th align="center">MatCode</th>
								<th align="center">LotNum</th>
								<th align="center">ItmCode</th>
								<th align="center">PrcFNo</th>
								<th align="center">PrdComVol</th>
								<th align="center">PrdComDDate</th>
								<th align="center">PrcComNo</th>
								<th align="center">PrcComDiv</th>
								<th align="center">MatVol</th>
								<th align="center">PrdComNote</th>
								<th align="center">DivMatCode</th>
								<th align="center">DivLotNum</th>
								<th align="center">PrdPlanNum</th>
							</tr>
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
													<td align="center" class="listtd"><a href="javascript:fn_egov_select('<c:out value="${result.prdComDNum}"/>')"><c:out value="${result.prdComDNum}"/></a>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.prdComNum}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.matCode}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.lotNum}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.itmCode}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.prcFNo}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.prdComVol}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.prdComDDate}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.prcComNo}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.prcComDiv}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.matVol}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.prdComNote}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.divMatCode}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.divLotNum}"/>&nbsp;</td>
						<td align="center" class="listtd"><c:out value="${result.prdPlanNum}"/>&nbsp;</td>
				    			</tr>
			</c:forEach>
		</table>
	</div>
	<!-- /List -->
 --%>	
</div>
</div>
</div>
</div>
</div>
</div>
</form:form>
</body>
</html>
