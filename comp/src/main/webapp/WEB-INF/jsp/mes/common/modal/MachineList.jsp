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
let macCodeM = null;
let macCode1 = null;
let macCode2;
let macName;

$(function(){
	const machine = new tui.Grid({
	    el: document.getElementById('machine'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    rowWidth: 100,
	    data: getMachineList(),
	    rowHeaders: ['rowNum','checkbox'],
	    columns: [
	    	{ header: '설비코드', name:'macCode'},
			{ header: '설비명', name:'macName'},
			{ header: '분할설비', name:'macDiv'},
			{ header: '규격', name:'macSize'}
	    ]
	}); // end const grid
	
	machine.on('scrollEnd', () => {
		machine.appendRows(getMachineList());
	  })
	  
	function getMachineList() {
		let data;
		$.ajax({
			async: false,
			url : "${pageContext.request.contextPath}/MachineList",
			type : "get",
			data : {macCode: macCodeM,
					macCode1: macCode1},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					macCode1 = result[result.length -1].macCode;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	$('#mobile-collapse').click(function() {
		machine.refreshLayout();
	});
	

	

	$('#searchMacBtn').click(function(){
		$("#macModal").modal("toggle");
		$("#macModal").on('shown.bs.modal', function () {
			machine.refreshLayout();
		});
		
	})
	
	buttonM.onclick = function(){
		macCode1 = null;
		macCodeM = $('input#macCodeM').val();
		machine.resetData(getMachineList());
		
	}
	
	$('#choiceM').click(function(){
		macCode2 = '';
		macName = '';
		for(let i = 0; i<machine.getCheckedRows().length; i++){
			if(i == machine.getCheckedRows().length-1){
				macCode2 = macCode2 + machine.getCheckedRows()[i]['macCode']
				macName = macName + machine.getCheckedRows()[i]['macName']
			}
			else{
				macCode2 = macCode2 + operation.getCheckedRows()[i]['macCode']+" , ";
				macName = macName + operation.getCheckedRows()[i]['macName']+" , ";
			}	
		}
		$('input[id="macCode"]').val(macCode2);
		$('input[id="macName"]').val(macName);
		
		$("#macModal").modal("toggle");
	});
	
	
	$('#btnM').click(function(){
		$("#macModal").modal("toggle");
	})
	
	
})






</script>
</head>
<body>
	<button type="button" class="btn btn-info btn-sm" id="searchMacBtn"
		data-toggle="modal" data-target="#macModal">검색</button>

	<div class="modal fade" id="macModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel" align="center">설비검색</h3>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">&times;</button>
				</div>
				<div style="padding: 10px 10px 10px 10px">
					<h4>설비</h4>
					<input type="text" id="macCodeM" name="macCode"></input><br> <br>

					<button type="button" id="buttonM" class="btn" name="button">조회</button>
					&nbsp;
					<button class="btn" type="reset">리셋</button>
				</div>
				<div class="form-group row"></div>
				<div id="machine"></div>
				<div class="modal-footer">
					<button class="btn" id="choiceM" name="choiceM" type="button">선택</button>
					<button class="btn" type="reset" id="btnM">취소</button>
				</div>
			</div>
		</div>
</body>
</html>
