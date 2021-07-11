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

<script type="text/javaScript" language="javascript" defer="defer">
let operCode1 = null;
let operNameM = null;
let operCode2;
let operName;

$(function(){
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
		operation.appendRows(getOperationList());
	  })
	  
	function getOperationList() {
		let data;
		$.ajax({
			async: false,
			url : "${pageContext.request.contextPath}/OperationList",
			type : "get",
			data : {operName: operNameM,
					operCode1: operCode1},
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
	
	buttonO.onclick = function(){
		operCode1 = null;
		operNameM = $('input#operNameM').val();
		operation.resetData(getOperationList());
		
	}
	
	// 모달의 선택 버튼 클릭 시 부모창의 input 칸에 선택한 값 들어감
	$('#choiceO').click(function(){
		test = null;
		operCode2 = '';
		operName = '';
		for(let i = 0; i<operation.getCheckedRows().length; i++){
			if(i == operation.getCheckedRows().length-1){
				operCode2 = operCode2 + operation.getCheckedRows()[i]['operCode']
				operName = operName + operation.getCheckedRows()[i]['operName']
			}
			else{
				operCode2 = operCode2 + operation.getCheckedRows()[i]['operCode']+" , ";
				operName = operName + operation.getCheckedRows()[i]['operName']+" , ";
			}	
		}
		console.log(operCode2);
		console.log(operName);
		console.log("---");
		$('input[id="operCode"]').val(operCode2);
		$('input[id="operName"]').val(operName);
	});


})



</script>
</head>
<body>
	<button type="button" class="btn btn-info btn-sm" id="searchOperBtn">검색</button>

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
					<input type="text" id="operNameM" name="operNameM"></input><br><br>
							<button type="button" id="buttonO" name="buttonO">조회</button> &nbsp;
							<button type="reset">리셋</button>
				</div>

				<div class="form-group row"></div>
				<div id="operation"></div>
				<div class="modal-footer">
					<button class="btn" id="choiceO" name="choiceO" type="button" data-dismiss="modal" >선택</button>
					<button class="btn" type="reset" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
