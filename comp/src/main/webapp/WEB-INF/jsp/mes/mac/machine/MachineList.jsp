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
	let macName;
	let macCode;
	let macCode1;
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
	            element: '#buyDate1',
	            format: 'yyyy-MM-dd'
	        }
	    });

		// date 불러오는 친구 
		function getMachineMngList() {
			$.ajax({
				async : false,
				url : "${pageContext.request.contextPath}/MachineList",
				type : "get",
				data : {
					macName : macName,
					macCode1 : macCode1
				},
				dataType : "json",
				success : function(result) {
					if (result.length > 0) {
						macCode1 = result[result.length - 1].macCode1;
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
		
		$('input#macCode').val(machine.getData()[key]['macCode']);
		$('input#macName').val(machine.getData()[key]['macName']);
		$('input#use1').val(machine.getData()[key]['use1']);
		$('input#macDiv').val(machine.getData()[key]['macDiv']);
		$('input#model').val(machine.getData()[key]['model']);
		$('input#proOper').val(machine.getData()[key]['proOper']);
		$('input#empName').val(machine.getData()[key]['worker']);
		$('input#use').val(machine.getData()[key]['use']);
		$('input#usingEnergy').val(machine.getData()[key]['usingEnergy']);
		$('input#buyDate1').val(machine.getData()[key]['buyDate1']);
		$('input#buyPrice').val(machine.getData()[key]['buyPrice']);
		$('input#macLoadage').val(machine.getData()[key]['macLoadage']);
		$('input#macStdTemp').val(machine.getData()[key]['macStdTemp']);
		
		
		
		 }); 

		 
		 machine.on('check', (e) => {
				let rows = machine.getCheckedRowKeys(); 
				if(rows.length > 1) { 
					for(let i in rows){ 
						if(e.rowKey != rows[i]){ 
							machine.uncheck(rows[i]); 
							} 
						}
				}
			})
		 
		// 스크롤 엔드 함수 ***.on tui 에서 제공하는 함수다. 'scrollEnd'
		/* 	machinemng.on('scrollEnd', () => {
		 machinemng.appendRows(getMachineMngList());
		 });
		
		 // 왼쪽 메뉴 를 열고 할때 grid 를 화면길이를 재설정.
		 $('#mobile-collapse').click(function() {
		 machinemng.refreshLayout();
		 }); */

		/* search.onclick = function() {
			macCode = $("input#macCode").val();
			machinemng.resetData(getMachineMngList());
			$( 'input#macName' ).val(' ');
			$( 'input#use1' ).val(' ');
			$( 'input#macDiv' ).val(' ');
			$( 'input#model' ).val(' ');
			$( 'input#proOper' ).val(' ');	
			$( 'input#worker' ).val(' ');
			$( 'input#use' ).val(' ');
			$( 'input#buyPrice' ).val(' ');
			$( 'input#buyDate' ).val(' ');
			$( 'input#usingEnergy' ).val(' ');
			$( 'input#macLoadage' ).val(' ');
			$( 'input#macStdTemp' ).val(' ');
		} */

		// 체크하고 선택 했을때 불어 오는 값 

		/* 	sibalY.onclick= function() {
		 let gridData = grid4.getModifiedRows({});
		
		 gridData["ProcessResultVO"] ={
		 prcResDNum :prcResDNum,
		 prcState : grid4.getData()[0]['prcState'],
		 macCode : $('input#macCode').val(),
		 empId : $('input#empId').val()
		 }
		 $.ajax({
		 async: false, 
		 url : "resultSuccess",
		 type : "post",
		 data : JSON.stringify(gridData),
		 dataType: "json",
		 contentType:"application/json",
		 success : function(){
		 console.log("updatesuccess");
		 grid3.resetData(getProduceSelect(prdComDNum,prcCode))
		 grid.resetData(getProcessResulList());
		 }
		 });
		
		 } */

	})
</script>
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
						<li class="breadcrumb-item"><a href="index.jsp"> <i
								class="fa fa-home"></i>
						</a></li>
						<li class="breadcrumb-item"><a href="#!">주문관리</a></li>
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
								<ul>
									<li><h5>설비 데이터</h5></li>
									<br />
								</ul>
								<table class="table">
									<tr>
										<th>설비코드 *</th>
										<td align="right"><input style="text-align: center"
											class="form-control" type="text" id="macCode" name="macCode" /></td>
									</tr>
									<tr>
										<th>설비명</th>
										<td align="right"><input style="text-align: center"
											class="form-control" type="text" id="macName" name="macName" /></td>
									</tr>
									<tr>
										<th>사용 여부</th>
										<td align="right"><input style="text-align: center"
											class="form-control" type="text" id="use1" name="use1" /></td>
									</tr>
									<tr>
										<th>설비구분</th>
										<td align="right"><input style="text-align: center"
											class="form-control" type="text" id="macDiv" name="macDiv" /></td>
									</tr>
									<th>모델명</th>
									<td align="right"><input style="text-align: center"
										class="form-control" type="text" id="model" name="model" /></td>
									</tr>
									<tr>
										<th>제작업체</th>
										<td align="right"><input style="text-align: center"
											class="form-control" type="text" id="proOper" name="proOper" /></td>
									</tr>
									<tr>
										<th>사용 작업자 &nbsp;<%@ include
												file="/WEB-INF/jsp/mes/common/modal/EmployeesList.jsp"%></th>
										<td align="right"><input style="text-align: center"
											class="form-control" type="text" id="empName" name="empName"></td>
									</tr>
									<tr>
										<th>용도</th>
										<td align="right"><input style="text-align: center"
											class="form-control" type="text" id="use" name="use" /></td>
									</tr>
									<tr>
										<th>구매금액</th>
										<td align="right"><input style="text-align: center"
											class="form-control" type="text" id="buyPrice"
											name="buyPrice" /></td>
									</tr>
									<tr>
										<th>구매일자</th>
										<td align="right">
											<div
												class="tui-datepicker-input tui-datetime-input tui-has-focus">
												<input type="text" id="buyDate1" name="buyDate1"
													class=" form-control" aria-label="Date-Time" /> <span
													class="tui-ico-date"></span>
											</div>
											<div id="date" style="margin-top: -1px;"></div></td>
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
						</div>
					</div>

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
										<button class="btn btn-success waves-effect waves-light">저장</button>
										<button class="btn btn-danger waves-effect waves-light">삭제</button>
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
								<div class="form-group row">
									<div class="img_wrap"
										style="height: 370px; width: 85%; margin: 0 auto">
										<img id="img" style="height: 100%; width: 100%"
											src="${pageContext.request.contextPath}/images/noimage.png" />
									</div>

								</div>
								<div class="row col-xl-12">
									<div class="d-inline-block col-xl-6">
										<label for="file1"></label> <input type="file" id="file1"
											name="file1">
									</div>
									<div class="d-inline-block text-right col-xl-6">
										<button class="btn" id="btn_submit"
											onclick="javascript:fn_submit()" style="">전송</button>
									</div>
								</div>
							</div>
						</div>
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

	<script>
//파일 업로드
function fn_submit(){
        
        var form = new FormData();
        form.append( "file1", $("#file1")[0].files[0] );
        
         jQuery.ajax({
             url : "${pageContext.request.contextPath}/result"
           , type : "POST"
           , processData : false
           , contentType : false
           , data : form
           , success:function(success) {
               alert("성공하였습니다.");
               console.log(success);
           }
           ,error: function (jqXHR) 
           { 
               alert(jqXHR.responseText); 
           }
       });
}
</script>
</body>
</html>
