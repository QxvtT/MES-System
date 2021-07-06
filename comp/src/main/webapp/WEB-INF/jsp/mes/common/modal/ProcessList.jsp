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

let prcCodeM = null;
let prcCode1 = null;

$(function(){
	const process = new tui.Grid({
	    el: document.getElementById('process'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    rowWidth: 100,
	    data: getProcessList(),
	    rowHeaders: ['rowNum','checkbox'],
	    columns: [
	    	{ header: '공정코드', name:'prcCode'},
			{ header: '공정명', name:'prcName'},
			{ header: '비고', name:'prcNote'}

	    ]
	}); // end const grid
	
	process.on('scrollEnd', () => {
		process.appendRows(getProcessList());
	  })
	  
	function getProcessList() {
		let data;
		$.ajax({
			async: false,
			url : "${pageContext.request.contextPath}/ProcessList",
			type : "get",
			data : {prcCode: prcCodeM,
					prcCode1: prcCode1},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					prcCode1 = result[result.length -1].prcCode1;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	$('#mobile-collapse').click(function() {
		process.refreshLayout();
	});
	

	
	
	$('.serchPrcBtn').click(function(){
		$("#serchPrcModal").modal("toggle");
		$("#serchPrcModal").on('shown.bs.modal', function () {
			process.refreshLayout();
		});
		
	})
	
	
	buttonP.onclick = function(){
		prcCodeM = null;
		prcCodeM = $('input#prcCodeM').val();
		process.resetData(getProcessList());
		
	}
	
})




 // -->
</script>
</head>
<body>

	<button type="button" class="btn btn-info btn-sm" id="serchPrcBtn"
		data-toggle="modal" data-target="#myModal">조회(검색팝업)</button>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel" align="center">업체검색</h3>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">&times;</button>
				</div>
				<div style="padding: 10px 10px 10px 10px">
					<h4>공정코드</h4>
					<input type="text" id="prcCodeM" name="prcCode"></input><br>
					<br>
					<button type="button" id="buttonP" name="button">조회</button>
					&nbsp;
					<button type="reset">리셋</button>
				</div>

				<div class="form-group row"></div>
				<div id="process"></div>
				<div class="modal-footer">
					<button class="btn" id="choiceP" name="choiceP" type="button" data-dismiss="modal">선택</button>
					<button class="btn" type="reset" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
</body>
</html>
