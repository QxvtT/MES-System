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

let matCode1 = null;
let matName = null;

$(function(){
	const material = new tui.Grid({
	    el: document.getElementById('material'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    rowWidth: 100,
	    data: getMaterialList(),
	    rowHeaders: ['rowNum','checkbox'],
	    columns: [
	    	{ header: '자재코드', name:'matCode'},
			{ header: '자재명', name:'matName'},
			{ header: '규격', name:'matSize'},
			{ header: '업체명', name:'operName'}
	    ]
	}); // end const grid
	
	material.on('scrollEnd', () => {
		material.appendRows(getMaterialList());
	  })
	  
	function getMaterialList() {
		matCode1 = null;
		let data;
		$.ajax({
			async: false,
			url : "${pageContext.request.contextPath}/MaterialList",
			type : "get",
			data : {matCode: matCode1,
					matName: matName},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					matCode1 = result[result.length -1].matCode1;
				}
				console.log(matCode1);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	$('#mobile-collapse').click(function() {
		material.refreshLayout();
	});
	
	
	$('#searchMatBtn').click(function(){
		$("#searchMatModal").modal("toggle");
		$("#searchMatModal").on('shown.bs.modal', function () {
			material.refreshLayout();
		});
		
	})
	
	button.onclick = function(){
		matCode = null;
		matCode = $('input#matCodeM').val();
		console.log(matCode);
		material.resetData(getMaterialList());
		
	}
	
})





</script>
</head>
<body>
	<button type="button" class="btn btn-sm btn-primary waves-effect waves-light ml-3"
														id="searchMatBtn" data-toggle="modal" data-target="#searchMatModal">검색</button>
							
	<div class="modal fade" id="searchMatModal" tabindex="-1" role="dialog"
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
				<div style="padding: 10px 10px 10px 10px">
					<h4>자재코드</h4>
					<input type="text" id="matCodeM" name="matCode"></input><br><br>
					<button type="button" id="button" name="button">조회</button> &nbsp;
						<button type="reset">리셋</button>
				</div>
				<div class="form-group row"></div>
				<div id="material">
				</div>
				<div class="modal-footer">
				<button class="btn" type="button" data-dismiss="modal">선택</button>
					<button class="btn" type="reset" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
