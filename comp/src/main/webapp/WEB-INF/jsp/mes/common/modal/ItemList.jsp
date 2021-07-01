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
let itmCode = null;
let itmName = null;
let itmSize = null;

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
	    	{ header: '제품코드', name:'itmCode'},
			{ header: '제품명', name:'itmName'},
			{ header: '규격', name:'itmSize'}
	    ]
	}); // end const grid
	
	grid.on('scrollEnd', () => {
	    grid.appendRows(getList());
	  })
	  
	function getList() {
		let data;
		$.ajax({
			async: false,
			url : "ItemList",
			type : "get",
			data : {itmCode: itmCode},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					itmCode = result[result.length -1].itmCode;
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
	
	$('.btn').click(function(){
		$("#myModal").modal("toggle");
		$("#myModal").on('shown.bs.modal', function () {
			grid.refreshLayout();
		});
		
	})
	
})

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
											<h3 class="modal-title" id="exampleModalLabel" align="center">제품검색</h3>
											<button class="close" type="button" data-dismiss="modal"
												aria-label="Close">&times;</button>
										</div>
										<div class="form-group row"></div>
										<div id="grid"></div>
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
