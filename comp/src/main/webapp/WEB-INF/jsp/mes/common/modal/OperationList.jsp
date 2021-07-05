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

</head>
<body>
	<button type="button" class="btn btn-info btn-sm"
		id="searchOperBtn" data-toggle="modal" data-target="#operModal">클릭</button>

	<div class="modal fade" id="operModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel">업체검색</h3>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						&times;
					</button>
				</div>
				<div style="padding: 10px 10px 10px 10px">
					<h4>업체명</h4>
					<input type="text" id="operName1" name="operName"></input><br><br>
					<button type="button" id="button" name="button">조회</button> &nbsp;
						<button type="reset">리셋</button>
				</div>

				<div class="form-group row"></div>
				<div id="operation"></div>
				<div class="modal-footer">
					<button class="btn" type="button" data-dismiss="modal">선택</button>
					<button class="btn" type="reset" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
<script type="text/javaScript" language="javascript" defer="defer">
let operCode1 = null;
let operName = null;
let operId = null;
let operPhone = null;

console.log("aaaa");
	const operation = new tui.Grid({
	    el: document.getElementById('operation'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    rowWidth: 100,
	    data: getOperationList(),
	    rowHeaders: ['rowNum','checkbox'],
	    columns: [
	    	{ header: '업체코드', name:'operCode'},
			{ header: '업체명', name:'operName'},
			{ header: '사업자등록번호', name:'operId'},
			{ header: '전화번호', name:'operPhone'}
	    ]
	}); // end const grid
	
	operation.on('scrollEnd', () => {
		let nextList = getOperationList();
		if(nextList != null) {
			operation.appendRows(nextList);
		}
	  })
	  
	function getOperationList() {
		let data;
		$.ajax({
			async: false,
			url : "${pageContext.request.contextPath}/OperationList",
			type : "get",
			data : {operName: operName,
					operCode: operCode1},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					operCode1 = result[result.length -1].operCode;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	$('#mobile-collapse').click(function() {
		operation.refreshLayout();
	});
	
	$('#searchOperBtn').click(function(){
		$("#operModal").modal("toggle");
		$("#operModal").on('shown.bs.modal', function () {
			operation.refreshLayout();
		});
		
	})
	
	button.onclick = function(){
		operCode1 = null;
		operName = $('input#operName1').val();
		operation.resetData(getOperationList());
		
	}







</script>
</body>
</html>
