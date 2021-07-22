<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	/**
* @Class Name : MachineList.jsp
* @Description : Machine List 화면
* @Modification Information
* 
* @author sunghwan
* @since 2021-07-02
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

<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
let macName = null;
let macCode= null;
let macCode1= null;
let data;

$(function() {
	const machine = new tui.Grid({
		el : document.getElementById('machine'),
		scrollX : false,
		scrollY : true,
		bodyHeight : 200,
		rowWidth : 100,
		data : getMachineMngList(),
		rowHeaders : [ 'rowNum',{type:'checkbox',header:' '}],
		columns : [ {
			header : '설비코드',
			name : 'macCode'
		}, {
			header : '설비명',
			name : 'macName'
		} ]
	}); // end const grid
	
	// 이쁜달력
	let today = new Date();
	var datepicker = new tui.DatePicker('#date', {
        date: today,
        language: 'ko',
        input: {
            element: '#buyDate',
            format: 'yyyy-MM-dd'
        }
    });
	
	// date 불러오는 친구 
	function getMachineMngList() {
		$.ajax({
			async : false,
			url : "MachineList",
			type : "get",
			data : {
				macCode1 : macCode1
			},
			dataType : "json",
			success : function(result) {
				if (result.length > 0) {
					macCode1 = result[result.length - 1].macCode;
				}
				console.log(result);
				data = result;
			} // end success
		}); // end ajax 
		return data;
	}

	machine.on('dblclick', () => { 
	let key = machine.getFocusedCell()['rowKey'];
	macCode = machine.getColumnValues('macCode')[key];
	machine.check(key);
	
	console.log(machine.getData()[key]);
	 
	$('input#macCode').val(machine.getData()[key]['macCode']);
	$('input#prcCode').val(machine.getData()[key]['prcCode']);
	$('input#prcName').val(machine.getData()[key]['prcName']);
	$('input#macName').val(machine.getData()[key]['macName']);
	$('select#use1').val(machine.getData()[key]['use1']);
	$('input#macDiv').val(machine.getData()[key]['macDiv']);
	$('input#model').val(machine.getData()[key]['model']);
	$('input#proOper').val(machine.getData()[key]['proOper']);
	$('input#empName').val(machine.getData()[key]['worker']);
	$('input#use').val(machine.getData()[key]['use']);
	$('input#usingEnergy').val(machine.getData()[key]['usingEnergy']);
	$('input#buyDate').val(machine.getData()[key]['buyDate']);
	$('input#buyPrice').val(machine.getData()[key]['buyPrice']);
	$('input#macLoadage').val(machine.getData()[key]['macLoadage']);
	$('input#macStdTemp').val(machine.getData()[key]['macStdTemp']);
	if(machine.getData()[key]['imagePath'] != null ) {
		var path = "${pageContext.request.contextPath}/images/machinemng/" + machine.getData()[key]['imagePath'];
		$('#img').attr('src', path);
		
	} else {
		var path = "${pageContext.request.contextPath}/images/noimage.png" ;
		$('#img').attr('src', path);
		
		
	}
	
	}); 
	 
	/* machine.on('scrollEnd', () => {
		machine.appendRows(getMachineMngList());
	}); */

	machine.on('check', (e) => {
		let rows = machine.getCheckedRowKeys(); 
		if(rows.length > 1) { 
			for(let i in rows){ 
				if(e.rowKey != rows[i]){ 
					machine.uncheck(rows[i]); 
					} 
				}
			}
		});
		
	//저장
	saveBtn.onclick = function (){ 
		 macCode1 = null;
		 if ($('input#macCode').val() == '' || $('input#macName').val() == '' || $('input#prcCode').val() == '' || $('input#macDiv').val() == '' || $('input#model').val() == '' || $('input#proOper').val() == '' || $('input#buyPrice').val() == '' ) {
			 $.toast({ 
				 text : "값을 입력 하세요.", 
				 showHideTransition : 'slide',
				 bgColor : 'red',
				 textColor : 'white',
				 allowToastClose : false,
				 hideAfter : 2000,
				 stack : 1,
				 textAlign : 'center',
				 position : 'top-center'
				 });
			 return null; 
			 }
		 
		 var form = new FormData(document.machineInfo);
		 if($("#file1")[0].files[0] != undefined){
			 form.append("file1", $("#file1")[0].files[0]);
		 } else {
			 form.append("file1", null);
		 }
		
         jQuery.ajax({
             url : "${pageContext.request.contextPath}/mac/machine/machineInsert"
           , type : "POST"
           , enctype: 'multipart/form-data'
           , processData : false
           , contentType : false
           , data : form
           , success:function(success) {
        	   alert("성공하였습니다.");
        	   console.log(success);
        	   machine.resetData(getMachineMngList()); 
        	   }
           ,error: function (jqXHR) { 
        	   alert("이미 존재하는 설비코드 입니다."); 
               }
           });
        
		 }
		
	//수정
	updateBtn.onclick = function (){ 
		macCode1=null;
		if ($('input#macCode').val() == '' || $('input#macName').val() == '') {
			$.toast({ 
				text : "값을 입력 하세요. !!", 
				showHideTransition : 'slide',
				bgColor : 'red',
				textColor : 'white',
				allowToastClose : false,
				hideAfter : 2000,
				stack : 1,
				textAlign : 'center',
				position : 'top-center'
				});
			return null; 
			}
			
		var form = new FormData(document.machineInfo);
		if($("#file1")[0].files[0] != undefined) {
			form.append("file1", $("#file1")[0].files[0]);
			} else {
				form.append("file1", null);
			}
		jQuery.ajax({
             url : "${pageContext.request.contextPath}/mac/machine/machineUpdate"
           , type : "POST"
           , enctype: 'multipart/form-data'
           , processData : false
           , contentType : false
           , data : form
           , success:function(success) {
               alert("성공하였습니다.");
               machine.resetData(getMachineMngList()); 
               
           }
           ,error: function (jqXHR) { 
               alert("이미 존재하는 설비코드 입니다."); 
           }
     });
		 machine.resetData(getMachineMngList()); 
	 }
	
	//삭제
	deleteBtn.onclick = function () { 
		macCode1 = null;
		let list = {macCode : machine.getCheckedRows()[0]['macCode']};
		
		$.ajax({
			async: false, 
			url : "machineDelete",
			type : "post",
			data : JSON.stringify(list),
			dataType: "json",
			contentType:"application/json",
			success : function(){
				
				alert("삭제 되었습니다.");
				
				}
			});
		 machine.resetData(getMachineMngList());
	}
	
	cs.onclick = function () {
		
		
			var path = "${pageContext.request.contextPath}/images/noimage.png" ;
			$('#img').attr('src', path);
		
		
	}
})


</script>
<style type="">
.tui-datetime-input {
	width: 100%;
}

.card .card-header span {
	margin-top: -6px;
}
</style>
</head>
<body>
	<div class="page-header">
		<div class="page-block">
			<div class="row align-items-center">
				<div class="col-md-8">
					<div class="page-header-title">
						<h5 class="m-b-10">설비 관리</h5>
					</div>
				</div>
				<div class="col-md-4">
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/main.do"> <i
								class="fa fa-home"></i>
						</a></li>
						<li class="breadcrumb-item">생산관리</li>
						<li class="breadcrumb-item"><a href="#!">설비관리</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 		123 -->
	<div class="pcoded-inner-content">
		<div class="main-body">
			<div class="page-wrapper">
				<div class="row">
					<div class="col-xl-6">
						<div class="card">
							<!-- 타이틀 -->

							<div id="title" class="card-header">
								<div class="row col-xl-12">
									<div class="d-inline-block col-xl-6">
										<ul>
											<li><h5>설비 List</h5></li>
										</ul>
									</div>
									<div class="d-inline-block text-right col-xl-6">
										<button id="saveBtn"
											class="btn btn-success waves-effect waves-light">저장</button>
										<button id="updateBtn"
											class="btn btn-info waves-effect waves-light">수정</button>
										<button id="deleteBtn"
											class="btn btn-danger waves-effect waves-light">삭제</button>
									</div>
								</div>
							</div>
							<div class="col-xl-12">
								<div id="machine"></div>
								<div style="height: 10px"></div>
							</div>
						</div>

						<!-- 타이틀 -->
						<div class="card">
							<div id="title" class="card-header">

								<ul>
									<li><h5>* 설비 이미지 등록</h5></li>

								</ul>
								<br />
								<form>
									<div class="form-group row">
										<div class="img_wrap"
											style="height: 370px; width: 85%; margin: 0 auto">
											<img id="img" style="height: 100%; width: 100%"
												src="${pageContext.request.contextPath}/images/noimage.png" />
										</div>
									</div>
									<div class="row col-xl-12">
										<div class="d-inline-block col-xl-9">
											<label for="file1"></label> <input type="file"
												class="form-control" id="file1" name="file1" />
										</div>
										<button type="reset" id="cs" class="btn">등록 해제</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="col-xl-6">
						<form id="machineInfo" name="machineInfo">
							<div class="card">
								<!-- 타이틀 -->
								<div id="title" class="card-header">
									<div class="row col-xl-12">
										<div class="d-inline-block col-xl-6">
											<ul>
												<li><h5>설비 자료</h5></li>
											</ul>
										</div>
										<div class="d-inline-block text-right col-xl-6">
											<button class="btn" type="reset">새 자료</button>
										</div>
									</div>
								</div>
								<table class="table">
									<tr>
										<th>설비코드 *</th>
										<td align="right"><input style="text-align: center"
											class="form-control" type="text" id="macCode" name="macCode" /></td>
									</tr>
									<tr>
										<th>공정코드 &nbsp; * <%@ include
												file="/WEB-INF/jsp/mes/common/modal/ProcessList.jsp"%></th>
										<td align="right"><input style="text-align: center;"
											class="form-control" type="hidden" id="prcCode"
											name="prcCode" /> <input style="text-align: center"
											class="form-control" type="text" id="prcName" name="prcName" /></td>
									</tr>
									<tr>
										<th>설비명 *</th>
										<td align="right"><input style="text-align: center"
											class="form-control" type="text" id="macName" name="macName" /></td>
									</tr>
									<tr>
										<th>사용 여부</th>
										<td align="right"><select id="use1" name="use1"
											class="form-control fill">
												<option value="사용">사용</option>
												<option value="미사용">미사용</option>
										</select></td>
									</tr>
									<tr>
										<th>설비구분 *</th>
										<td align="right"><input style="text-align: center"
											class="form-control" type="text" id="macDiv" name="macDiv" /></td>
									</tr>
									<tr>
										<th>모델명 *</th>
										<td align="right"><input style="text-align: center"
											class="form-control" type="text" id="model" name="model" /></td>
									</tr>
									<tr>
										<th>제작업체 *</th>
										<td align="right"><input style="text-align: center"
											class="form-control" type="text" id="proOper" name="proOper" /></td>
									</tr>
									<tr>
										<th>사용 작업자 &nbsp;<%@ include
												file="/WEB-INF/jsp/mes/common/modal/EmployeesList.jsp"%></th>
										<td align="right"><input style="text-align: center"
											class="form-control" type="text" id="empName" name="empName" /></td>
									</tr>
									<tr>
										<th>용도</th>
										<td align="right"><input style="text-align: center"
											class="form-control" type="text" id="use" name="use" /></td>
									</tr>
									<tr>
										<th>구매금액(만)*</th>
										<td align="right"><input style="text-align: center"
											class="form-control" type="text" id="buyPrice"
											name="buyPrice" /></td>
									</tr>
									<tr>
										<th>구매일자 *</th>
										<td align="right">
											<div
												class="tui-datepicker-input tui-datetime-input tui-has-focus">

												<input type="text" id="buyDate" name="buyDate"
													class=" form-control" aria-label="Date-Time"
													style="text-align: center;" /> <span class="tui-ico-date"></span>
											</div>
											<div id="date" style="margin-top: -1px;"></div>
										</td>
									</tr>
									<tr>
										<th>사용에너지</th>
										<td align="right"><input style="text-align: center"
											class="form-control" type="text" id="usingEnergy"
											name="usingEnergy" /></td>
									</tr>
									<tr>
										<th>부하율 (%)</th>
										<td align="right"><input style="text-align: center"
											class="form-control" type="text" id="macLoadage"
											name="macLoadage" /></td>
									</tr>
									<tr>
										<th>온도 (℃)</th>
										<td align="right"><input style="text-align: center"
											class="form-control" type="text" id="macStdTemp"
											name="macStdTemp" /></td>
									</tr>
								</table>

							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
    //이미지 미리보기
    var sel_file;
 
    $(document).ready(function() {
        $("#file1").on("change", handleImgFileSelect);
    });
 
    function handleImgFileSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
 
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
 
        filesArr.forEach(function(f) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }
 
            sel_file = f;
 
            var reader = new FileReader();
            reader.onload = function(e) {
                $("#img").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }
</script>

</body>
</html>
