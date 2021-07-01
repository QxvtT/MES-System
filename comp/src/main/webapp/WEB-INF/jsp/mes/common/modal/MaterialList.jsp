<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<script
	src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
let operCode = null;
let operName = null;
let operId = null;
let operPhone = null;

$(function(){
	const grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    rowWidth: 100,
	    data: getList(),
	    rowHeaders: ['rowNum','checkbox'],
	    columns: [
	    	{ header: '업체코드', name:'operCode'},
			{ header: '업체명', name:'operName'},
			{ header: '사업자등록번호', name:'operId'},
			{ header: '전화번호', name:'operPhone'}
	    ]
	}); // end const grid
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getList());
	  })
	  
	function getList() {
		let data;
		$.ajax({
			async: false,
			url : "OperationList",
			type : "get",
			data : {operCode: operCode},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					operCode = result[result.length -1].operCode;
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
	
	$('.btn').click(function(){
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
	<form:form commandName="searchVO" name="listForm" id="listForm"
		method="post">
		<input type="hidden" name="prdComDNum" />
		<div class="pcoded-inner-content">
			<div class="main-body">
				<div class="page-wrapper">
					<div class="row">
						<div class="col-xl-12">
							<div id="datePicker"></div>
							<button type="button" class="btn btn-info btn-sm"
								id="searchComBtn" data-toggle="modal" data-target="#myModal">조회(검색팝업)</button>

							<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h3 class="modal-title" id="exampleModalLabel" align="center">업체검색</h3>
											<button class="close" type="button" data-dismiss="modal"
												aria-label="Close">
												&times;
											</button>
										</div>
										<div class="form-group row"></div>
										<div id="grid">
										</div>
										<div class="modal-footer">
										<button class="btn" type="button" data-dismiss="modal">선택</button>
											<button class="btn" type="reset" data-dismiss="modal">취소</button>
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
</body>
</html>
