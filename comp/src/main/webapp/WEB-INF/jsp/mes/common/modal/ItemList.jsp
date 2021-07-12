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
<title>목록</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>목록</title>

<script type="text/javaScript" language="javascript" defer="defer">
let itmCode1 = null;
let itmNameM = null;
let itmCode2;
let itmName;


$(function(){
	const item = new tui.Grid({
	    el: document.getElementById('item'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    rowWidth: 100,
	    data: getItemList(),
	    rowHeaders: ['rowNum','checkbox'],
	    columns: [
	    	{ header: '제품코드', name:'itmCode'},
			{ header: '제품명', name:'itmName'},
			{ header: '규격', name:'itmSize'}
	    ]
	}); // end const grid
	
	item.on('scrollEnd', () => {
		item.appendRows(getItemList());
	  })
	  
	function getItemList() {
		let data;
		$.ajax({
			async: false,
			url : "${pageContext.request.contextPath}/ItemList",
			type : "get",
			data : {itmName: itmNameM,
					itmCode1: itmCode1},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					itmCode1 = result[result.length -1].itmCode;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	$('#mobile-collapse').click(function() {
		item.refreshLayout();
	});
	
	
	$('#searchItemBtn').click(function(){
		$("#itemModal").modal("toggle");
		$("#itemModal").on('shown.bs.modal', function () {
			item.refreshLayout();
		});
		
	})
	buttonI.onclick = function(){
		itmCode1 = null;
		itmNameM = $('input#itmNameM').val();
		item.resetData(getItemList());
		
	}
	$('#choiceI').click(function(){
		test = null;
		itmCode2 = '';
		itmName = '';
		for(let i = 0; i<item.getCheckedRows().length; i++){
			if(i == item.getCheckedRows().length-1){
				itmCode2 = itmCode2 + item.getCheckedRows()[i]['itmCode']
				itmName = itmName + item.getCheckedRows()[i]['itmName']
			}
			else{
				itmCode2 = itmCode2 + item.getCheckedRows()[i]['itmCode']+" , ";
				itmName = itmName + item.getCheckedRows()[i]['itmName']+" , ";
			}	
		}
		
		$('input[id="itmCode"]').val(itmCode2);
		$('input[id="itmName"]').val(itmName);
	});
	
	
})

</script>
</head>
<body>

	<button type="button" class="btn btn-info btn-sm" id="searchItemBtn">검색</button>

	<div class="modal fade" id="itemModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel" align="center">제품검색</h3>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">&times;</button>
				</div>
				<div style="padding: 10px 10px 10px 10px">
					<h4>제품명</h4>
					<input type="text" id="itmNameM" name="itmNameM"></input><br> <br>
					<button type="button" id="buttonI" class="btn" name="buttonI">조회</button>
					&nbsp;
					<button class="btn" type="reset">리셋</button>
				</div>
				<div class="form-group row"></div>
				<div id="item"></div>
				<div class="modal-footer">
					<button class="btn" id="choiceI" name="choiceI" type="button"
						data-dismiss="modal">선택</button>
					<button class="btn" type="reset" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
