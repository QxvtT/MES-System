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
let rowNum = null;
$(function(){
	console.log('start');
	const grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    data: getList(),
	    rowHeaders: ['rowNum'],
	    columns: [
	    	{ header: '작업시작날짜', name:'prdComDate'},
	    	{ header: '지시번호', name:'prdComNum'},
	    	{ header: '제품코드', name:'itmCode'},
			{ header: '제품명', name:'itmName'},
			{ header: '입고량', name:'prcComVol'},
			{ header: '실적량', name:'prcBckVol'}
	    ]
	}); // end const grid
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getList());
	  })
	function getList() { 
		let data;
		$.ajax({
			async: false, 
			url : "ProcessResultList",
			type : "get",
			data : {
  				rowNum : rowNum
  
				},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					rowNum = result[result.length -1].rowNum;
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
	
	grid.on('dblclick', () => { 
		let selectPrd = grid2.getFocusedCell();
		if(getKeyByValue(selectPrd, "prdNum") != null){
			prdNum = Object.values(selectPrd)[2];
			console.log(prdNum);
			$('#searchModal').modal("hide");
			$('#prdName').val(prdName);
			$('#prdNote').val(prdNote);
			grid.resetData(getList());
		}
	});
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
										
										작업공정<input type="text"/>
										이동번호<input type="text"/>
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
								<div id="grid2"></div>
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
