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
<meta http-equiv="Content-Type" content="text/html; cha rset=utf-8" />
<title>목록</title>

<script type="text/javaScript" language="javascript" defer="defer">
let empId1 = null;
let empNameM = null;
let empId2;
let empName;


$(function(){
	const employees = new tui.Grid({
	    el: document.getElementById('employees'),
	    scrollX: false,
	    scrollY: true,
	    bodyHeight: 200,
	    rowWidth: 100,
	    data: getEmployeesList(),
	    rowHeaders: ['rowNum',{type:'checkbox',header:' '}],
	    columns: [
	    	{ header: '사번', name:'empId'},
			{ header: '사원명', name:'empName'},
			{ header: '부서', name:'department'},
			{ header: '직책', name:'position'}
			
	    ]
	}); // end const grid
	
	employees.on('scrollEnd', () => {
		employees.appendRows(getEmployeesList());
	  })
	  
	function getEmployeesList() {
		let data;
		$.ajax({
			async: false,
			url : "${pageContext.request.contextPath}/EmployeesList",
			type : "get",
			data : {empName: empNameM,
					empId1: empId1},
			dataType: "json",
			success : function(result){
				if(result.length > 0) {
					empId1 = result[result.length -1].empId;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}
	
	$('#mobile-collapse').click(function() {
		employees.refreshLayout();
	});
	
	
	$('#searchEmployeesBtn').click(function(){
		$("#employeesModal").modal("toggle");
		$("#employeesModal").on('shown.bs.modal', function () {
			employees.refreshLayout();
		});
		
	})
	buttonE.onclick = function(){
		empId1 = null;
		empNameM = $('input#empNameM').val();
		employees.resetData(getEmployeesList());
		
	}
	$('#choiceE').click(function(){
	
		empId2 = '';
		empName = '';
		for(let i = 0; i<employees.getCheckedRows().length; i++){
			if(i == employees.getCheckedRows().length-1){
				empId2 = empId2 + employees.getCheckedRows()[i]['empId']
				empName = empName + employees.getCheckedRows()[i]['empName']
			}
			else{
				empId2 = empId2 + employees.getCheckedRows()[i]['empId']+" , ";
				empName = empName + employees.getCheckedRows()[i]['empName']+" , ";
			}	
		}
		
		$('input[id="empId"]').val(empId2);
		$('input[id="empName"]').val(empName);
	});
	
	employees.on('check', (e) => {
		let rows = employees.getCheckedRowKeys(); 
		if(rows.length > 1) { 
			for(let i in rows){ 
				if(e.rowKey != rows[i]){ 
					employees.uncheck(rows[i]); 
					} 
				}
		}
	})
	
	
})

</script>
</head>
<body>

	<button type="button" class="btn btn-info btn-sm"
		id="searchEmployeesBtn">검색</button>
	<div class="modal fade" id="employeesModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="exampleModalLabel" align="center">사원 검색</h3>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">&times;</button>
				</div>
				<div style="padding: 10px 10px 10px 10px">
					<h4>사원명</h4>
					<input type="text" id="empNameM" name="empNameM"></input><br>
					<br>
					<button type="button" id="buttonE" class="btn" name="button">조회</button>
					&nbsp;
					<button class="btn" type="reset">리셋</button>
				</div>
				<div class="form-group row"></div>
				<div id="employees"></div>
				<div class="modal-footer">
					<button class="btn" id="choiceE" name="choiceE" type="button"
						data-dismiss="modal">선택</button>
					<button class="btn" type="reset" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
</body>
</html>
